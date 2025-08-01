module decrementer_4bit (
    input  [3:0] in,           
    output [3:0] out,          
    output       borrow_out    
);

assign {borrow_out, out} = {1'b0, in} - 1;

endmodule
