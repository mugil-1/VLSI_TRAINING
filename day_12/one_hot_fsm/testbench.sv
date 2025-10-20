`timescale 1ns / 1ps
module tb_one_hot_fsm;

reg clk;
reg reset;
reg start;
wire [2:0] state;

one_hot_fsm uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .state(state)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    start = 0;
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_one_hot_fsm);
    #10 reset = 0;
    #20 start = 1;
    #10 start = 0;
    #100 $finish;
end

initial begin
    $monitor("Time=%0t | start=%b | state=%b", $time, start, state);
end

endmodule
