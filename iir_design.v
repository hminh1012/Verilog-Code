module iir_design(clk,reset_n, data_in, data_out);
parameter N = 15;
input clk;
input reset_n;
input[N-1:0] data_in;
output reg [N-1:0] data_out;
reg[N-1:0] tmp1_data_out, tmp2_data_out;

always@(posedge clk or negedge reset_n)
begin
if(~reset_n)
begin
tmp1_data_out <=0;
tmp2_data_out <=0;end

else begin
tmp1_data_out <=data_in;
tmp2_data_out <=tmp1_data_out+{tmp2_data_out[N-1],tmp2_data_out[N-2:0]} + {2{tmp2_data_out[N-1], tmp2_data_out[N-1:1]}} + {3{tmp2_data_out[N-1],tmp2_data_out[N-2],tmp2_data_out[N-1:2]}};
end
end

always@*
data_out <= tmp2_data_out;
endmodule
