/*
--创建日期   : 2015-05-12
--目标芯片   : EP4CE22F17C8
--时钟选择   : clk=25MHz
--演示说明   : rst全局复位低有效，scl_io,sda_io接I2C从机，
              device_addr为设备地址设置，rw为读写选择，
              start为传输开始请求，stop为传输终止请求，
              next为下一字节起始请求，is_nak为NAK应答选择，
              data_send为需要发送的数据，data_recv为收到的数据，
              ready_to_rw为准备好指示，is_idle总线空闲指示
*/
module i2c_master(
    input wire rst,
    input wire clk,

    inout scl_io,
    inout sda_io,

    input wire[7:0] device_addr,
    input wire rw,

    input wire start,
    input wire stop,
    input wire next,
    input wire is_nak,
    input wire[7:0] data_send,
    output reg[7:0] data_recv,
    output wire ready_to_rw,
    output wire is_idle

);

parameter START_DELAY=250;
parameter STOP_DELAY=250;
parameter SCL_DELAY=200;

`define S_IDLE     4'b000
`define S_ADDR     4'b001
`define S_WAITING  4'b010
`define S_STOP    4'b011
`define S_STOP2   4'b100
`define S_WDATA    4'b101
`define S_PREP_RW  4'b110
`define S_DELAY    4'b111
`define S_RDATA    4'b1000
`define S_START    4'b1001
`define S_STOP3    4'b1010
`define S_G_START  4'b1011
`define S_REPEAT_START 4'b1100

reg sda_ctl, scl_ctl, is_ctl;
reg scl;
reg sda;
assign sda_io = !(is_ctl ? sda_ctl : sda) ? 1'b0 : 1'bz;
assign scl_io = !(is_ctl ? scl_ctl : scl) ? 1'b0 : 1'bz;

wire internal_sda;
assign internal_sda = is_ctl ? sda_ctl : sda;

reg[3:0] state, delay_next;
reg[8:0] data_buf, read_buf;
reg[7:0] delay_counter;
reg cur_rw;

// reg[1:0] start_det, next_det;

reg[3:0] scl_clocks, remain_clocks;
reg trans_start;

assign is_idle = state==`S_IDLE;
assign ready_to_rw = state==`S_PREP_RW;

// always @(posedge clk or negedge rst) begin
//     if (!rst) begin
//         start_det <= 2'b00;
//         next_det <= 2'b00;
//     end
//     else begin
//         start_det <= {start_det[0], start};
//         next_det <= {next_det[0], next};
//     end
// end

// wire posedge_start, posedge_next;
// assign posedge_start = !start_det[1]&&start_det[0];
// assign posedge_next = !next_det[1]&&next_det[0];

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        state <= `S_IDLE;
        is_ctl <= 1;
        sda_ctl <= 1;
        scl_ctl <= 1;
        scl_clocks <= 0;
        trans_start <= 0;
    end
    else begin
        case(state)
        `S_IDLE: begin
            is_ctl <= 1;
            scl_ctl <= 1;
            sda_ctl <= 1;
            if(start) begin
                state<=`S_G_START;
            end
        end
        `S_G_START:begin
            sda_ctl<=1'b0; //START Bit
            delay_counter<=START_DELAY;
            delay_next<=`S_START;
            state<=`S_DELAY;
        end
        `S_START:begin
            scl_ctl<=1'b0;
            delay_counter<=START_DELAY;
            delay_next<=`S_ADDR;
            state<=`S_DELAY;
        end
        `S_ADDR:begin
            is_ctl<=0;
            cur_rw<=rw;
            data_buf<={device_addr[7:1],rw,1'b1};//One clock for ACK
            scl_clocks<=4'd9;
            trans_start<=1'b1;
            state<=`S_WAITING;
        end
        `S_PREP_RW: begin
            if(next)begin
                state<=cur_rw?`S_RDATA:`S_WDATA;
            end else if(stop) begin
                state<=`S_STOP;
            end else if(start) begin
                scl_ctl <= 1'b0;
                sda_ctl <= 1'b1;
                is_ctl <= 1'b1;
                delay_counter<=START_DELAY;
                delay_next<=`S_REPEAT_START;
                state<=`S_DELAY;
            end
        end
        `S_REPEAT_START: begin
            scl_ctl <= 1'b1;
            delay_counter<=START_DELAY;
            delay_next<=`S_G_START;
            state<=`S_DELAY;
        end
        `S_WDATA: begin
            data_buf<={data_send,1'b1};//One clock for ACK
            scl_clocks<=4'd9;
            trans_start<=1'b1;
            state<=`S_WAITING;
        end
        `S_RDATA: begin
            data_buf<={{8{1'b1}},is_nak};//One clock for ACK
            scl_clocks<=4'd9;
            trans_start<=1'b1;
            state<=`S_WAITING;
        end
        `S_WAITING: begin
            if(trans_start == 1'b1)begin
                trans_start <= 1'b0;
            end else if(remain_clocks==0)begin
                state<=`S_PREP_RW;
                data_recv<=read_buf[8:1];
            end
        end
        `S_STOP: begin
            scl_ctl <= 1'b0;
            sda_ctl <= 1'b0;
            is_ctl <= 1'b1;
            delay_counter<=STOP_DELAY;
            delay_next<=`S_STOP2;
            state<=`S_DELAY;
        end
        `S_STOP2: begin
            scl_ctl <= 1'b1;
            delay_counter<=STOP_DELAY;
            delay_next<=`S_STOP3;
            state<=`S_DELAY;
        end
        `S_STOP3: begin
            sda_ctl <= 1'b1; //STOP Bit
            delay_counter<=STOP_DELAY;
            delay_next<=`S_IDLE;
            state<=`S_DELAY;
        end


        `S_DELAY: begin
            if(delay_counter==8'd0)begin
                state<=delay_next;
            end else begin
                delay_counter <= delay_counter-1'b1;
            end
        end
        endcase
    end
end

reg[7:0] scl_counter;
reg[1:0] scl_state;
`define SCL_S_0 2'd0
`define SCL_S_1 2'd1
`define SCL_S_2 2'd2
`define SCL_S_3 2'd3
//Generating SCL signals
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        remain_clocks <= 0;
        scl_counter <= 0;
        scl_state <= 0;
        scl <= 0;
    end
    else if (trans_start == 1'b1)begin
        remain_clocks <= scl_clocks;
    end
    else if (scl_counter==8'b0 && remain_clocks>0) begin
        case (scl_state)
            `SCL_S_0: begin
                scl<=0;
                scl_counter<=SCL_DELAY;
                scl_state<=`SCL_S_2;
            end
            // `SCL_S_1: begin
            //     sda<=data_buf[remain_clocks-1'b1];
            //     scl_counter<=SCL_DELAY;
            //     scl_state<=`SCL_S_2;
            // end
            `SCL_S_2: begin
                scl<=1;
                scl_counter<=SCL_DELAY;
                scl_state<=`SCL_S_3;
            end
            `SCL_S_3: begin
                scl<=0;
                remain_clocks<=remain_clocks-1'b1;
                scl_state<=`SCL_S_0;
            end
        endcase
    end else begin
        scl_counter <= scl_counter-1'b1;
        if(scl_counter==SCL_DELAY/2)begin
            if(scl_state==`SCL_S_2)
                sda<=data_buf[remain_clocks-1'b1];
            else if(scl_state==`SCL_S_3)
                read_buf[remain_clocks-1'b1]<=sda_io;
        end
    end
end

endmodule