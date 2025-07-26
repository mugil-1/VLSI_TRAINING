module async_up_counter_4bit (
  input clk,          
  input rst,          
  output reg [3:0] q  
);

  always @(posedge clk or posedge rst)
    if (rst) q[0] <= 0;
    else     q[0] <= ~q[0];  // Toggle LSB

  always @(posedge q[0] or posedge rst)
    if (rst) q[1] <= 0;
    else     q[1] <= ~q[1];  // Toggle on q[0]

  always @(posedge q[1] or posedge rst)
    if (rst) q[2] <= 0;
    else     q[2] <= ~q[2];  // Toggle on q[1]

  always @(posedge q[2] or posedge rst)
    if (rst) q[3] <= 0;
    else     q[3] <= ~q[3];  // Toggle on q[2]

endmodule
