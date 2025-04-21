module interface_logic(clk,reset_n,clr_flag,set_flag,data_in,data_out, status_flag);
parameter N = 8;

input  clk, reset_n;
input  clr_flag, set_flag;
input[N-1:0] data_in;
output[N-1:0] data_out;
output status_flag;

reg[N-1:0] buf_reg,buf_next;
reg flag_reg,flag_next;




always@ (posedge clk or negedge reset_n)
if(~reset_n)
begin
buf_reg<=0;
flag_reg <=0;
end

else
begin
buf_reg <= buf_next;
flag_reg <= flag_next;
end

//
always @(buf_reg,flag_reg,set_flag,clr_flag,data_in)
begin
buf_next <= buf_reg;
flag_next <= flag_reg;

if(set_flag)
begin
buf_next <= data_in;
flag_next <= 0;end

else if(clr_flag)begin
flag_next<=0;end
end

assign data_out=buf_reg;
assign status_flag = flag_reg;

endmodule

