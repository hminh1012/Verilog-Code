module BRAM_16to2(clk, write_en, enable, addr_in, data_in, q_out);
input clk;
input write_en;
input enable;

input [3:0] addr_in;
input [1:0] data_in;

output wire [1:0] q_out;


reg [1:0] BRAM_mem[0:15];
reg [3:0] read_address;

always @(posedge clk)
begin
if(enable)
if(write_en)
begin
BRAM_mem[addr_in] <= data_in;
read_address <= addr_in;
end
end
assign q_out = BRAM_mem[read_address];
endmodule