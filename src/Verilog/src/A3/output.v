module output_tb(
  input wire clk,input wire rst,
  input wire [31:0]data,
  input wire finish_flag,
  input wire start_flag,
  input wire [1:0]ber
  );
integer fid;
  initial
begin
	fid = $fopen("A3_s_pb.txt","w");
end

always@(posedge clk or negedge rst)
begin
if(!rst)
  begin end
  else if(ber==3)
  begin if(!finish_flag&&start_flag)
    begin
      $fwrite(fid, "%h\n", data);
    end
end
else begin end
  end
endmodule
