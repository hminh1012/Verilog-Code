module arbiter(clk, reset, reqs, grants);
input clk, reset;
input [2:0] reqs;
output reg [2:0] grants;
always@(posedge clk)
if(reset) grants<=0;
else begin
grants[0]<= reqs[0]; // Highest static priority
grants[1]<= reqs[1] && !(reqs[0]);
grants[2]<= reqs[2] && !(reqs[0] || reqs [1]);
end
endmodule