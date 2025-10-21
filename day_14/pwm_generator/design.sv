module pwm_generator (
    input clk,
    input reset,
    input [7:0] duty,   // duty cycle: 0–255
    output reg pwm_out
);

reg [7:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset)
        counter <= 8'd0;
    else
        counter <= counter + 1'b1;
end

always @(posedge clk or posedge reset) begin
    if (reset)
        pwm_out <= 1'b0;
    else
        pwm_out <= (counter < duty) ? 1'b1 : 1'b0;
end

endmodule
