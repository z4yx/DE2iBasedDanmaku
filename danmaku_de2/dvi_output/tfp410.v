/*
--创建日期   : 2015-05-17
--目标芯片   : EP4CE22F17C8
--时钟选择   : odck_in<=165MHz
--演示说明   : odck为像素时钟，v/hsync为同步信号，de为数据有效信号，pixel_*为像素颜色信号
*/
module tfp410(
input wire rst,

input wire odck_in,
input wire vsync_in,
input wire hsync_in,
input wire de_in,
input wire[7:0] pixel_r_in,
input wire[7:0] pixel_g_in,
input wire[7:0] pixel_b_in,

output wire pixel_clk_o,
output wire vsync_o,
output wire hsync_o,
output wire de_o,
output wire[4:0] pixel_r_o,
output wire[5:0] pixel_g_o,
output wire[4:0] pixel_b_o

);

assign pixel_clk_o = odck_in;
assign vsync_o = vsync_in;
assign hsync_o = hsync_in;
assign de_o = de_in;
assign pixel_r_o = pixel_r_in[7:3];
assign pixel_g_o = pixel_g_in[7:2];
assign pixel_b_o = pixel_b_in[7:3];


endmodule