module program_counter(
    input clk,
    input reset,
    input load,
    input inc,
    input [7:0] pc_in,
    output reg [7:0] pc_out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        pc_out <= 8'b00000000;
    else if (load)
        pc_out <= pc_in;
    else if (inc)
        pc_out <= pc_out + 1;
end

endmodule
