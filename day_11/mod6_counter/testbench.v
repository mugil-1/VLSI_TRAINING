module tb_mod6_counter;
    reg clk, rst;
    wire [2:0] count;

    mod6_counter uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    initial begin
        $dumpfile("mod6_counter.vcd");
        $dumpvars(0, tb_mod6_counter);
        $monitor("Time=%0t | Reset=%b | Count=%d", $time, rst, count);

        clk = 0;
        rst = 1;
        #10 rst = 0;

        #100 $finish;
    end

    always #5 clk = ~clk; // Clock toggle every 5 time units
endmodule
