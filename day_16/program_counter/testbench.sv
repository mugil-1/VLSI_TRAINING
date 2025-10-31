`timescale 1ns/1ps
module tb_program_counter;

reg clk;
reg reset;
reg load;
reg inc;
reg [7:0] pc_in;
wire [7:0] pc_out;

program_counter uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .inc(inc),
    .pc_in(pc_in),
    .pc_out(pc_out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_program_counter);

    clk = 0; reset = 1; load = 0; inc = 0; pc_in = 0;
    #10 reset = 0;

    inc = 1; #30;
    inc = 0;

    load = 1; pc_in = 8'd10; #10;
    load = 0;

    inc = 1; #30;
    inc = 0;

    #10 $finish;
end

initial begin
    $monitor("T=%0t | reset=%b | load=%b | inc=%b | pc_in=%d | pc_out=%d",
             $time, reset, load, inc, pc_in, pc_out);
end

endmodule
