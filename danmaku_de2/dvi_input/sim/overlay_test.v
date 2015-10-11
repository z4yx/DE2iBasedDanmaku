`timescale 1 ns/ 1 ns
module overlay_test(

);
parameter h_visible = 1024;
parameter h_fporch_end = h_visible+24;
parameter h_sync_end = h_fporch_end+136;
parameter h_bporch_end = h_sync_end+160;
parameter v_visible = 768;
parameter v_fporch_end = v_visible+3;
parameter v_sync_end = v_fporch_end+6;
parameter v_bporch_end = v_sync_end+29;

reg pause,noDebug;

reg pixel_clk, feeder_clk;
reg rst;
wire hsync, vsync, de;

initial begin
    feeder_clk=0;
    pixel_clk=0;
    noDebug=0;
    pause=0;
    rst = 0;
    #10 rst=1;
end

always begin
    #10 pixel_clk = ~pixel_clk; //50MHz
end

always begin
    #8 feeder_clk = ~feeder_clk; //faster than pixel clock
end

vga vga1(
.pixel_clk(pixel_clk),
.rst(rst),
.hsync(hsync),
.vsync(vsync),
.visible_area(de),
.hcnt(),
.vcnt()
);
defparam vga1.h_visible = h_visible;
defparam vga1.h_fporch_end = h_fporch_end;
defparam vga1.h_sync_end = h_sync_end;
defparam vga1.h_bporch_end = h_bporch_end;
defparam vga1.v_visible = v_visible;
defparam vga1.v_fporch_end = v_fporch_end;
defparam vga1.v_sync_end = v_sync_end;
defparam vga1.v_bporch_end = v_bporch_end;

wire[31:0] fifoData;
wire fifoRdclk,fifoRdreq,fifoRdEmpty;

wire pixel_clk_o;
wire vsync_o;
wire hsync_o;
wire de_o;
wire[7:0] pixel_r_o;
wire[7:0] pixel_g_o;
wire[7:0] pixel_b_o;

danmaku_overlay overlay1(
  .rst(rst),

  .scdt_in(1'b1),
  .odck_in(pixel_clk),
  .vsync_in(vsync),
  .hsync_in(hsync),
  .de_in(de),
  .pixel_r_in(8'hff),
  .pixel_g_in(8'hff),
  .pixel_b_in(8'hff),
  .fifoData_in(fifoData),
  .fifoRdEmpty(fifoRdEmpty),
  .noDebug(noDebug), 

  .pixel_clk_o(pixel_clk_o),
  .vsync_o(vsync_o),
  .hsync_o(hsync_o),
  .de_o(de_o),
  .pixel_r_o(pixel_r_o),
  .pixel_g_o(pixel_g_o),
  .pixel_b_o(pixel_b_o),
  .fifoRdclk(fifoRdclk),
  .fifoRdreq(fifoRdreq)

);

test_img_feeder feeder1(
  .rst(rst),
  .clk(feeder_clk),

  .fifoData_out(fifoData),
  .fifoRdclk(fifoRdclk),
  .fifoRdreq(fifoRdreq),
  .fifoRdempty(fifoRdEmpty),
  
  .pause(pause)
);

endmodule