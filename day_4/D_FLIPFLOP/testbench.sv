module test_d_flipflop;
  reg d, clk;
  wire q;

  d_flipflop uut(q, d, clk);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("d_flipflop.vcd");
    $dumpvars(0, test_d_flipflop);

    d = 0; #10;  
    d = 1; #10;  
    d = 0; #10;  
    d = 1; #10;  

    $finish;
  end

  initial begin
    $monitor("Time=%0t | CLK=%b D=%b => Q=%b", 
              $time, clk, d, q);
  end
endmodule
