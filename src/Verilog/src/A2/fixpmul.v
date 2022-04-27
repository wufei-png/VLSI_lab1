module fixpmul
(
    input signed [31 : 0] a,
    input signed [31 : 0] b,
    output signed [31 : 0] o
);
 wire signed [63 : 0] long;
    assign long = (a * b);
    assign o = (long >>> 16);
endmodule