module test_half_subtractor;
  reg a, b;
  wire diff, borrow;


  half_subtractor hs(diff, borrow, a, b);

  initial begin
    
    $dumpfile("half_subtractor.vcd");
    $dumpvars(0, test_half_subtractor);

    
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
  end

  initial begin
    $monitor("Time=%0d | a=%b b=%b => diff=%b borrow=%b", $time, a, b, diff, borrow);
  end
endmodule
