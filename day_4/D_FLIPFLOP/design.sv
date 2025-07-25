module d_flipflop(q, d, clk);
  input d, clk;
  output reg q;

  always @(posedge clk)
    q <= d;
endmodule
