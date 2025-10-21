`timescale 1ns / 1ps
module tb_uart_tx;

reg clk;
reg reset;
reg tx_start;
reg [7:0] tx_data;
wire tx;
wire tx_busy;

uart_tx uut (
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .tx_busy(tx_busy)
);

always #5 clk = ~clk; // 10 MHz clock

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_uart_tx);

    clk = 0;
    reset = 1;
    tx_start = 0;
    tx_data = 8'h00;
    #20 reset = 0;

    #20 tx_data = 8'hA5; // example byte (10100101)
    tx_start = 1;
    #10 tx_start = 0;

    wait(!tx_busy); // wait for transmission to finish
    #100 $finish;
end

initial begin
    $monitor("Time=%0t | tx=%b | busy=%b", $time, tx, tx_busy);
end

endmodule
