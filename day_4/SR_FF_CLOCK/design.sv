module sr_flipflop(q, qbar, s, r, clk);
  input s, r, clk;
  output reg q, qbar;

  always @(posedge clk) begin
    if (s == 0 && r == 0)
      ; 
    else if (s == 0 && r == 1) begin
      q <= 0;
      qbar <= 1;
    end
    else if (s == 1 && r == 0) begin
      q <= 1;
      qbar <= 0;
    end
    else if (s == 1 && r == 1) begin
      q <= 1'bx;    
      qbar <= 1'bx;
    end
  end
endmodule
