module ram4x4(
    input clk,
    input we,              // write enable
    input [1:0] addr,      // 2-bit address (4 locations)
    input [3:0] data_in,   // data to write
    output reg [3:0] data_out // data read
);

reg [3:0] mem [3:0]; // 4 words, 4 bits each

always @(posedge clk) begin
    if (we)
        mem[addr] <= data_in; // write
    data_out <= mem[addr];    // read
end

endmodule
