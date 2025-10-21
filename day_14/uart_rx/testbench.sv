`timescale 1ns / 1ps
module tb_uart_rx;

reg clk;
reg reset;
reg rx;
wire [7:0] rx_data;
wire rx_done;

uart_rx uut (
    .clk(clk),
    .reset(reset),
    .rx(rx),
    .rx_data(rx_data),
    .rx_done(rx_done)
);

always #5 clk = ~clk; // 10 MHz

task send_byte(input [7:0] data);
    integer i;
    begin
        // start bit
        rx = 0; #10420; // 1 baud period (≈104us)
        // data bits (LSB first)
        for (i = 0; i < 8; i = i + 1) begin
            rx = data[i];
            #10420;
        end
        // stop bit
        rx = 1;
        #10420;
    end
endtask

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_uart_rx);

    clk = 0;
    reset = 1;
    rx = 1; // idle
    #20 reset = 0;

    #500 send_byte(8'hA5); // send 10100101
    #5000 $finish;
end

initial begin
    $monitor("Time=%0t | RX_done=%b | RX_data=%h", $time, rx_done, rx_data);
end

endmodule
