module uart_rx (
    input clk,
    input reset,
    input rx,
    output reg [7:0] data_out,
    output reg data_valid
);
    reg [3:0] bit_count;
    reg [7:0] shift_reg;
    reg [2:0] state;

    localparam IDLE=0, START=1, DATA=2, STOP=3, DONE=4;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            data_valid <= 0;
            bit_count <= 0;
            shift_reg <= 0;
        end else begin
            case(state)
                IDLE: begin
                    data_valid <= 0;
                    if (rx == 0) state <= START;
                end
                START: begin
                    if (rx == 0) begin
                        bit_count <= 0;
                        state <= DATA;
                    end else state <= IDLE;
                end
                DATA: begin
                    shift_reg <= {rx, shift_reg[7:1]};
                    bit_count <= bit_count + 1;
                    if (bit_count == 7) state <= STOP;
                end
                STOP: begin
                    if (rx == 1) state <= DONE;
                    else state <= IDLE;
                end
                DONE: begin
                    data_out <= shift_reg;
                    data_valid <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule
