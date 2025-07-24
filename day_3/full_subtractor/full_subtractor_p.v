module full_subtractor(input a, b, B_in, output D, B_out);
  assign D = a ^ b ^ B_in;
  assign B_out = (~a & b) | (~(a ^ b) & B_in);
endmodule