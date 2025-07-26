module test_async_up_counter_4bit;
  reg clk, rst;
  wire [3:0] q;

  async_up_counter_4bit uut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("async_up_counter_4bit.vcd");
    $dumpvars(0, test_async_up_counter_4bit);

    rst = 1; #12;     
    rst = 0; #200;    
    rst = 1; #10;     
    rst = 0; #50;
    $finish;
  end

  initial begin
    $monitor("Time=%0t | CLK=%b | RST=%b | Q=%b (%0d)", 
              $time, clk, rst, q, q);
  end
endmodule
