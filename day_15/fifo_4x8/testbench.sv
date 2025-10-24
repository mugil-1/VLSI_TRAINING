`timescale 1ns / 1ps
module tb_fifo_4x8;

reg clk;
reg reset;
reg wr_en, rd_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire full, empty;

fifo_4x8 uut (
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_fifo_4x8);

    clk = 0; reset = 1; wr_en = 0; rd_en = 0; data_in = 0;
    #10 reset = 0;

    // Write 4 values
    #10 wr_en = 1; data_in = 8'hA1;
    #10 data_in = 8'hB2;
    #10 data_in = 8'hC3;
    #10 data_in = 8'hD4;
    #10 wr_en = 0;

    // Read 4 values
    #10 rd_en = 1;
    #40 rd_en = 0;

    #10 $finish;
end

initial begin
    $monitor("Time=%0t | wr_en=%b rd_en=%b | data_in=%h | data_out=%h | full=%b empty=%b",
             $time, wr_en, rd_en, data_in, data_out, full, empty);
end

endmodule
