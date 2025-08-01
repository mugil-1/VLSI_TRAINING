module tb_barrel_shifter;

reg [3:0] data_in;
reg [1:0] shift_amt;
wire [3:0] data_out;

barrel_shifter uut (
    .data_in(data_in),
    .shift_amt(shift_amt),
    .data_out(data_out)
);

initial begin
    $dumpfile("barrel_shifter.vcd");
    $dumpvars(0, tb_barrel_shifter);
    
    $monitor("Time=%0t | Input = %b | Shift = %b | Output = %b", 
              $time, data_in, shift_amt, data_out);

    data_in = 4'b1101;

    shift_amt = 2'b00; #10;  
    shift_amt = 2'b01; #10;  
    shift_amt = 2'b10; #10;  
    shift_amt = 2'b11; #10;  

    $finish;
end

endmodule
