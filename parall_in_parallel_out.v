module parall_in_parallel_out(clk, reset_n, enable_in, data_out, data_in);
input clk, reset_n, enable_in;
input[15:0] data_in;
output [15:0] data_out;
reg[15:0] data_out;



always @ (posedge clk or negedge reset_n)
begin
if(~reset_n)
data_out <= 16'b0;

else if(enable_in)
data_out <= data_in;
end
endmodule