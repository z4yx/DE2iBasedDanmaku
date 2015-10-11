/*
--创建日期   : 2015-05-05
--目标芯片   : EP4CE22F17C8
--时钟选择   : pixel_clk=25MHz
--演示说明   : rst全局复位低有效，h/vcnt为当前像素位置输出，h/vsync为同步信号输出，
              visible_area为显示区域有效输出
*/
module vga(
input wire pixel_clk,
input wire rst,
output wire hsync,
output wire vsync,
output wire visible_area,
output reg[12:0] hcnt,
output reg[12:0] vcnt
);
parameter h_visible = 640;
parameter h_fporch_end = h_visible+16;
parameter h_sync_end = h_fporch_end+96;
parameter h_bporch_end = h_sync_end+48;

parameter v_visible = 480;
parameter v_fporch_end = v_visible+10;
parameter v_sync_end = v_fporch_end+2;
parameter v_bporch_end = v_sync_end+33;

assign hsync = (hcnt>=h_fporch_end&&hcnt<h_sync_end) ? 0 : 1;
assign vsync = (vcnt>=v_fporch_end&&vcnt<v_sync_end) ? 0 : 1;

assign visible_area = (hcnt<h_visible&&vcnt<v_visible) ? 1 : 0;

always @(posedge pixel_clk or negedge rst) begin
    if (!rst) begin
        hcnt<=0;
        vcnt<=0;
    end
    else begin
        if (hcnt == h_bporch_end-1) begin
            hcnt <= 0;
            vcnt <= (vcnt == v_bporch_end-1) ? 0 : vcnt+1;
        end
        else begin
            hcnt<=hcnt+1;
        end
    end
end

endmodule