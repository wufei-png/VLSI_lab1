`include "./fixpmul.v"
module pe(
  input wire [31:0]in,
  inout clk,
  input rst,
  input wire [31:0]a1,
  input wire [31:0]a2,
  input wire [31:0]b1,
  input wire [31:0]b2,
  output reg [31:0]result);
  wire [31:0]out;
  reg [31:0]reg1;
  reg [31:0]reg2;
    reg [31:0]buffer0;
  reg [31:0]buffer1;
  reg [31:0]buffer2;
  wire [31:0]in_1;
   wire [31:0] out1;
  wire [31:0] out2;
  wire [31:0] out3; 
  wire [31:0] out4;
always@(posedge clk or negedge rst) 
  if(!rst)
    begin reg1<=0;reg2<=0;  buffer0<=0;buffer1<=0;buffer2<=0;result<=0;
    end
  else
        begin 
          buffer0<=in-in_1; 
          buffer1<=reg1;
          buffer2<=reg2;//见报告中描述
          reg1<=in-in_1; 
          reg2<=reg1;
          result<=out;
        end

assign in_1=out1+out2;
assign out=buffer0+out3+out4;


fixpmul fixpmul_1(.a(a2),.b(reg2),.o(out1));
fixpmul fixpmul_2(.a(a1),.b(reg1),.o(out2));
fixpmul fixpmul_3(.a(b1),.b(buffer1),.o(out3));
fixpmul fixpmul_4(.a(b2),.b(buffer2),.o(out4));
endmodule