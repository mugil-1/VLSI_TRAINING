module test_pipo_shift_register;
  reg clk, rst;
  reg [3:0] data_in;
  wire [3:0] data_out;

  pipo_shift_register uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("pipo.vcd");
    $dumpvars(0, test_pipo_shift_register);

    rst = 1; data_in = 4'b0000; #10;
    rst = 0;

    data_in = 4'b1010; #10;  // Load new data
    data_in = 4'b1100; #10;
    data_in = 4'b0111; #10;

    #20 $finish;
  end

  initial begin
    $monitor("Time=%0t | clk=%b | rst=%b | data_in=%b | data_out=%b",
             $time, clk, rst, data_in, data_out);
  end
endmodule
