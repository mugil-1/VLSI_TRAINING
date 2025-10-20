`timescale 1ns / 1ps
module tb_pulse_generator;

reg clk;
reg reset;
wire pulse;

pulse_generator uut (
    .clk(clk),
    .reset(reset),
    .pulse(pulse)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_pulse_generator);
    #10;
    reset = 0;
    #200;
    $finish;
end

initial begin
    $monitor("Time=%0t | clk=%b | pulse=%b", $time, clk, pulse);
end

endmodule
