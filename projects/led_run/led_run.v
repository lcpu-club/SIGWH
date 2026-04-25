module led_blink (
    input       clk,      // 系统时钟，125MHz
    output reg  led       // 输出 LED
);

reg [31:0] cnt;  // 计数器


always @(posedge clk) begin
    
    if (cnt >= 125000000) begin
        cnt <= 0;
        led <= ~led;   // 翻转 LED 状态
    end
    else begin
        cnt <= cnt + 1;
    end
end


endmodule