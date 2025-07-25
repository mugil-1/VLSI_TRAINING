module test_t_flipflop;
  reg t, clk;
  wire q;

  t_flipflop uut(q, t, clk);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("t_flipflop.vcd");
    $dumpvars(0, test_t_flipflop);

    t = 0; #10;  
    t = 1; #10;  
    t = 1; #10;  
    t = 0; #10;  
    t = 1; #10;  
    t = 0; #10;  

    $finish;
  end

  initial begin
    $monitor("Time=%0t | CLK=%b T=%b => Q=%b", 
              $time, clk, t, q);
  end
endmodule
