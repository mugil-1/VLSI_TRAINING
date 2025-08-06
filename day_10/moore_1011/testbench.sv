module tb_moore_1011_detector;

    reg clk, rst, in;
    wire out;

    moore_1011_detector uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("moore_1011.vcd");
        $dumpvars(0, tb_moore_1011_detector);
        $monitor("Time=%0t | clk=%b rst=%b in=%b => out=%b", $time, clk, rst, in, out);

        clk = 0; rst = 1; in = 0;
        #10 rst = 0;

        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;

        in = 0; #10;
        in = 1; #10;
        in = 1; #10;

        in = 0; #10;
        in = 0; #10;

        $finish;
    end

endmodule
