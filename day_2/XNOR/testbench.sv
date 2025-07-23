`timescale 1ns/1ps

module tb_xnor_data;

reg a, b;
wire c;

xnor_data uut (
    .c(c),
    .a(a),
    .b(b)
);

initial begin
    $dumpfile("xnor_data_tb.vcd");
    $dumpvars(0, tb_xnor_data);
    $monitor("Time=%0t | a=%b b=%b | XNOR=%b", $time, a, b, c);

    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
end

endmodule
