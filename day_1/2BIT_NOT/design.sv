module two_bit_not(
  input[1:0] in,
  output[1:0] out
);
  
  assign out = ~in;
  
endmodule