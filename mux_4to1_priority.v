module mux_4to1_priority(d_in, sel_in, q_out);
  input [3:0] d_in;  // 4-bit input data
  input [1:0] sel_in;  // 2-bit select input
  output reg q_out;  // Register to store output

  always @ (*) begin
    // Priority logic: If sel_in matches a specific value, assign the corresponding input
    if(sel_in == 2'b00)
      q_out = d_in[0];  // Select input 0
    else if(sel_in == 2'b01)
      q_out = d_in[1];  // Select input 1
    else if(sel_in == 2'b10)
      q_out = d_in[2];  // Select input 2
    else 
      q_out = d_in[3];  // Select input 3
  end
endmodule
