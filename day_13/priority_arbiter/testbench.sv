`timescale 1ns / 1ps
module tb_priority_arbiter;

reg [7:0] req;
wire [7:0] grant;

priority_arbiter uut (
    .req(req),
    .grant(grant)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_priority_arbiter);
    
    req = 8'b00000000; #10;
    req = 8'b00000001; #10;
    req = 8'b00001001; #10; // both 3 and 0 set → 3 has higher priority
    req = 8'b10101010; #10; // bit 7 high → grants 7
    req = 8'b00010000; #10;
    req = 8'b00000010; #10;
    req = 8'b11111111; #10; // multiple → only 7 granted
    req = 8'b00000000; #10;
    $finish;
end

initial begin
    $monitor("Time=%0t | Req=%b | Grant=%b", $time, req, grant);
end

endmodule
