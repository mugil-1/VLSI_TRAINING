module tb_uart_tx_parity;
    reg clk, reset, start, parity_type;
    reg [7:0] data_in;
    wire tx, busy;

    uart_tx_parity dut(clk, reset, start, data_in, parity_type, tx, busy);

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; start = 0; parity_type = 0; data_in = 8'hA5;
        #10 reset = 0;
        #10 start = 1;
        #10 start = 0;
        #200;
        parity_type = 1;
        data_in = 8'h3C;
        #10 start = 1;
        #10 start = 0;
        #200;
        $finish;
    end
endmodule
