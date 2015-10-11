/*
--创建日期   : 2015-06-15
--目标芯片   : EP4CE22F17C8
--时钟选择   : pxlClk<=165MHz
--演示说明   : rst全局复位低有效，h/vsync为同步信号输入，de为像素有效输入，
              h/vsync_o为校正后同步信号输出，de为像素有效输出
*/
module syncCorrector(
  input wire pxlClk,
  input wire rst,
  
  input wire vsync,
  input wire hsync,
  input wire de,
  
  output wire vsync_o,
  output wire hsync_o,
  output wire de_o
);

reg normalVsync, normalHsync;

assign de_o = de;
assign hsync_o = normalHsync == hsync;
assign vsync_o = normalVsync == vsync;

always @(posedge pxlClk or negedge rst) begin
  if(!rst)begin
    normalHsync <= 1'b1;
    normalVsync <= 1'b1;
  end else begin
    if (de) begin
      normalHsync <= hsync;
      normalVsync <= vsync;
    end
  end
end

endmodule