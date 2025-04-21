module fir_design(clk,reset_n, data_in, data_out);
parameter N = 8;
input clk;
input reset_n;
input[N-1:0] data_in;
output [N-1:0] data_out;
reg[N-1:0] tmp_0, tmp_1, tmp_2,tmp_3;
reg[N-1:0] data_out, tap_0, tap_1, tap_2, tap_3;

always@(posedge clk or negedge reset_n)
begin
if(~reset_n)
begin
data_out <= 0;
{tmp_0,tmp_1,tmp_2,tmp_3}<={1'b0,1'b0,1'b0,1'b0};
tap_3<=0;
tap_2<=0;
tap_1<=0;
tap_0<=0;
end

else begin
tmp_1 <=tap_1<<1+tap_1+{tap_1[7], tap_1[7:1]}+{tap_1[7],tap_1[7],tap_1[7:2]};
tmp_2 <=tap_2<<1+tap_2+{tap_2[7], tap_2[7:1]}+{tap_2[7],tap_2[7],tap_2[7:2]};
tmp_3<=tap_3;
tmp_0<=tap_0;

data_out<=tmp_1+tmp_2-(tmp_3+tmp_0);
tap_3<=tap_2;
tap_2<=tap_1;
tap_1<=tap_0;
tap_0<=data_in;
end
end
endmodule