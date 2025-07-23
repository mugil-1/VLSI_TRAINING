`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 06:49:36
// Design Name: 
// Module Name: threebit_or_p
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


module threebit_or_p(input [2:0] A,
                   input [2:0] B,
                   output [2:0] Y
                   );
assign Y = A | B;
endmodule
