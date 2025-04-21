module mux_4to1(d_in, sel_in, q_out);
  input [3:0] d_in;  // 4-bit input data
  input [1:0] sel_in;  // 2-bit select input
  output q_out;  // Single output
  reg q_out;  // Register to store output

  always @ (*) begin
    case (sel_in)
      2'b00: q_out = d_in[0];
      2'b01: q_out = d_in[1];
      2'b10: q_out = d_in[2];
      2'b11: q_out = d_in[3];
      default: q_out = 1'b0; // Optional default case for safety
    endcase
  end
endmodule
