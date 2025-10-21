`timescale 1ns / 1ps
module tb_ram4x4;

reg clk;
reg we;
reg [1:0] addr;
reg [3:0] data_in;
wire [3:0] data_out;

ram4x4 uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_ram4x4);

    clk = 0;
    we = 0;
    addr = 0;
    data_in = 4'b0000;

    // write some data
    #10 we = 1; addr = 2'b00; data_in = 4'b1010;
    #10 addr = 2'b01; data_in = 4'b1100;
    #10 addr = 2'b10; data_in = 4'b0111;
    #10 addr = 2'b11; data_in = 4'b1111;

    // disable write
    #10 we = 0;

    // read all addresses
    #10 addr = 2'b00;
    #10 addr = 2'b01;
    #10 addr = 2'b10;
    #10 addr = 2'b11;

    #10 $finish;
end

initial begin
    $monitor("Time=%0t | Addr=%b | WE=%b | Data_in=%b | Data_out=%b", 
             $time, addr, we, data_in, data_out);
end

endmodule
