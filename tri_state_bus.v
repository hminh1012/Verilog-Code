module tri_state_bus(a_in,enable_in, y_out);

input[31:0] a_in;
input enable_in;
output[31:0] y_out;
reg[31:0]y_out;




always @ (*)
begin
if(enable_in)
y_out = a_in;

else 
y_out = 32'bz;


end

endmodule