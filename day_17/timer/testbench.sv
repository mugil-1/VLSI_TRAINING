module tb_timer();
    reg clk, reset, enable;
    reg [15:0] limit;
    wire interrupt;

    timer uut (clk, reset, enable, limit, interrupt);

    // Generate clock (10ns period)
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; enable = 0; limit = 10;
        #10 reset = 0;
        
        // Start timer
        enable = 1;
        
        // Observe behavior
        #200;

        $finish;
    end
endmodule
