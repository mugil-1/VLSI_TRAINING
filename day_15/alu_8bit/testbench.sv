`timescale 1ns / 1ps
module tb_alu_8bit;

reg [7:0] A, B;
reg [3:0] ALU_Sel;
wire [7:0] ALU_Out;
wire CarryOut, Zero;

alu_8bit uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .CarryOut(CarryOut),
    .Zero(Zero)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_alu_8bit);

    A = 8'h0A; B = 8'h03;

    // Test all operations
    ALU_Sel = 4'b0000; #10; // ADD
    ALU_Sel = 4'b0001; #10; // SUB
    ALU_Sel = 4'b0010; #10; // AND
    ALU_Sel = 4'b0011; #10; // OR
    ALU_Sel = 4'b0100; #10; // XOR
    ALU_Sel = 4'b0101; #10; // NOT
    ALU_Sel = 4'b0110; #10; // INC
    ALU_Sel = 4'b0111; #10; // DEC
    ALU_Sel = 4'b1000; #10; // CMP
    ALU_Sel = 4'b1001; #10; // SHIFT LEFT
    ALU_Sel = 4'b1010; #10; // SHIFT RIGHT

    #10 $finish;
end

initial begin
    $monitor("Time=%0t | Sel=%b | A=%h | B=%h | Out=%h | Carry=%b | Zero=%b",
             $time, ALU_Sel, A, B, ALU_Out, CarryOut, Zero);
end

endmodule
