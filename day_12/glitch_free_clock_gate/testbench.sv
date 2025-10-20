`timescale 1ns / 1ps
module tb_glitch_free_clock_gate;

reg clk;
reg reset;
reg enable;
wire gated_clk;

glitch_free_clock_gate uut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .gated_clk(gated_clk)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    enable = 0;
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_glitch_free_clock_gate);
    #10 reset = 0;
    #20 enable = 1;
    #50 enable = 0;
    #40 enable = 1;
    #100 $finish;
end

initial begin
    $monitor("Time=%0t | clk=%b | enable=%b | gated_clk=%b", $time, clk, enable, gated_clk);
end

endmodule
