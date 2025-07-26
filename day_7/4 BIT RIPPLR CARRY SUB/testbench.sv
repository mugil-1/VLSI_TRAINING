module test_ripple_carry_subtractor;
  reg [3:0] a, b;
  reg bin;
  wire [3:0] diff;
  wire bout;

  ripple_carry_subtractor uut (
    .a(a), .b(b), .bin(bin),
    .diff(diff), .bout(bout)
  );

  initial begin
    $dumpfile("subtractor.vcd");
    $dumpvars(0, test_ripple_carry_subtractor);
    
    bin = 0;

    // A - B
    a = 4'b1010; b = 4'b0011; #10; // 10 - 3 = 7
    a = 4'b0110; b = 4'b1000; #10; // 6 - 8 = -2 (underflow)
    a = 4'b1111; b = 4'b0001; #10; // 15 - 1 = 14
    a = 4'b0101; b = 4'b0101; #10; // 5 - 5 = 0

    $finish;
  end

  initial begin
    $monitor("Time=%0t | A=%b | B=%b | Diff=%b | Bout=%b", 
              $time, a, b, diff, bout);
  end
endmodule
