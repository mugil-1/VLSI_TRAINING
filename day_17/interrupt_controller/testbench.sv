module tb_interrupt_controller;
    reg clk, reset;
    reg [3:0] irq_in;
    wire irq_valid;
    wire [1:0] irq_id;

    interrupt_controller dut(clk, reset, irq_in, irq_valid, irq_id);

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; irq_in = 4'b0000;
        #10 reset = 0;

        irq_in = 4'b0001; #10;
        irq_in = 4'b0100; #10;
        irq_in = 4'b1000; #10;
        irq_in = 4'b0110; #10;
        irq_in = 4'b0000; #10;

        $finish;
    end
endmodule
