`timescale 1ns / 1ps
module tb_mod6_counter;

reg clk;
reg reset;
wire [2:0] count;

mod6_counter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mod6_counter);
    #10;
    reset = 0;
    #100;
    $finish;
end

initial begin
    $monitor("Time=%0t | Reset=%b | Count=%d", $time, reset, count);
end

endmodule
