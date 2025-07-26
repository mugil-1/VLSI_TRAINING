module test_sync_up_counter_2bit;
  reg clk, rst;
  wire [1:0] count;

  sync_up_counter_2bit uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  
  end

  initial begin
    $dumpfile("sync_up_counter_2bit.vcd");
    $dumpvars(0, test_sync_up_counter_2bit);

    rst = 1; #12;  
    rst = 0;       

    #50;           
    rst = 1; #10;  
    rst = 0; #20;
    $finish;
  end


  initial begin
    $monitor("Time = %0t | CLK = %b | RST = %b | COUNT = %b", 
              $time, clk, rst, count);
  end
endmodule
