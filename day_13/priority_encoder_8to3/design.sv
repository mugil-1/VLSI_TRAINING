module priority_encoder_8to3(
    input [7:0] din,
    output reg [2:0] dout,
    output reg valid
);

always @(*) begin
    casez (din)
        8'b1???????: begin dout = 3'b111; valid = 1; end
        8'b01??????: begin dout = 3'b110; valid = 1; end
        8'b001?????: begin dout = 3'b101; valid = 1; end
        8'b0001????: begin dout = 3'b100; valid = 1; end
        8'b00001???: begin dout = 3'b011; valid = 1; end
        8'b000001??: begin dout = 3'b010; valid = 1; end
        8'b0000001?: begin dout = 3'b001; valid = 1; end
        8'b00000001: begin dout = 3'b000; valid = 1; end
        default:     begin dout = 3'b000; valid = 0; end
    endcase
end

endmodule
