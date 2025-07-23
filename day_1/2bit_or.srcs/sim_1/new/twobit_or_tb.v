`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 06:32:05
// Design Name: 
// Module Name: twobit_or_tb
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


module twobit_or_tb;
                    reg [1:0]A;
                    reg [1:0]B;
                    wire [1:0]Y;
 twobit_or_p uut (
               .A(A),
               .B(B),
               .Y(Y)
   );
   initial begin 
   $monitor("Time = %0t | A = %b, B = %b, Y = %b ",$time, A,B,Y);
         
         A = 2'b00; B = 2'b01;  #10;
         A = 2'b01; B = 2'b01;  #10;
         A = 2'b10; B = 2'b10;  #10;
         A = 2'b11; B = 2'b11;  #10;

      $finish;
      end
endmodule
