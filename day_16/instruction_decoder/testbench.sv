`timescale 1ns/1ps
module tb_instruction_decoder;

reg [7:0] instr;
wire [1:0] alu_op;
wire [1:0] rd;
wire [1:0] rs;
wire reg_write;

instruction_decoder uut(
    .instr(instr),
    .alu_op(alu_op),
    .rd(rd),
    .rs(rs),
    .reg_write(reg_write)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_instruction_decoder);

    instr = 8'b00011000; #10;
    instr = 8'b01000100; #10;
    instr = 8'b10011100; #10;
    instr = 8'b11000010; #10;

    #10 $finish;
end

initial begin
    $monitor("T=%0t | instr=%b | alu_op=%b | rd=%b | rs=%b | reg_write=%b",
             $time, instr, alu_op, rd, rs, reg_write);
end

endmodule
