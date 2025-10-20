module glitch_free_clock_gate(
    input clk,
    input reset,
    input enable,
    output gated_clk
);

reg enable_ff;

always @(posedge clk or posedge reset)
begin
    if (reset)
        enable_ff <= 0;
    else
        enable_ff <= enable;
end

assign gated_clk = clk & enable_ff;

endmodule
