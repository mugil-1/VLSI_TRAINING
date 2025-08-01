module alu_4bit (
    input  [3:0] A, B,
    input  [2:0] sel,
    output reg [7:0] result
);

always @(*) begin
    case (sel)
        3'b000: result = A + B;
        3'b001: result = A - B;
        3'b010: result = A & B;
        3'b011: result = A | B;
        3'b100: result = A ^ B;
        3'b101: result = A << 1;
        3'b110: result = A >> 1;
        3'b111: result = A * B;
        default: result = 8'b00000000;
    endcase
end

endmodule
