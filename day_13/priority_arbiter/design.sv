module priority_arbiter(
    input [7:0] req,
    output reg [7:0] grant
);

always @(*) begin
    casez (req)
        8'b1???????: grant = 8'b10000000; // Highest priority
        8'b01??????: grant = 8'b01000000;
        8'b001?????: grant = 8'b00100000;
        8'b0001????: grant = 8'b00010000;
        8'b00001???: grant = 8'b00001000;
        8'b000001??: grant = 8'b00000100;
        8'b0000001?: grant = 8'b00000010;
        8'b00000001: grant = 8'b00000001; // Lowest priority
        default:      grant = 8'b00000000; // No request
    endcase
end

endmodule
