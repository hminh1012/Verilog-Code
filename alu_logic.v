module alu_logic(clk, reset_n, op_code, a_in, b_in, cin, y_out, cout);
input clk, reset_n;
input[3:0] op_code;
input[15:0] a_in, b_in;
input cin;
output reg cout;
output [15:0] y_out;
reg [15:0] y_out;
reg temp;
initial temp = 0;


always @ (posedge clk or negedge reset_n)
begin
if(~reset_n)
{cout, y_out} = 0;
else


if (op_code==4'b0000)  {cout,y_out} = {temp,a_in};
else if (op_code==4'b0001)  {cout,y_out} = a_in + b_in;
else if (op_code==4'b0010)  {cout,y_out} = a_in + b_in + cin;
else if (op_code==4'b0011)  {cout,y_out} = a_in - b_in;
else if (op_code==4'b0100)  {cout,y_out} = a_in - b_in - cin;
else if (op_code==4'b0101)  {cout,y_out} = a_in + temp;
else if (op_code==4'b0110)  {cout,y_out} = a_in - temp;
else if (op_code==4'b1000)  {cout,y_out} = {temp,(a_in|b_in)};
else if (op_code==4'b1001)  {cout,y_out} = {temp,(a_in^b_in)};
else if (op_code==4'b1010)  {cout,y_out} = {temp,(a_in&b_in)};
else if (op_code==4'b1011)  {cout,y_out} = {temp,~a_in};
else
{cout,y_out} = 16'b0;

end
endmodule