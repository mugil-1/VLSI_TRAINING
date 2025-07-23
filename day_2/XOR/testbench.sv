`timescale 1ns/1ps

module tb_xor_data;

reg a, b;
wire c;

xor_data uut (
    .c(c),
    .a(a),
    .b(b)
);

initial begin
    $dumpfile("xor_data_tb.vcd");
    $dumpvars(0, tb_xor_data);
    $monitor("Time=%0t | a=%b b=%b | c=%b", $time, a, b, c);

    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
end

endmodule
