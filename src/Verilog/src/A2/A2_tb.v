`timescale 1ns/100ps
`include "./A2.v"
`include "./output_tb.v"
module A2_tb();
  reg clk;
  reg rst;
  wire [31:0]out;
  wire [15:0]ad;
  wire [31:0]data;
  wire finish_flag;

  reg[31:0]mem[10000:0];
  reg start_flag;
  reg [4:0]start_index;
  initial begin
    $display("start a clock pulse");    // 打印�?始标�?
    $dumpfile("wave.vcd");              // 指定记录模拟波形的文�?
    $dumpvars(0,A2_tb);          // 指定记录的模块层�?
  $readmemb("s_after_pre.txt",mem);
  clk<=0;
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
if(!rst) begin
  start_flag<=0;
  start_index<=0;

end
else begin 

if(start_index<=19)
  start_index=start_index+1;
if(start_index==19)start_flag<=1;
end
end
 always #8 clk=~clk;
 assign data=mem[ad];
 A2 A2(.clk(clk),.result(out),.data(data),.ad(ad),.rst(rst),.finish_flag(finish_flag));
 output_tb output_tb(.clk(clk),.rst(rst),.data(out),.start_flag(start_flag),.finish_flag(finish_flag));


 endmodule
