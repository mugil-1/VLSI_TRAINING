module mealy_110_detector (
    input clk,
    input rst,
    input in,
    output reg out
);

    parameter S0 = 2'b00,  
              S1 = 2'b01,  
              S2 = 2'b10;  

    reg [1:0] current_state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            S0: begin
                if (in) begin
                    next_state = S1;
                    out = 0;
                end else begin
                    next_state = S0;
                    out = 0;
                end
            end
            S1: begin
                if (in) begin
                    next_state = S2;
                    out = 0;
                end else begin
                    next_state = S0;
                    out = 0;
                end
            end
            S2: begin
                if (in) begin
                    next_state = S2;
                    out = 0;
                end else begin
                    next_state = S0;
                    out = 1; // 110 detected
                end
            end
            default: begin
                next_state = S0;
                out = 0;
            end
        endcase
    end

endmodule
