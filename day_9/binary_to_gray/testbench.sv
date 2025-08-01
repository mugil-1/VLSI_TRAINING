module tb_binary_to_gray;

reg  [3:0] binary;
wire [3:0] gray;

binary_to_gray uut (
    .binary(binary),
    .gray(gray)
);

initial begin
    $dumpfile("binary_to_gray.vcd");
    $dumpvars(0, tb_binary_to_gray);

    $monitor("Time = %0t | Binary = %b (%0d) → Gray = %b", $time, binary, binary, gray);

    binary = 4'b0000; #10;
    binary = 4'b0001; #10;
    binary = 4'b0010; #10;
    binary = 4'b0011; #10;
    binary = 4'b0100; #10;
    binary = 4'b0101; #10;
    binary = 4'b0110; #10;
    binary = 4'b0111; #10;
    binary = 4'b1000; #10;
    binary = 4'b1111; #10;

    $finish;
end

endmodule
