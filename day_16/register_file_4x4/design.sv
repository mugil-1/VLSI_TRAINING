module register_file_4x4 (
    input clk,
    input reset,
    input write_en,
    input [1:0] write_addr,
    input [1:0] read_addr,
    input [3:0] data_in,
    output reg [3:0] data_out
);

reg [3:0] reg_array [3:0];
integer i;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (i = 0; i < 4; i = i + 1)
            reg_array[i] <= 4'b0000;
    end 
    else if (write_en) begin
        reg_array[write_addr] <= data_in;
    end
end

always @(*) begin
    data_out = reg_array[read_addr];
end

endmodule
