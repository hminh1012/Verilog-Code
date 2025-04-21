module register_file(clk, reset_n, write_addr, write_en, data_in,read_addr, data_out);
parameter size = 16;
parameter addr = 4; 
input clk, reset_n;

input[addr-1:0] write_addr, read_addr;
input write_en;

input[size-1:0] data_in;
output[size-1:0] data_out;

reg[size-1:0] reg_file[0:addr-1];



always @ (posedge clk or negedge reset_n)
begin
if(~reset_n)
reg_file[write_addr] <= 16'b0;

else if(write_en)
reg_file[write_addr] <= data_in;


end
assign data_out=reg_file[read_addr];
endmodule