module single_port_RAM(clk, address_in, write_en,enable_in, data_in, data_out);
input clk;
input [7:0] address_in;
input write_en;
input enable_in;
input [7:0] data_in;
output [7:0] data_out;

reg [7:0] data_out;
reg [7:0] RAM_MEM[255:0];

always @(posedge clk)
begin
if(enable_in)
begin
if(write_en)
begin

RAM_MEM[address_in] <= data_in;
end
else
data_out <= RAM_MEM[address_in];
end
end
endmodule