module alu_8bit_flags (
    input [7:0] A,
    input [7:0] B,
    input [2:0] ALUop,
    output reg [7:0] result,
    output reg Z,
    output reg C,
    output reg N
);
    reg [8:0] temp;

    always @(*) begin
        case(ALUop)
            3'b000: temp = A + B;
            3'b001: temp = A - B;
            3'b010: temp = {1'b0, A & B};
            3'b011: temp = {1'b0, A | B};
            3'b100: temp = {1'b0, A ^ B};
            default: temp = 9'b0;
        endcase

        result = temp[7:0];
        C = temp[8];
        Z = (result == 8'b0);
        N = result[7];
    end
endmodule
