module tb_stack_pointer;
    reg clk, reset, push, pop;
    reg [7:0] start_addr;
    wire [7:0] sp;

    stack_pointer dut(clk, reset, push, pop, start_addr, sp);

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; push = 0; pop = 0; start_addr = 8'hFF;
        #10 reset = 0;

        push = 1; #10; push = 0; #10;
        push = 1; #10; push = 0; #10;
        pop = 1;  #10; pop = 0; #10;

        $finish;
    end
endmodule
