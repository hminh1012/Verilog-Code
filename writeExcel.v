`timescale 1 ns/10 ps //
module writeExcel;
localparam M=12, N=4, period=20;
reg clk, reset;
wire complete_tick;
//
wire [N-1:0] count;
reg [N-1:0] desired_count;
reg [39:0] error_msg;
//

reg [3:0] read_data [0:M-1];
integer counter_data;
integer i =0, j=0, toal_cycle=M;

modMCounter #(.M(M), .N(N)) UUT(.clk(clk), .reset(reset), .complete_tick(complete_tick), .count(count));
always @(posedge clk)
begin
$readmemb("D:/ProjectModelSim/counter_init.txt", read_data);
if (reset) desired_count = 0;
else 
begin 
desired_count = read_data[j];
j=j+1;
end
end

initial 
begin
counter_data = $fopen ("D:/ProjectModelSim/counter_output.csv");
end
always 
begin
clk = 1'b1;
#20;
clk = 1'b0;

#20;
end
initial 
begin
reset =1;
#(period);
reset = 0;
end

always @(posedge clk)
begin
if(total_cycle == 1)
begin

$stop;
$fclose(counter_data);
end
i = i+1;
end

always @(negedge clk)
begin
if(desired_count == count)
error_msg="  ";
else
error_msg ="error";
end

initial
begin
$display("time,desired_count,count,complete_tick,error_msg");
$monitor("%6d, %4h, %4h, %5b, %15s", $time, desired_count, count, complete_tick, error_msg);
$fdisplay(counter_data,"time,desired_count,count,complete_tick, error_msg");

$fmonitor(counter_data,"%d, %h, %h, %b, %s", $time, desired_count, count, complete_tick, error_msg);
end
endmodule