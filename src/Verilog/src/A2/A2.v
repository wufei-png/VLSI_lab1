`include "./pe.v"
module A2(
  input clk,
  input rst,
  input wire [31:0]data,
  output reg [31:0]result,
  output reg [15:0]ad,
  output reg finish_flag);
  
  wire [31:0]out_1;wire[31:0] out_2;wire [31:0]out_3;wire [31:0]out_4;wire [31:0]out_5;wire [31:0]out_6;wire [31:0]out_7;
  reg [31:0]a1_0;reg [31:0]a1_1;reg [31:0]b1_1;reg [31:0]b1_2;
  reg [31:0]a2_0;reg [31:0]a2_1;reg [31:0]b2_1;reg [31:0]b2_2;
  reg [31:0]a3_0;reg [31:0]a3_1;reg [31:0]b3_1;reg [31:0]b3_2;
  reg [31:0]a4_0;reg [31:0]a4_1;reg [31:0]b4_1;reg [31:0]b4_2;
  reg [31:0]a5_0;reg [31:0]a5_1;reg [31:0]b5_1;reg [31:0]b5_2;
  reg [31:0]a6_0;reg [31:0]a6_1;reg [31:0]b6_1;reg [31:0]b6_2;
  reg [31:0]a7_0;reg [31:0]a7_1;reg [31:0]b7_1;reg [31:0]b7_2;
  reg [31:0]a8_0;reg [31:0]a8_1;reg [31:0]b8_1;reg [31:0]b8_2;
  wire [31:0]out;
  wire [31:0] out_0;
  reg [31:0]gm;
   reg [31:0]ppl_in;
   reg [31:0]ppl_0;
  fixpmul fixpmul_10(.a(ppl_in),.b(gm),.o(out_0));
  pe pe1(.in(ppl_0),.a1(a1_0),.a2(a1_1),.b1(b1_1),.b2(b1_2),.result(out_1),.clk(clk),.rst(rst));
  pe pe2(.in(out_1),.a1(a2_0),.a2(a2_1),.b1(b2_1),.b2(b2_2),.result(out_2),.clk(clk),.rst(rst));
  pe pe3(.in(out_2),.a1(a3_0),.a2(a3_1),.b1(b3_1),.b2(b3_2),.result(out_3),.clk(clk),.rst(rst));
  pe pe4(.in(out_3),.a1(a4_0),.a2(a4_1),.b1(b4_1),.b2(b4_2),.result(out_4),.clk(clk),.rst(rst));
  pe pe5(.in(out_4),.a1(a5_0),.a2(a5_1),.b1(b5_1),.b2(b5_2),.result(out_5),.clk(clk),.rst(rst));
  pe pe6(.in(out_5),.a1(a6_0),.a2(a6_1),.b1(b6_1),.b2(b6_2),.result(out_6),.clk(clk),.rst(rst));
  pe pe7(.in(out_6),.a1(a7_0),.a2(a7_1),.b1(b7_1),.b2(b7_2),.result(out_7),.clk(clk),.rst(rst));
  pe pe8(.in(out_7),.a1(a8_0),.a2(a8_1),.b1(b8_1),.b2(b8_2),.result(out),.clk(clk),.rst(rst));

  always@(posedge clk or negedge rst)
  if(!rst)  
  begin 
  
    a1_0=32'h00001500;a1_1=32'h00003a00;b1_1=32'h00000000;b1_2=32'hfffe45ff;
    a2_0=32'h00000000;a2_1=32'hffff6cff;b2_1=32'h00000000;b2_2=32'hffff6cff;
    a3_0=32'h00006400;a3_1=32'h00005700;b3_1=32'h00024500;b3_2=32'h00015600;
    a4_0=32'hffff54ff;a4_1=32'h00006300;b4_1=32'hfffdbbff;b4_2=32'h00015600;
    a5_0=32'h0000a600;a5_1=32'h00008e00;b5_1=32'h0001f500;b5_2=32'h00010000;
    a6_0=32'hffff15ff;a6_1=32'h00009600;b6_1=32'hfffe0bff;b6_2=32'h00010000;
    a7_0=32'h0000da00;a7_1=32'h0000d300;b7_1=32'h0001b300;b7_2=32'h0000c000;
    a8_0=32'hfffedcff;a8_1=32'h0000d800;b8_1=32'hfffe4dff;b8_2=32'h0000c000;
    gm=32'h000000c0;
    result<=0;
    ad<=0;
    finish_flag<=0;
    ppl_in<=0;
    ppl_0<=0;

  end
  else  begin
    result<=out;
    ppl_in<=data;
    ppl_0<=out_0;
      ad<=ad+1;
    if(ad==10018)
      finish_flag<=1;
  end

endmodule
