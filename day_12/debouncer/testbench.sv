`timescale 1ns / 1ps
module tb_debouncer;

reg clk;
reg reset;
reg button;
wire clean;

debouncer uut (
    .clk(clk),
    .reset(reset),
    .button(button),
    .clean(clean)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    button = 0;
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_debouncer);
    #10 reset = 0;
    #20 button = 1;
    #15 button = 0;
    #10 button = 1;
    #100 button = 0;
    #200 $finish;
end

initial begin
    $monitor("Time=%0t | button=%b | clean=%b", $time, button, clean);
end

endmodule
