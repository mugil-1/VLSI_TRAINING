module tb_uart_rx;
    reg clk, reset, rx;
    wire [7:0] data_out;
    wire data_valid;

    uart_rx dut(clk, reset, rx, data_out, data_valid);

    always #5 clk = ~clk;

    task send_byte;
        input [7:0] data;
        integer i;
        begin
            rx = 0; #10;
            for (i=0; i<8; i=i+1) begin
                rx = data[i];
                #10;
            end
            rx = 1; #10;
        end
    endtask

    initial begin
        clk = 0; reset = 1; rx = 1;
        #15 reset = 0;

        send_byte(8'hA5);
        #100;

        send_byte(8'h3C);
        #100;

        $finish;
    end
endmodule
