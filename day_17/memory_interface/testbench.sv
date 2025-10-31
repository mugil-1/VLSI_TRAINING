module tb_memory_interface();
    reg clk, read_en, write_en, mem_sel;
    reg [3:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    memory_interface dut(clk, read_en, write_en, mem_sel, addr, data_in, data_out);

    always #5 clk = ~clk;

    initial begin
        clk = 0;

        // ---- Read from ROM ----
        mem_sel = 0; write_en = 0; read_en = 1;
        addr = 4'd2; #10;
        $display("ROM Read @2 = %h", data_out);

        // ---- Write to RAM ----
        mem_sel = 1; read_en = 0; write_en = 1;
        addr = 4'd5; data_in = 8'hA3; #10;

        // ---- Read from RAM ----
        read_en = 1; write_en = 0;
        addr = 4'd5; #10;
        $display("RAM Read @5 = %h", data_out);

        $finish;
    end
endmodule
