module test_master_slave_dff;
  reg d, clk;
  wire q;

  master_slave_dff uut(q, d, clk);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  
  end

  initial begin
    $dumpfile("master_slave_dff.vcd");
    $dumpvars(0, test_master_slave_dff);

    d = 0; #12;   
    d = 1; #10;   
    d = 0; #10;   
    d = 1; #10;   
    #10;
    $finish;
  end

  initial begin
    $monitor("Time=%0t | CLK=%b D=%b => Q=%b", 
              $time, clk, d, q);
  end
endmodule
