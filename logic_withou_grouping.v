module alu_design(clk, reset_n, op_code, a_in, b_in, cin, y_out, cout);
input clk, reset_n;
input[3:0] op_code;
input[15:0] a_in, b_in;
input cin;
output reg cout;
output [15:0] y_out;
reg [15:0] y_out;


always @ (posedge clk or negedge reset_n)
begin
if(~reset_n)
{cout, y_out} = 0;
else
case(op_code)
4'b0000 : {cout,y_out} = {1'b0,a_in};
4'b0001 : {cout,y_out} = a_in + b_in;
4'b0010 : {cout,y_out} = a_in + b_in + cin;
4'b0011 : {cout,y_out} = a_in - b_in;
4'b0100 : {cout,y_out} = a_in - b_in - cin;
4'b0101 : {cout,y_out} = a_in + 1'b1;
4'b0110 : {cout,y_out} = a_in - 1'b1;
4'b1000 : {cout,y_out} = {1'b0,(a_in|b_in)};
4'b1001 : {cout,y_out} = {1'b0,(a_in^b_in)};
4'b1010 : {cout,y_out} = {1'b0,(a_in&b_in)};
4'b1011 : {cout,y_out} = {1'b0,~a_in};
default : {cout, y_out} = 0;
endcase
end
endmodule