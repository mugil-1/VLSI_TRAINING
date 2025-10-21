module uart_tx (
    input clk,            // system clock
    input reset,          // async reset
    input tx_start,       // trigger to send data
    input [7:0] tx_data,  // data byte to send
    output reg tx,        // UART transmit line
    output reg tx_busy    // indicates transmission in progress
);

parameter CLK_FREQ = 10000000;    // 10 MHz
parameter BAUD_RATE = 9600;
localparam integer BAUD_COUNT = CLK_FREQ / BAUD_RATE;

reg [15:0] baud_cnt;
reg baud_tick;
reg [3:0] bit_index;
reg [9:0] tx_shift;

// Baud rate generator
always @(posedge clk or posedge reset) begin
    if (reset) begin
        baud_cnt <= 0;
        baud_tick <= 0;
    end else if (baud_cnt == BAUD_COUNT/2) begin
        baud_cnt <= 0;
        baud_tick <= 1;
    end else begin
        baud_cnt <= baud_cnt + 1;
        baud_tick <= 0;
    end
end

// Transmitter FSM
always @(posedge clk or posedge reset) begin
    if (reset) begin
        tx <= 1'b1; // idle line is high
        tx_busy <= 0;
        bit_index <= 0;
        tx_shift <= 10'b1111111111;
    end else if (tx_start && !tx_busy) begin
        // load frame: start(0) + data + stop(1)
        tx_shift <= {1'b1, tx_data, 1'b0};
        tx_busy <= 1;
        bit_index <= 0;
    end else if (tx_busy && baud_tick) begin
        tx <= tx_shift[0];
        tx_shift <= {1'b1, tx_shift[9:1]};
        bit_index <= bit_index + 1;
        if (bit_index == 9) tx_busy <= 0;
    end
end

endmodule
