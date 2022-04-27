module output_tb(
  input wire clk,input wire rst,
  input wire [31:0]data,
  input wire finish_flag,
  input wire start_flag
  );
integer fid;
  initial
begin
	fid = $fopen("s_pb.txt","w");
end

always@(posedge clk or negedge rst)
begin
if(!rst)
  begin end
  else if(!finish_flag&&start_flag)
    begin
      $fwrite(fid, "%h\n", data);
    end
end
endmodule