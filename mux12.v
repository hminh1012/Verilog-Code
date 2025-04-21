module tn12(SW,LEDR,LEDG);
input [9:0]SW;
output [9:0]LEDR;
output [3:0]LEDG;
assign LEDR=SW;
Mux21(SW[9],SW[0],SW[4],LEDG[0]);
Mux21(SW[9],SW[1],SW[5],LEDG[1]);
Mux21(SW[9],SW[2],SW[6],LEDG[2]);
Mux21(SW[9],SW[3],SW[7],LEDG[3]);
endmodule
module Mux21(S,X,Y,M);
input S,X,Y;
output M;
assign M=(~S&X)|(S&Y);
endmodule