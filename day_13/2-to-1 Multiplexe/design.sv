// 2-to-1 Multiplexer (basic building block)
module mux2to1(
    input a, b, sel,
    output y
);
    assign y = sel ? b : a;
endmodule

// 4-to-1 Multiplexer using 2-to-1 muxes
module mux4to1(
    input [3:0] d,
    input [1:0] sel,
    output y
);
    wire y0, y1;

    mux2to1 m1(.a(d[0]), .b(d[1]), .sel(sel[0]), .y(y0));
    mux2to1 m2(.a(d[2]), .b(d[3]), .sel(sel[0]), .y(y1));
    mux2to1 m3(.a(y0), .b(y1), .sel(sel[1]), .y(y));
endmodule

// 8-to-1 Multiplexer (structural design)
module mux8to1(
    input [7:0] d,
    input [2:0] sel,
    output y
);
    wire y0, y1;

    mux4to1 m4_1(.d(d[3:0]), .sel(sel[1:0]), .y(y0));
    mux4to1 m4_2(.d(d[7:4]), .sel(sel[1:0]), .y(y1));
    mux2to1 m_final(.a(y0), .b(y1), .sel(sel[2]), .y(y));
endmodule
