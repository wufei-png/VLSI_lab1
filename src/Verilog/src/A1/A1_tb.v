`timescale 1ns/100ps
`include "./A1.v"
`include "./output_tb.v"
module A1_tb();
  reg clk;
  reg rst;
  wire [31:0]out; //输出结果
  wire [15:0]ad;
  wire [31:0]data;
  wire finish_flag;
  reg[31:0]mem[10000:0];
  reg start_flag;
  reg [2:0]start_index;
  initial begin
    $display("start a clock pulse");    
    $dumpfile("wave.vcd");             //波形debug
    $dumpvars(0,A1_tb);          
  $readmemb("s_after_pre.txt",mem);
  clk<=0;
  rst<=1;
  #1  rst<=0;
  #1  rst<=1;
      while (!finish_flag)//结束标志
        #0.5;
    $finish;
    $display("finish!");
end
always@(posedge clk or negedge rst)
begin
if(!rst) begin
  start_flag<=0;//第一个数据进入到输出需要一定间隔
  start_index<=0;//start_flag的计数
end
else begin 
if(start_index<=5)
  start_index=start_index+1;
if(start_index==4)start_flag<=1;
end
end
 always #8 clk=~clk;
 assign data=mem[ad];
 A1 A1(.clk(clk),.result(out),.data(data),.ad(ad),.rst(rst),.finish_flag(finish_flag));//主体module
 output_tb output_tb(.clk(clk),.rst(rst),.data(out),.start_flag(start_flag),.finish_flag(finish_flag));//写结果到文件


 endmodule
