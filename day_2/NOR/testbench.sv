`timescale 1ns/1ps
module tb_nor_gate;
    reg a, b;
    wire y;

    nor_gate uut (y, a, b);

    initial begin
        $dumpfile("tb_nor_gate.vcd");   
        $dumpvars(0, tb_nor_gate);
        $monitor("Time=%0t | a=%b b=%b | y=%b", $time, a, b, y);

       
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $finish;
    end
endmodule
