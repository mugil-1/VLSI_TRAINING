`timescale 1ns / 1ps
module tb_mod10_counter;

reg clk;
reg reset;
wire [3:0] count;

mod10_counter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mod10_counter);
    #10;
    reset = 0;
    #200;
    $finish;
end

initial begin
    $monitor("Time=%0t | Reset=%b | Count=%d", $time, reset, count);
end

endmodule
