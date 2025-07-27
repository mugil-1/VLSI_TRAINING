module booth_multiplier_2bit (
    input signed [1:0] multiplicand,
    input signed [1:0] multiplier,
    output signed [3:0] product
);

reg signed [3:0] A, S, P;

always @(*) begin
    A = {multiplicand, 2'b00};             // A = M << 2
    S = {-multiplicand, 2'b00};            // S = -M << 2
    P = {2'b00, multiplier, 1'b0};         // P = {00, Q, Q-1}

    // Step 1
    case (P[1:0])
        2'b01: P = P + A;
        2'b10: P = P + S;
    endcase
    P = P >>> 1;  // Arithmetic shift

    // Step 2
    case (P[1:0])
        2'b01: P = P + A;
        2'b10: P = P + S;
    endcase
    P = P >>> 1;  // Arithmetic shift
end

assign product = P[3:0];

endmodule
