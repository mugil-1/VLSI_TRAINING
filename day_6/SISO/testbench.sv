module test_siso_shift_register;
  reg clk, rst, serial_in;
  wire serial_out;

  siso_shift_register uut (
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .serial_out(serial_out)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0, test_siso_shift_register);

    rst = 1; serial_in = 0; #10;
    rst = 0;

    // Send bits serially: 1, 0, 1, 1
    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 1; #10;
    serial_in = 1; #10;

    #50 $finish;
  end

  initial begin
    $monitor("Time=%0t | clk=%b | rst=%b | serial_in=%b | serial_out=%b", 
             $time, clk, rst, serial_in, serial_out);
  end
endmodule
