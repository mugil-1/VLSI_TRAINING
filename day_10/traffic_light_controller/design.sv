module traffic_light_controller (
    input clk,
    input rst,
    output reg red,
    output reg yellow,
    output reg green
);

    reg [1:0] state;
    reg [3:0] timer;

    // State encoding
    parameter RED = 2'b00,
              GREEN = 2'b01,
              YELLOW = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= RED;
            timer <= 0;
        end else begin
            if (timer == 4'd9) begin
                timer <= 0;
                case (state)
                    RED: state <= GREEN;
                    GREEN: state <= YELLOW;
                    YELLOW: state <= RED;
                    default: state <= RED;
                endcase
            end else begin
                timer <= timer + 1;
            end
        end
    end

    always @(*) begin
        red = 0; yellow = 0; green = 0;
        case (state)
            RED: red = 1;
            GREEN: green = 1;
            YELLOW: yellow = 1;
        endcase
    end

endmodule
