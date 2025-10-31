module fifo_8x8 (
    input clk,
    input reset,
    input write_en,
    input read_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg full,
    output reg empty
);
    reg [7:0] mem [7:0];
    reg [2:0] w_ptr, r_ptr;
    reg [3:0] count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            w_ptr <= 0;
            r_ptr <= 0;
            count <= 0;
            full <= 0;
            empty <= 1;
        end else begin
            if (write_en && !full) begin
                mem[w_ptr] <= data_in;
                w_ptr <= w_ptr + 1;
                count <= count + 1;
            end
            if (read_en && !empty) begin
                data_out <= mem[r_ptr];
                r_ptr <= r_ptr + 1;
                count <= count - 1;
            end
            full <= (count == 8);
            empty <= (count == 0);
        end
    end
endmodule
