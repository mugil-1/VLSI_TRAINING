`timescale 1ns / 1ps
module tb_stopwatch_counter;

reg clk;
reg reset;
wire [3:0] sec;
wire [3:0] tenth;
wire [3:0] hundredth;

stopwatch_counter uut (
    .clk(clk),
    .reset(reset),
    .sec(sec),
    .tenth(tenth),
    .hundredth(hundredth)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_stopwatch_counter);
    #10;
    reset = 0;
    #2000;
    $finish;
end

initial begin
    $monitor("Time=%0t | %d.%d%d sec", $time, sec, tenth, hundredth);
end

endmodule
