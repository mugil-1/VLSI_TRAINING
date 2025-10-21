module uart_rx (
    input clk,           // system clock
    input reset,         // async reset
    input rx,            // serial input
    output reg [7:0] rx_data, // received byte
    output reg rx_done   // high for 1 cycle when a byte is received
);

parameter CLK_FREQ = 10000000;  // 10 MHz clock
parameter BAUD_RATE = 9600;
localparam integer BAUD_COUNT = CLK_FREQ / BAUD_RATE;

reg [15:0] baud_cnt;
reg [3:0] bit_index;
reg [9:0] rx_shift;
reg rx_sync1, rx_sync2;
reg receiving;

// synchronize rx to clk domain
always @(posedge clk) begin
    rx_sync1 <= rx;
    rx_sync2 <= rx_sync1;
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        baud_cnt <= 0;
        bit_index <= 0;
        receiving <= 0;
        rx_done <= 0;
        rx_data <= 8'b0;
    end else begin
        rx_done <= 0;

        if (!receiving) begin
            // detect start bit (falling edge)
            if (rx_sync2 == 0) begin
                receiving <= 1;
                baud_cnt <= BAUD_COUNT/2; // sample mid-bit
                bit_index <= 0;
            end
        end else begin
            if (baud_cnt == BAUD_COUNT - 1) begin
                baud_cnt <= 0;
                bit_index <= bit_index + 1;

                // sample each bit
                rx_shift <= {rx_sync2, rx_shift[9:1]};

                // after 10 bits (1 start + 8 data + 1 stop)
                if (bit_index == 9) begin
                    receiving <= 0;
                    rx_data <= rx_shift[8:1]; // extract data bits
                    rx_done <= 1;
                end
            end else
                baud_cnt <= baud_cnt + 1;
        end
    end
end

endmodule
