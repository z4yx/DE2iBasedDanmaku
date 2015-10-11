/*
--创建日期   : 2015-05-23
--目标芯片   : EP4CE22F17C8
--时钟选择   : gclk=25MHz
--演示说明   : rst全局复位低有效，slave_scl,slave_sda与信号源的CDC接口连接，
              master_scl,master_sda与显示器CDC接口连接，edid_init为EDID读取请求，
              edid_ok为EDID读取完成指示
*/
module edid_process(
input wire gclk,
input wire rst,

input wire slave_scl,
inout wire slave_sda,

output wire master_scl,
inout wire master_sda,

input wire edid_init,
output reg edid_ok
);


wire wr, rd;
reg ready_wr, ready_rd;
reg[7:0] rdaddress;
reg[7:0] data_in;
wire[7:0] data_out, q;
wire ready;
assign ready = ready_wr|ready_rd;
i2c_slave ddc_slave(
    rst,
    gclk,
    slave_scl,
    slave_sda,
    data_in,
    data_out,
    wr,
    rd,
    ready
);

wire master_ready, master_idle;
reg master_rw, master_start, master_stop, master_next, master_nak;
reg[7:0] master_wdata;
wire[7:0] master_rdata;

reg[7:0] edid_waddr;
reg[7:0] edid_wdata;
reg edid_wren;

i2c_master adv_master(
    .rst(rst),
    .clk(gclk),
    .scl_io(master_scl),
    .sda_io(master_sda),
    .device_addr(8'hA0),
    .rw(master_rw),
    .start(master_start),
    .stop(master_stop),
    .next(master_next),
    .is_nak(master_nak),
    .data_send(master_wdata),
    .data_recv(master_rdata),
    .ready_to_rw(master_ready),
    .is_idle(master_idle)
);


edid_mem edid_mem1(
    gclk,
    edid_wdata,//data,
    rdaddress,
    edid_waddr,//wraddress,
    edid_wren,//wren,
    q);


// defparam edid_mem1.lpm_hint =
//  "ENABLE_RUNTIME_MOD = YES, INSTANCE_NAME = edid_mem1";

always @(posedge gclk or negedge rst) begin
    if(!rst)begin
        rdaddress<=0;
        ready_wr<=0;
        ready_rd<=0;
    end 
    else begin
        if(wr&&!ready_wr)begin
            rdaddress <= data_out;
            ready_wr <= 1;
        end
        else if(!wr&&ready_wr) begin
            ready_wr <= 0;
        end
        else if(rd&&!ready_rd)begin
            rdaddress <= rdaddress+1'b1;
            data_in <= q;
            ready_rd <= 1;
        end
        else if(!rd&&ready_rd) begin
            ready_rd <= 0;
        end
    end
end

reg init_running;
reg[3:0] init_read_state;
always @(posedge gclk or negedge rst) begin
    if (!rst) begin
        init_running <= 0;
        edid_wren <= 0;
        master_start <= 0;
        master_stop <= 0;
        master_next <= 0;
        edid_ok <= 0;
    end
    else if (edid_init && init_running=='b0) begin
        init_running <= 'd1;
        init_read_state <= 0;
        edid_ok <= 0;
    end
    else if (init_running=='b1) begin
        case(init_read_state) 
            0: begin
                if(master_idle)begin
                    master_stop <= 0;
                    master_rw <= 0;
                    master_start <= 1;
                    init_read_state <= 1;
                end
            end
            1: begin
                if(!master_idle)begin
                    master_start <= 0;
                end
                if(master_ready)begin //Wait for setup
                    master_wdata<=8'h0;
                    master_next <= 1;
                    init_read_state <= 2;
                end
            end
            2: begin
                master_next <= 0;
                init_read_state <= 3;
            end
            3: begin
                if(master_ready)begin //Wait for reg addr writing
                    master_rw <= 1;
                    master_start <= 1; //Repeat setup for reading
                    init_read_state <= 4;
                end
            end
            4: begin
                if(!master_idle)begin
                    edid_waddr <= 8'h0;
                    master_start <= 0;
                    init_read_state <= 5;
                end
            end
            5: begin
                if(master_ready)begin
                    master_nak <= edid_waddr == 'd255;
                    master_next <= 1; //Read reg
                    init_read_state <= 6;
                end
            end
            6: begin
                master_next <= 0;
                init_read_state <= 7;
            end
            7: begin
                if(master_ready)begin
                    edid_wdata <= master_rdata;
                    edid_wren <= 1'b1;
                    init_read_state <= 8;
                end
            end
            8: begin
                edid_wren <= 1'b0;
                if(edid_waddr == 'd255)begin
                    master_stop <= 1;
                    init_running <= 'b0;
                    edid_ok <= 1;
                end
                else begin
                    edid_waddr <= edid_waddr+1'b1;
                    init_read_state <= 5;    //continue reading next byte            
                end
            end
        endcase
    end
end


endmodule
