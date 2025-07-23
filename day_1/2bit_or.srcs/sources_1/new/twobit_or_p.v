`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 06:28:11
// Design Name: 
// Module Name: twobit_or_p
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module twobit_or_p(input [1:0] A,
                   input [1:0] B,
                   output [1:0] Y
                   );
assign Y = A | B;

endmodule
