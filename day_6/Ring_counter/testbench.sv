module test_ring_counter;
  reg clk, rst;
  wire [3:0] q;

  // Instantiate the design
  ring_counter uut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  
  initial begin
    $dumpfile("ring_counter.vcd");
    $dumpvars(0, test_ring_counter);

    rst = 1; #12;      
    rst = 0;           
    #100;              
    $finish;
  end

  initial begin
    $monitor("Time = %0t | CLK = %b | RST = %b | Q = %b", $time, clk, rst, q);
  end
endmodule
