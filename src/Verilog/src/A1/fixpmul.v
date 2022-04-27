module fixpmul
(
    input signed [31 : 0] a,
    input signed [31 : 0] b,//有符号数的乘法器
    output signed [31 : 0] o
);
 wire signed [63 : 0] long;
    assign long = a * b;//32位乘以32位为64位
    assign o = long >>> 16;//右移16位并把它赋值给32位的o，代表舍弃16位小数中的低8位，而16位整数中的高16位看数据全为0，因此也舍弃，因为结果数据应该是32位的，否则无法级联
endmodule