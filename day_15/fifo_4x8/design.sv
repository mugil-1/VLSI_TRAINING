module fifo_4x8 (
    input clk,
    input reset,
    input wr_en,           // write enable
    input rd_en,           // read enable
    input [7:0] data_in,   // input data
    output reg [7:0] data_out, // output data
    output reg full,
    output reg empty
);

reg [7:0] mem [3:0]; // 4 locations, 8 bits each
reg [1:0] wr_ptr, rd_ptr;
reg [2:0] count;     // count range: 0–4

always @(posedge clk or posedge reset) begin
    if (reset) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count <= 0;
        full <= 0;
        empty <= 1;
        data_out <= 0;
    end else begin
        // Write Operation
        if (wr_en && !full) begin
            mem[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1;
            count <= count + 1;
        end

        // Read Operation
        if (rd_en && !empty) begin
            data_out <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            count <= count - 1;
        end

        // Status flags
        full <= (count == 4);
        empty <= (count == 0);
    end
end

endmodule
