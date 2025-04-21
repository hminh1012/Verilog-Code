module distributed_ram(clk, write_en, address_in_1, address_in_2, data_in, data_out_1, data_out_2);
input clk;
input write_en;

input [7:0] address_in_1;
input [7:0] address_in_2;
input [7:0] data_in;

output [7:0] data_out_1;
output [7:0] data_out_2;

reg [7:0] ram_mem[255:0];

always @(posedge clk)
begin
if(write_en)
ram_mem[address_in_1] <= data_in;
end

assign data_out_1 = ram_mem[address_in_1];
assign data_out_2 = ram_mem[address_in_2];
endmodule