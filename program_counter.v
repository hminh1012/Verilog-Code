module program_counter(clk, reset_n, pc_in, load_pc, incr_pc,pc);
parameter size = 16;
input clk, reset_n, load_pc, incr_pc;
input[size-1:0] pc_in;
output[size-1:0] pc;

reg[size-1:0] pc_out;



always @ (posedge clk or negedge reset_n)
begin
if(~reset_n)
pc_out <= 16'b0;

else if(load_pc)
pc_out <= pc_in;

else if(incr_pc)
pc_out <= pc_out+1;
end
assign pc = pc_out;
endmodule