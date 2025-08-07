module mod6_counter (
    input clk,        
    input rst,         
    output reg [2:0] count  
);
    always @(posedge clk) begin
        if (rst)
            count <= 3'b000;
        else if (count == 3'b101)
            count <= 3'b000; 
        else
            count <= count + 1; 
    end
endmodule
