module tb_incrementer_4bit;

reg [3:0] in;
wire [3:0] out;
wire carry_out;

incrementer_4bit uut (
    .in(in),
    .out(out),
    .carry_out(carry_out)
);

initial begin
    $dumpfile("incrementer.vcd");
    $dumpvars(0, tb_incrementer_4bit);

    $monitor("Time = %0t | in = %b (%0d) → out = %b (%0d), carry = %b", $time, in, in, out, out, carry_out);

    in = 4'b0000; #10; 
    in = 4'b0101; #10; 
    in = 4'b1110; #10; 
    in = 4'b1111; #10;  
    in = 4'b1001; #10; 

    $finish;
end

endmodule
