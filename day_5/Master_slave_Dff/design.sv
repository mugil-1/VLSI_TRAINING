module master_slave_dff(q, d, clk);
  input d, clk;
  output reg q;

  reg master;

  always @(negedge clk) begin
    master <= d;      // Master on at CLK = 0
  end

  always @(posedge clk) begin
    q <= master;      // Slave on at CLK = 1
  end
endmodule
