module lfsr (
    input clk,
    input reset,
    output reg [3:0] out
);

wire feedback;

assign feedback = out[3] ^ out[2]; // taps at bit3 and bit2 (x⁴ + x³ + 1)

always @(posedge clk or posedge reset)
begin
    if (reset)
        out <= 4'b0001;   // seed value (must be non-zero)
    else
        out <= {out[2:0], feedback}; // shift left, insert feedback bit
end

endmodule
