module alu_8bit(
    input [7:0] A,
    input [7:0] B,
    input [3:0] ALU_Sel,
    output reg [7:0] ALU_Out,
    output reg CarryOut,
    output reg Zero
);

reg [8:0] tmp;

always @(*) begin
    CarryOut = 0;
    Zero = 0;

    case (ALU_Sel)
        4'b0000: begin // ADD
            tmp = A + B;
            ALU_Out = tmp[7:0];
            CarryOut = tmp[8];
        end
        4'b0001: begin // SUB
            tmp = A - B;
            ALU_Out = tmp[7:0];
            CarryOut = tmp[8];
        end
        4'b0010: ALU_Out = A & B; // AND
        4'b0011: ALU_Out = A | B; // OR
        4'b0100: ALU_Out = A ^ B; // XOR
        4'b0101: ALU_Out = ~A;    // NOT
        4'b0110: ALU_Out = A + 1; // INC
        4'b0111: ALU_Out = A - 1; // DEC
        4'b1000: ALU_Out = (A == B) ? 8'b00000001 : 8'b00000000; // CMP
        4'b1001: ALU_Out = A << 1; // SHIFT LEFT
        4'b1010: ALU_Out = A >> 1; // SHIFT RIGHT
        default: ALU_Out = 8'b00000000;
    endcase

    Zero = (ALU_Out == 0);
end

endmodule
