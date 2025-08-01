module barrel_shifter (
    input [3:0] data_in,      
    input [1:0] shift_amt,    
    output [3:0] data_out     
);

assign data_out = (shift_amt == 2'b00) ? data_in              :
                  (shift_amt == 2'b01) ? {1'b0, data_in[3:1]} :
                  (shift_amt == 2'b10) ? {2'b00, data_in[3:2]}:
                                         {3'b000, data_in[3]};

endmodule
