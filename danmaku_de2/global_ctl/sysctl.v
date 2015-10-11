/*
--创建日期   : 2015-05-23
--目标芯片   : EP4CE22F17C8
--时钟选择   : gclk=25MHz
--演示说明   : rst全局复位低有效，pc_scdt与信号源有效输入，
              monitor_hpd与显示器HPD接口连接，pc_hpd与信号源HPD接口连接，
              edid_init为EDID读取请求，edid_read_ok为EDID读取完成输入，
              default_image为默认图像输出使能
*/
module sysctl(
    input wire gclk,
    input wire rst,
    input wire pc_scdt,
    input wire monitor_hpd,
    input wire edid_read_ok,
    output wire pc_hpd,
    output reg edid_init,
    output wire default_image
);

// reg[1:0] hpd_detect;
// wire hpd_posedge;
// assign hpd_posedge = !hpd_detect[1] && hpd_detect[0];

// always @(posedge clk or negedge rst) begin
//     if (!rst) begin
//         hpd_detect <= 2'b0;
//     end
//     else begin
//         hpd_detect <= {hpd_detect[0], monitor_hpd};
//     end
// end


`define SYS_NO_MONITOR 4'd0
`define SYS_READ_EDID  4'd1
`define SYS_WAIT_EDID  4'd2
`define SYS_MONITOR_ON 4'd3
`define SYS_DELAY      4'd4

reg[20:0] delay_counter;
reg[2:0] sys_state, next_state;

assign default_image = !pc_scdt;
assign pc_hpd = sys_state==`SYS_MONITOR_ON;

always @(posedge gclk or negedge rst) begin
    if (!rst) begin
        edid_init <= 1'b0;
        sys_state <= `SYS_NO_MONITOR;
        next_state <= `SYS_NO_MONITOR;
    end
    else begin
        case(sys_state)
        `SYS_NO_MONITOR:
        begin
            if(monitor_hpd)begin
                delay_counter <= 'd1250000;
                sys_state <= `SYS_DELAY;
                next_state <= `SYS_READ_EDID;
            end
        end
        `SYS_READ_EDID:
        begin
            if(!monitor_hpd)begin
                sys_state <= `SYS_NO_MONITOR;
            end else begin
                edid_init <= 'b1;
                sys_state <= `SYS_WAIT_EDID;
            end
        end
        `SYS_WAIT_EDID:
        begin
            edid_init <= 'b0;
            if(!monitor_hpd)begin
                sys_state <= `SYS_NO_MONITOR;
            end else if(edid_read_ok) begin
                sys_state <= `SYS_MONITOR_ON;
            end
        end
        `SYS_MONITOR_ON:
        begin
            if(!monitor_hpd)begin
                sys_state <= `SYS_NO_MONITOR;
            end
        end
        `SYS_DELAY:
        begin
            if(delay_counter == 'd1)
                sys_state <= next_state;
            else
                delay_counter <= delay_counter-'d1;
        end
        endcase
    end
end
endmodule