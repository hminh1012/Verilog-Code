module dual_port_1(clk_1, clk_2,enable_in_1, enable_in_2, write_en_1 , write_en_2, address_in_1, address_in_2, data_in_1, data_in_2, data_out_1, data_out_2);

input clk_1, clk_2;
input enable_in_1, enable_in_2;
input write_en_1, write_en_2;
input [7:0] address_in_1, address_in_2;
input [7:0] data_in_1, data_in_2;
output [7:0] data_out_1, data_out_2;

reg [7:0] data_out_1, data_out_2;
reg [7:0] ram_mem[255:0]; //code loi~, nhung vivado chay dc

always @(posedge clk_1)
begin
if(enable_in_1)
begin
if(write_en_1)
ram_mem[address_in_1] <= data_in_1;
data_out_1 <= ram_mem[address_in_1];

end
end

always @(posedge clk_2)
begin
if(enable_in_2)
begin
if(write_en_2)
ram_mem[address_in_2] <= data_in_2;
data_out_2 <= ram_mem[address_in_2];

end
end
endmodule