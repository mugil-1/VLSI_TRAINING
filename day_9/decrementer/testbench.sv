module tb_decrementer_4bit;

reg  [3:0] in;
wire [3:0] out;
wire borrow_out;

decrementer_4bit uut (
    .in(in),
    .out(out),
    .borrow_out(borrow_out)
);

initial begin
    $dumpfile("decrementer.vcd");
    $dumpvars(0, tb_decrementer_4bit);

    $monitor("Time = %0t | in = %b (%0d) → out = %b (%0d), borrow = %b", $time, in, in, out, out, borrow_out);

    in = 4'b0001; #10;  
    in = 4'b1010; #10;  
    in = 4'b0000; #10;  
    in = 4'b1111; #10;  
    in = 4'b0010; #10;  

    $finish;
end

endmodule
