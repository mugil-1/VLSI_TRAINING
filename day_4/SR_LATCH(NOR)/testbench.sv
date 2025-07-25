module test_sr_latch_nor;
  reg s, r;
  wire q, qbar;

  
  sr_latch_nor uut(q, qbar, s, r);

  initial begin
    $dumpfile("sr_latch_nor.vcd");
    $dumpvars(0, test_sr_latch_nor);

    
    s = 1; r = 0; #10;

    
    s = 0; r = 0; #10;

   
    s = 0; r = 1; #10;

    
    s = 0; r = 0; #10;

    
    s = 1; r = 1; #10;

    $finish;
  end

  initial begin
    $monitor("Time=%0t | S=%b R=%b => Q=%b Qbar=%b", 
              $time, s, r, q, qbar);
  end
endmodule
