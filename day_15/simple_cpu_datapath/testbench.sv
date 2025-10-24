`timescale 1ns / 1ps
module tb_simple_cpu_datapath;

reg clk;
reg reset;
reg [1:0] control;
reg [7:0] data_in_A, data_in_B;
wire [7:0] result;

simple_cpu_datapath uut (
    .clk(clk),
    .reset(reset),
    .control(control),
    .data_in_A(data_in_A),
    .data_in_B(data_in_B),
    .result(result)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_simple_cpu_datapath);

    clk = 0; reset = 1; control = 2'b00;
    data_in_A = 8'd10; data_in_B = 8'd5;
    #10 reset = 0;

    control = 2'b00; #10; // ADD
    control = 2'b01; #10; // SUB
    control = 2'b10; #10; // AND
    control = 2'b11; #10; // OR

    #10 $finish;
end

initial begin
    $monitor("Time=%0t | Ctrl=%b | A=%d | B=%d | Result=%d",
             $time, control, data_in_A, data_in_B, result);
end

endmodule
