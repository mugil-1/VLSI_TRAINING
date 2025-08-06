module vending_machine (
    input clk,
    input rst,
    input in_5,         // ₹5 input
    input in_10,        // ₹10 input
    output reg dispense // 1 when item is dispensed
);

    parameter S0 = 2'b00; // ₹0
    parameter S5 = 2'b01; // ₹5
    parameter S10 = 2'b10; // ₹10
    parameter S15 = 2'b11; // ₹15 or more

    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: begin
                if (in_5)
                    next_state = S5;
                else if (in_10)
                    next_state = S10;
                else
                    next_state = S0;
            end

            S5: begin
                if (in_5)
                    next_state = S10;
                else if (in_10)
                    next_state = S15;
                else
                    next_state = S5;
            end

            S10: begin
                if (in_5 || in_10)
                    next_state = S15;
                else
                    next_state = S10;
            end

            S15: begin
                next_state = S0; 
            end

            default: next_state = S0;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            dispense <= 0;
        else if (next_state == S15 && state != S15)
            dispense <= 1; 
        else
            dispense <= 0;
    end

endmodule
