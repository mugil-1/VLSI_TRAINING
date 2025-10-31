module tb_fifo_8x8;
    reg clk, reset, write_en, read_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    fifo_8x8 dut(clk, reset, write_en, read_en, data_in, data_out, full, empty);

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; write_en = 0; read_en = 0; data_in = 0;
        #10 reset = 0;

        write_en = 1; data_in = 8'h11; #10;
        data_in = 8'h22; #10;
        data_in = 8'h33; #10;
        data_in = 8'h44; #10;
        data_in = 8'h55; #10;
        data_in = 8'h66; #10;
        data_in = 8'h77; #10;
        data_in = 8'h88; #10;
        write_en = 0; #10;

        read_en = 1; #80;
        read_en = 0;

        $finish;
    end
endmodule
