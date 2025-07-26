module test_sync_down_counter_4bit;
  reg clk, rst;
  wire [3:0] count;

  sync_down_counter_4bit uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  
  end

  initial begin
    $dumpfile("sync_down_counter_4bit.vcd");
    $dumpvars(0, test_sync_down_counter_4bit);

    rst = 1; #12;     
    rst = 0;          
    #160;             
    rst = 1; #10;     
    rst = 0; #40;
    $finish;
  end

  initial begin
    $monitor("Time=%0t | CLK=%b | RST=%b | COUNT=%b (%0d)", 
              $time, clk, rst, count, count);
  end
endmodule
