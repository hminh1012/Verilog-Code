module bidirectional_bus(data_to_bus,send_data, receive_data, data_from_bus, qout);
parameter N = 16;

input send_data;
input receive_data;

input[N-1:0] data_to_bus;
output[N-1:0]data_from_bus;

inout[N-1:0] qout;
wire[N-1:0] qout, data_from_bus;

assign data_from_bus = receive_data?qout:{N{1'bz}};
assign qout = send_data?data_to_bus:{N{1'bz}};



endmodule