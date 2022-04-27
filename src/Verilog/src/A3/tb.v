`timescale 1ns/100ps
`include "./A3.v"
`include "./output.v"
module Ax_tb();
  reg clk;
  reg rst;
  wire [31:0]out;
  wire [15:0]ad;
  wire [31:0]data;
  wire [1:0]ber;
  reg[31:0]mem[10000:0];
  reg start_flag;  
  wire finish_flag;
  initial begin
    $display("start a clock pulse");    // 打印开始标记
    $dumpfile("wave.vcd");              // 指定记录模拟波形的文件
    $dumpvars(0,Ax_tb);          // 指定记录的模块层级
  $readmemb("s_after_pre.txt",mem);
  clk<=1;
  rst<=1;
  #1  rst<=0;
  #1  rst<=1;
      while (!finish_flag)
        #0.5;
    $finish;
    $display("finish!");
end
always@(posedge clk or negedge rst) 
begin 
if(!rst)
  start_flag<=0;
else start_flag<=1;
end

 always #5 clk=~clk;
 assign data=mem[ad];
 A3 A3(.clk(clk),.result(out),.data(data),.ad(ad),.rst(rst),.finish_flag(finish_flag),.ber(ber));
 output_tb output_tb(.clk(clk),.rst(rst),.data(out),.start_flag(start_flag),.finish_flag(finish_flag),.ber(ber));


 endmodule