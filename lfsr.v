module lfsr(clk,y_out);
input clk;
output[5:0] y_out;
reg[5:0] tmp_reg;
integer k;
always @(posedge clk)
begin
tmp_reg[0] <= tmp_reg[4]~^tmp_reg[5];
for(k=5;k>=1;k=k-1)
tmp_reg[k]<=tmp_reg[k-1];
end
assign y_out = tmp_reg;
endmodule