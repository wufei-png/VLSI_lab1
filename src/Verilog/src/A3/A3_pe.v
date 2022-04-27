`include "./mul.v"
module A3_pe(
  input wire [31:0]in,
  inout clk,
  input rst,
  input wire [31:0]a1,
  input wire [31:0]a2,
  input wire [31:0]b1,
  input wire [31:0]b2,
  input wire  [1:0]ber,
  output wire [31:0]out);
  
 reg[31:0] reg1;reg[31:0]reg2; reg[31:0]add;reg[31:0]mul1;reg[31:0]mul2; 
wire [31:0]s0;wire [31:0]s1;wire [31:0]s2;wire [31:0]s3;
wire [31:0]add_to; wire [31:0] reg2_to;wire [31:0] reg1_to;wire [31:0] mul2_to;
 wire [31:0]mul_result; 
 fixpmul fixpmul_1(.a(s2),.b(s3),.o(mul_result));
 
  assign s0= (ber==2'b11)? in:reg1;
  assign s1=(ber==2'b00||ber==2'b10)? mul2:add; 
  assign s2=(ber==2'b00)? add:reg2;
  assign s3=(ber==2'b00)? 32'hffffffff-a1:(ber==2'b01)? b2:(ber==2'b10)? b1:32'hffffffff-a2;//right
  assign out=(ber==2'b10)?add:0;
  assign add_to=add;
  assign reg2_to=reg2;
  assign mul2_to=mul2;
  assign reg1_to=reg1;
  
  
  
always@(posedge clk or negedge rst) 
  begin if(!rst)
    begin   reg1<=0;reg2<=0;add<=0;mul1<=0;mul2<=0;
    end
else begin mul1<=mul_result;mul2<=mul1;add<=s0+s1;
        case(ber)
          2'b00:begin reg1<=add_to;reg2<=reg2_to;end
          2'b01:begin reg1<=mul2_to;reg2<=reg1_to;end
          2'b10:begin reg1<=0;reg2<=reg2_to;end
          default:begin reg1<=mul2_to;reg2<=reg2_to;end
              endcase
         end
         end
endmodule
  
  
  
