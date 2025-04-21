module shift_register(clk, reset_n, op_code, data_out, data_in, MSB_out, LSB_out);
input clk, reset_n;
input[1:0] op_code;
input[15:0] data_in;

output MSB_out,LSB_out;
output [15:0] data_out;
wire [15:0] y_out;
reg[15:0] tmp_data_out;


always @ (posedge clk or negedge reset_n)
begin
if(~reset_n)
tmp_data_out <= 16'b0;

else
case(op_code)
2'b00:tmp_data_out <= data_in;
2'b01:tmp_data_out <= {data_in[0],data_in[15:1]};
2'b10:tmp_data_out <= {data_in[14:0],data_in[15]};
2'b11:tmp_data_out <= tmp_data_out;

endcase
end
assign data_out = tmp_data_out;
assign MSB_out = tmp_data_out[15];
assign LSB_out = tmp_data_out[0];
endmodule