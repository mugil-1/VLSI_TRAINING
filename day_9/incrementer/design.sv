module incrementer_4bit (
    input  [3:0] in,        
    output [3:0] out,       
    output       carry_out  
);

assign {carry_out, out} = in + 1;

endmodule
