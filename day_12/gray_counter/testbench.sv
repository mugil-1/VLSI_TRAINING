`timescale 1ns / 1ps
module tb_gray_counter;

reg clk;
reg reset;
wire [3:0] gray;

gray_counter uut (
    .clk(clk),
    .reset(reset),
    .gray(gray)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_gray_counter);
    #10 reset = 0;
    #100 $finish;
end

initial begin
    $monitor("Time=%0t | Gray=%b", $time, gray);
end

endmodule
