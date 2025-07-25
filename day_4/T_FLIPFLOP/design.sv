module t_flipflop(q, t, clk);
  input t, clk;
  output reg q;

  always @(posedge clk) begin
    if (t)
      q <= ~q; 
    else
      q <= q;  
  end
endmodule
