module baud_gen(clk,reset_n, max_tick_size, q_out);
parameter N = 4;
parameter Y = 10;

input clk,reset_n;


output max_tick_size;
output[N-1:0] q_out;
wire[N-1:0] q_out;

reg[N-1:0]tmp_reg;
reg[N-1:0]tmp_next;

reg max_tick_size;

always @ (posedge clk or negedge reset_n)
begin
if (reset_n==0)
tmp_reg<=0;
else
tmp_reg <= tmp_next;
end

always @ (tmp_reg)
begin
if(tmp_reg==Y-1)
begin
tmp_next<=0;
max_tick_size<=1'b0;
end
else

begin
tmp_next<=tmp_reg+1;
max_tick_size<=1'b1;
end
end
endmodule


