module three_bit_not(
  input[2:0] in,
  output[2:0] out
);
  assign out = ~in;
endmodule