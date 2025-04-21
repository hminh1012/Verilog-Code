module parallel_in_serial_out(clk, reset_n, enable_in, data_out, data_in);
input clk, reset_n, enable_in;
input[15:0] data_in;
output data_out;
wire data_out;
reg[15:0] tmp_data_out;



always @ (posedge clk or negedge reset_n)
begin
if(~reset_n)
tmp_data_out <= 16'b0;

else if(enable_in)
tmp_data_out <= {data_in[0],data_in[15:1]};
end
assign data_out = tmp_data_out;
endmodule