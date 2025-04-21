module barrel_shifter(clk,reset_n, load_en, data_in, data_out);
input clk;
input reset_n;
input load_en;
input[7:0] data_in;
output wire[7:0] data_out;
reg[7:0] tmp_data_out;


always@(posedge clk or negedge reset_n)
begin
if(~reset_n)
tmp_data_out <= 0;
else if(load_en)
tmp_data_out <= data_in;
else
tmp_data_out <= {tmp_data_out[6:0],tmp_data_out[7]};
end
assign data_out = tmp_data_out;
endmodule
