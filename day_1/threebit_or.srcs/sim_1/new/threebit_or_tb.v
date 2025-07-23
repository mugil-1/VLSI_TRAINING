`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 06:51:09
// Design Name: 
// Module Name: threebit_or_tb
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


module threebit_or_tb;
                    reg [2:0]A;
                    reg [2:0]B;
                    wire [2:0]Y;
 threebit_or_p uut (
               .A(A),
               .B(B),
               .Y(Y)
   );
   initial begin 
   $monitor("Time = %0t | A = %b, B = %b, Y = %b ",$time, A,B,Y);
         
         A = 3'b000; B = 3'b001;  #10;
         A = 3'b001; B = 3'b010;  #10;
         A = 3'b010; B = 3'b011;  #10;
         A = 3'b011; B = 3'b111;  #10;

      $finish;
      end
endmodule
