`timescale 1ns / 1ps
module tb_lfsr;

reg clk;
reg reset;
wire [3:0] out;

lfsr uut (
    .clk(clk),
    .reset(reset),
    .out(out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_lfsr);

    clk = 0;
    reset = 1;
    #10 reset = 0;

    #100 $finish;
end

initial begin
    $monitor("Time=%0t | LFSR Output = %b", $time, out);
end

endmodule
