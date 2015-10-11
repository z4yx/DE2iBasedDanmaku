/*
--创建日期   : 2015-05-09
--目标芯片   : EP4CE22F17C8
--时钟选择   : sys_clk=25MHz
--演示说明   : rst全局复位低有效，scl,sda_io接I2C主机，
              data_out为需要发送的数据，data_in为收到的数据，
              wr为收到写指示，rd为收到读指示，
              ready为准备好指示
*/
module i2c_slave(
    input wire rst,
    input wire sys_clk,
    input wire scl,
    inout sda_io,
    input wire[7:0] data_in,
    output reg[7:0] data_out,
    output reg wr,
    output reg rd,
    input wire ready
);

parameter SLAVE_ADDR=8'hA0;

wire posedge_scl, posedge_sda;
wire negedge_scl, negedge_sda;
reg[1:0] scl_det, sda_det;
reg[2:0] cur_bit;
reg[3:0] state;

reg sda;
assign sda_io = !sda ? 1'b0 : 1'bz; //Emulate OC

reg[6:0] inter_address;
reg[7:0] inter_data;
reg inter_wrrd;

`define S_IDLE     4'b000
`define S_ADDR     4'b001
`define S_WRRD     4'b010
`define S_ACK_S    4'b011
`define S_ACK_S2   4'b100
`define S_DATA     4'b101
`define S_PREP_RW  4'b110
`define S_WDATA    4'b111
`define S_POST_W   4'b1000
`define S_PRE_R    4'b1001
`define S_RDATA    4'b1010
`define S_ACK_M    4'b1011
`define S_ACK_M2   4'b1100
`define S_M_NAK    4'b1101

always @(posedge sys_clk or negedge rst) begin
    if (!rst) begin
        scl_det <= 2'b11;
        sda_det <= 2'b11;
    end
    else begin
        scl_det <= {scl_det[0], scl};
        sda_det <= {sda_det[0], sda_io};
    end
end

assign posedge_scl = !scl_det[1]&&scl_det[0];
assign negedge_scl = scl_det[1]&&!scl_det[0];
assign posedge_sda = !sda_det[1]&&sda_det[0];
assign negedge_sda = sda_det[1]&&!sda_det[0];

always @(posedge sys_clk or negedge rst) begin
    if (!rst) begin
        // reset
        state <= `S_IDLE;
        cur_bit <= 0;
        inter_address <= 0;
        inter_data <= 0;
        inter_wrrd <= 0;
        sda <= 1'b1;
        wr <= 1'b0;
        rd <= 1'b0;
        data_out <= 1'b0;
    end
    else if(posedge_sda&&scl) begin //Stop bit
        state <= `S_IDLE;
    end
    else if(negedge_sda&&scl) begin //Start bit
        cur_bit <= 3'd0;
        state <= `S_ADDR;
    end
    else begin
        case(state)
        `S_ADDR:
        begin
            if(posedge_scl) begin
                inter_address <= {inter_address[5:0],sda_io};
                if(cur_bit == 3'd6) begin
                    state <= `S_WRRD;
                end else begin
                    cur_bit <= cur_bit+3'd1;
                end
            end
        end
        `S_WRRD:
        begin
            if(posedge_scl) begin
                inter_wrrd <= sda_io;
                if(inter_address == SLAVE_ADDR[7:1])
                    state <= `S_ACK_S;
                else begin
                    state <= `S_IDLE;
                end
            end
        end
        `S_ACK_S:
        begin
            if(negedge_scl) begin
                sda <= 1'b0; //Send ACK
                state <= `S_ACK_S2;
            end
        end
        `S_ACK_S2:
        begin
            if(negedge_scl) begin
                sda <= 1'b1; //Release SDA
                state <= `S_PREP_RW;
            end
        end
        `S_PREP_RW:
        begin
            cur_bit <= 3'd0;
            state <= inter_wrrd ? `S_PRE_R : `S_WDATA;
            wr <= 1'b0;
            rd <= inter_wrrd ? 1'b1 : 1'b0;
        end
        `S_WDATA:
        begin
            if(posedge_scl) begin
                inter_data <= {inter_data[6:0],sda_io};
                if(cur_bit == 3'd7) begin
                    data_out <= {inter_data[6:0],sda_io};
                    wr <= 1'b1;
                    state <= `S_ACK_S;
                end else begin
                    cur_bit <= cur_bit+3'd1;
                end
            end
        end
        `S_PRE_R:
        begin
            if(ready)begin
                rd <= 1'b0;
                inter_data <= {data_in[6:0],1'b0};
                sda <= data_in[7];
                state <= `S_RDATA;
                cur_bit <= 3'd1;
            end
        end
        `S_RDATA:
        begin
            if(negedge_scl) begin
                sda <= inter_data[7];
                inter_data <= inter_data << 1;
                if(cur_bit == 3'd7) begin
                    state <= `S_ACK_M;
                end else begin
                    cur_bit <= cur_bit+3'd1;
                end
            end
        end
        `S_ACK_M:
        begin
            if(posedge_scl)begin
            end
            if(negedge_scl)begin
                sda <= 1'b1; //Wait for ACK
                state <= `S_ACK_M2;
            end
        end
        `S_ACK_M2:
        begin
            if(posedge_scl) begin
                if(sda_io) //Got NAK from master
                    state <= `S_M_NAK;
            end
            if(negedge_scl) begin
                state <= `S_PREP_RW;
            end
        end
        `S_M_NAK:
        begin
            //Just wait for STOP
        end
        endcase
    end
end

endmodule