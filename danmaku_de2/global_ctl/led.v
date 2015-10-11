/*
--创建日期   : 2015-05-16
--目标芯片   : EP4CE22F17C8
--时钟选择   : gclk=25MHz
--演示说明   : rst全局复位低有效，status_led接LED，为gclk的25M分频
*/
module led(
input wire clk,
input wire rst,
output reg status_led
);

reg [25:0] cnt;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        // reset
        status_led <= 1'd0;
        cnt <= 1'd0;
    end
    else if (cnt==12500000) begin
        status_led <= ~status_led;
        cnt <= 1'd0;
    end
    else
        cnt <= cnt+1'd1;
end

endmodule
