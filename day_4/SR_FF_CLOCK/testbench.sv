module test_sr_flipflop;
  reg s, r, clk;
  wire q, qbar;

  sr_flipflop uut(q, qbar, s, r, clk);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end


  initial begin
    $dumpfile("sr_flipflop.vcd");     
    $dumpvars(0, test_sr_flipflop);

   
    s = 0; r = 1; #10;   // Reset
    s = 1; r = 0; #10;   // Set
    s = 0; r = 0; #10;   // Hold
    s = 1; r = 1; #10;   // Invalid

    $finish;
  end

  initial begin
    $monitor("Time=%0t | CLK=%b S=%b R=%b => Q=%b Qbar=%b", 
              $time, clk, s, r, q, qbar);
  end
endmodule
