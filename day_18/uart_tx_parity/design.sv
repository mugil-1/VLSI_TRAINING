module uart_tx_parity (
    input clk,
    input reset,
    input start,
    input [7:0] data_in,
    input parity_type,
    output reg tx,
    output reg busy
);
    reg [3:0] bit_count;
    reg [9:0] shift_reg;
    reg parity_bit;
    reg [7:0] temp;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tx <= 1;
            busy <= 0;
            bit_count <= 0;
            shift_reg <= 0;
        end else begin
            if (start && !busy) begin
                temp <= data_in;
                parity_bit <= (parity_type) ? ^data_in : ~(^data_in);
                shift_reg <= {1'b1, parity_bit, data_in, 1'b0};
                busy <= 1;
                bit_count <= 0;
            end else if (busy) begin
                tx <= shift_reg[0];
                shift_reg <= shift_reg >> 1;
                bit_count <= bit_count + 1;
                if (bit_count == 9) begin
                    busy <= 0;
                end
            end
        end
    end
endmodule
