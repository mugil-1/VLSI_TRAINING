module tb_traffic_light_controller;

    reg clk, rst;
    wire red, yellow, green;

    traffic_light_controller uut (
        .clk(clk),
        .rst(rst),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light_controller);
        $monitor("Time=%0t | clk=%b rst=%b | RED=%b GREEN=%b YELLOW=%b",
                  $time, clk, rst, red, green, yellow);
    end

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        rst = 1;
        #10 rst = 0;

        #200; // Run long enough to see multiple transitions

        $finish;
    end

endmodule
