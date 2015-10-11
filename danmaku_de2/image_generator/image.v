/*
--创建日期   : 2015-05-05
--目标芯片   : EP4CE22F17C8
--时钟选择   : pixel_clk<=165MHz
--演示说明   : rst全局复位低有效，
              h/vcnt为当前像素位置输出，h/vsize为图像尺寸输出，
              pixel_*_out为像素输出
*/
module image(
input wire pixel_clk,
input wire rst,
input wire[11:0] hcnt,
input wire[11:0] vcnt,
input wire[11:0] hsize,
input wire[11:0] vsize,
output reg[7:0] pixel_r_out,
output reg[7:0] pixel_g_out,
output reg[7:0] pixel_b_out,
output reg[7:0] pixel_a_out
);

reg clk_move;
reg[18:0] cnt_clk;

always @(posedge pixel_clk or negedge rst) begin
    if (!rst) begin
        clk_move<=1;
        cnt_clk<=0;
    end
    else if (cnt_clk == 100000-1) begin
        cnt_clk<=0;
        clk_move<=~clk_move;
    end
    else begin
        cnt_clk<=cnt_clk+1;
    end
end

reg [11:0] x,y;

reg [2:0] color;
wire [7:0] r_val, b_val, g_val;
assign r_val = color[2]?8'hff:0;
assign g_val = color[1]?8'hff:0;
assign b_val = color[0]?8'hff:0;

assign in_area = (x>=vcnt?x-vcnt<=4:vcnt-x<=4)&&(y>=hcnt?y-hcnt<=4:hcnt-y<=4);

always @(posedge pixel_clk or negedge rst) begin
    if (!rst) begin
        pixel_r_out<=0;
        pixel_g_out<=0;
        pixel_b_out<=0;
        pixel_a_out<=0;
    end
    else begin
        {pixel_r_out,pixel_g_out,pixel_b_out} <= 
            in_area/*(vcnt==x&&hcnt==y)*/ ? {r_val,g_val,b_val} : 0;
        pixel_a_out <= in_area ? 8'hff : 8'h0;
    end
end

reg dir_x, dir_y;
wire rev_dir_x, rev_dir_y;

assign rev_dir_x = ~dir_x;
assign rev_dir_y = ~dir_y;

always @(posedge clk_move or negedge rst) begin
    if (!rst) begin
        x<=0;
        y<=0;
        dir_x<=0;
        dir_y<=0;
        color<=0;
    end
    else begin
        if (x==vsize-1 || x==0 || y==hsize-1 || y==0) begin
            color<=(color==3'b111) ? 1'd1 : color+1'd1;
        end
        if (x==vsize-1 || x==0) begin
            dir_x<=rev_dir_x;
            x<=rev_dir_x?x+1'd1:x-1'd1;
        end
        else begin
            x<=dir_x?x+1'd1:x-1'd1;
        end
        if (y==hsize-1 || y==0) begin
            dir_y<=rev_dir_y;
            y<=rev_dir_y?y+1'd1:y-1'd1;
        end
        else begin
            y<=dir_y?y+1'd1:y-1'd1;
        end
    end
end

endmodule