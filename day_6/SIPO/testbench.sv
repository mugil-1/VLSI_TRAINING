module test_sipo_shift_register;
  reg clk, rst, serial_in;
  wire [3:0] parallel_out;

  sipo_shift_register uut (
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
  );

  
  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  initial begin
    $dumpfile("sipo.vcd");
    $dumpvars(0, test_sipo_shift_register);

    rst = 1; serial_in = 0; #10;
    rst = 0;

    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 1; #10;
    serial_in = 1; #10;

    #50 $finish;
  end

  initial begin
    $monitor("Time=%0t | clk=%b | rst=%b | serial_in=%b | parallel_out=%b",
             $time, clk, rst, serial_in, parallel_out);
  end
endmodule
