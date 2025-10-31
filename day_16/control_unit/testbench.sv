`timescale 1ns/1ps
module tb_control_unit;

reg clk, reset;
reg [7:0] instr;
wire pc_inc, pc_load, reg_write, alu_start;
wire [1:0] alu_op, rd, rs;

control_unit uut(
    .clk(clk),
    .reset(reset),
    .instr(instr),
    .pc_inc(pc_inc),
    .pc_load(pc_load),
    .reg_write(reg_write),
    .alu_start(alu_start),
    .alu_op(alu_op),
    .rd(rd),
    .rs(rs)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_control_unit);

    clk = 0; reset = 1; instr = 8'b00011000; #10;
    reset = 0;

    instr = 8'b00011000; #40;
    instr = 8'b01000100; #40;
    instr = 8'b10011100; #40;
    instr = 8'b11000010; #40;

    #20 $finish;
end

initial begin
    $monitor("T=%0t | S=%b | instr=%b | PCinc=%b | RW=%b | ALUop=%b | rd=%b | rs=%b",
        $time, uut.state, instr, pc_inc, reg_write, alu_op, rd, rs);
end

endmodule
