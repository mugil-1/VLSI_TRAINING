`timescale 1ns / 1ps
module tb_clock_divider;

reg clk;
reg reset;
wire clk_div2;
wire clk_div4;
wire clk_div10;

clock_divider uut (
    .clk(clk),
    .reset(reset),
    .clk_div2(clk_div2),
    .clk_div4(clk_div4),
    .clk_div10(clk_div10)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_clock_divider);
    #10;
    reset = 0;
    #500;
    $finish;
end

initial begin
    $monitor("Time=%0t | clk=%b | div2=%b | div4=%b | div10=%b", $time, clk, clk_div2, clk_div4, clk_div10);
end

endmodule
