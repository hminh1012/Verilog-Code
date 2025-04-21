`ifndef PARAMETER_H_
`define PARAMETER_H_
`define col 16
`define row_i 15
`define row_d 8
`define filename "./test/50001111_50001212.o"
`define simulation_time #160
`endif

`timescale 1ns/1ps

module Risc_16_bit(
input clk
);

wire jump, bne, beq, mem_read,mem_write,alu_src,reg_dst,mem_to_reg,reg_write;
wire[1:0] alu_op;
wire[3:0] opcode;

Datapath_Unit DU
(
.clk(clk),
.jump(jump),
.beq(beq),
.mem_read(mem_read),
.mem_write(mem_write),
.alu_src(alu_src),    // Corrected spelling
.reg_dst(reg_dst),
.mem_to_reg(mem_to_reg),
.reg_write(reg_write),
.bne(bne),
.alu_op(alu_op),
.opcode(opcode)
);

Control_Unit control
(
.opcode(opcode),
.reg_dst(reg_dst),
.mem_to_reg(mem_to_reg),
.alu_op(alu_op),
.jump(jump),
.bne(bne),
.beq(beq),
.mem_read(mem_read),
.mem_write(mem_write),
.alu_src(alu_src),    // Corrected spelling
.reg_write(reg_write),


);
endmodule



module Control_Unit(
input[3:0] opcode,
output reg[1:0] alu_op,
output reg jump, beq, bne, mem_read, mem_write, alu_src, reg_dst, mem_to_reg,reg_write
);

always @(*)
begin
case(opcode)

4'b0000:
begin
reg_dst = 1'b0;
alu_src = 1'b1;
mem_to_reg = 1'b1;
reg_write= 1'b1;
mem_read = 1'b1;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b10;
jump = 1'b1;
end

4'b0001:
begin
reg_dst = 1'b0;
alu_src = 1'b1;
mem_to_reg = 1'b0;
reg_write= 1'b0;
mem_read = 1'b0;
mem_write = 1'b1;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b10;
jump = 1'b0;
end

4'b0010:
begin
reg_dst = 1'b1;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b1;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b00;
jump = 1'b0;
end

4'b0011:
begin
reg_dst = 1'b1;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b1;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b00;
jump = 1'b0;
end

4'b0100:
begin
reg_dst = 1'b1;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b1;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b00;
jump = 1'b0;
end

4'b0101:
begin
reg_dst = 1'b1;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b1;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b00;
jump = 1'b0;
end

4'b0110:
begin
reg_dst = 1'b1;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b1;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b00;
jump = 1'b0;
end


4'b0111:
begin
reg_dst = 1'b1;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b1;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b00;
jump = 1'b0;
end


4'b1000:
begin
reg_dst = 1'b1;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b1;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b00;
jump = 1'b0;
end


4'b1001:
begin
reg_dst = 1'b1;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b1;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b00;
jump = 1'b0;
end


4'b1011:
begin
reg_dst = 1'b0;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b0;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b1;
bne = 1'b0;
alu_op = 2'b01;
jump = 1'b0;
end

4'b1100:
begin
reg_dst = 1'b0;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b0;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b1;
alu_op = 2'b01;
jump = 1'b0;
end

4'b1101:
begin
reg_dst = 1'b0;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b0;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b00;
jump = 1'b1;
end

default:
begin
reg_dst = 1'b1;
alu_src = 1'b0;
mem_to_reg = 1'b0;
reg_write= 1'b1;
mem_read = 1'b0;
mem_write = 1'b0;
beq = 1'b0;
bne = 1'b0;
alu_op = 2'b00;
jump = 1'b0;
end

endcase
end

endmodule


module Datapath_Unit(
input clk,
input jump, beq, bne, mem_read, mem_write, alu_src, reg_dst, mem_to_reg,reg_write,
input[1:0] alu_op,
output[3:0] opcode
);

reg[15:0] pc_current;
wire[15:0] pc_next,pc2;
wire[15:0] instr;
wire[2:0] reg_write_dest;
wire[15:0] reg_write_data;
wire[2:0] reg_read_addr_1;
wire[15:0] reg_read_data_1;
wire[2:0] reg_read_addr_2;
wire[15:0] reg_read_data_2;
wire[15:0] ext_im,read_data2;
wire[2:0] ALU_Control;
wire[15:0] ALU_out;

wire zero_flag;
wire[15:0] PC_j,PC_beq,PC_2beq,PC_2bne,PC_bne;
wire beq_control;
wire[12:0] jump_shift;
wire[15:0] mem_read_data;

//PC
initial begin
pc_current <= 16'd0;
end
always @(posedge clk)
begin
pc_current <= pc_next;
end

assign pc2 = pc_current +16'd2;

Instruction_Memory im(
    .pc(pc_current),
    .instruction(instr)
);

assign jump_shift = {instr[11:0], 1'b0};
assign reg_write_dest = (reg_dst == 1'b1) ? instr[5:3] : instr[8:6];  // Fixed comparison operator
assign reg_read_addr_1 = instr[11:9];
assign reg_read_addr_2 = instr[8:6];

GPRs reg_file
(
.clk(clk),
.reg_write_en(reg_write),
.reg_write_dest(reg_write_dest),
.reg_write_data(reg_write_data),
.reg_read_addr_1(reg_read_addr_1),
.reg_read_data_1(reg_read_data_1),
.reg_read_addr_2(reg_read_addr_2),
.reg_read_data_2(reg_read_data_2),
);

assign ext_im = {{10{instr[5]}},instr[5:0]};
alu_control
ALU_Control_unit(.ALUOp(alu_op),.Opcode(instr[15:12]),.ALU_Cnt(ALU_Control));
assign read_data2 = (alu_src==1'b1)?ext_im:reg_read_data_2;

ALU alu_unit(.a(reg_read_data_1),.b(read_data2),.alu_control(ALU_Control),.result(ALU_out),.zero(zero_flag));
assign PC_beq = pc2 + {ext_im[14:0], 1'b0};
assign PC_bne = pc2 + {ext_im[14:0], 1'b0};
assign beq_control = beq & zero_flag;    // Fixed: continuous assignment with assign
assign bne_control = bne & (~zero_flag); // Fixed: continuous assignment with assign
assign PC_2beq = (beq_control == 1'b1) ? PC_beq : pc2;
assign PC_2bne = (bne_control == 1'b1) ? PC_bne : PC_2beq;
assign PC_j = {pc2[15:13], jump_shift};
assign pc_next = (jump == 1'b1) ? PC_j : PC_2bne;

Data_Memory dm
(
.clk(clk),
.mem_access_addr(ALU_out),
.mem_write_data(reg_read_data_2),
.mem_write_en(mem_write),
.mem_read(mem_read),
.mem_read_data(mem_read_data)
);

assign reg_write_data = (mem_to_reg == 1'b1)? mem_read_data:ALU_out;
assign opcode = instr[15:12];
endmodule

module alu_control(ALU_Cnt, ALUOp, Opcode);
output reg[2:0]ALU_Cnt;
input[1:0] ALUOp;
input [3:0]Opcode;
wire[5:0]ALUControlIn;
assign ALUControlIn = {ALUOp, Opcode};
always @(ALUControlIn)
casex(ALUControlIn)
6'b10xxxx: ALU_Cnt = 3'b000;
6'b01xxxx: ALU_Cnt = 3'b001;
6'b000010: ALU_Cnt = 3'b000;
6'b000011: ALU_Cnt = 3'b001;
6'b000100: ALU_Cnt = 3'b010;
6'b000101: ALU_Cnt = 3'b011;
6'b000110: ALU_Cnt = 3'b100;
6'b000111: ALU_Cnt = 3'b101;
6'b001000: ALU_Cnt = 3'b110;
6'b001001: ALU_Cnt = 3'b111;
default:ALU_Cnt = 3'b000;
endcase
endmodule

module ALU(
input[15:0] a,
input[15:0] b,
input[2:0] alu_control,
output reg[15:0] result,
output zero
);

always @(*)
begin
case(alu_control)
3'b000: result = a+b;
3'b001: result = a-b;
3'b010: result = ~a;
3'b011: result = a<<b;
3'b100: result = a>>b;
3'b101: result = a&b;
3'b110: result = a|b;
3'b111: begin 
if(a<b) 
result = 16'd1;
else 
result = 16'd0;
end

default: result =a+b;
endcase
end
assign zero = (result==16'd0)? 1'b1:1'b0;
endmodule

module Data_Memory(
input clk,
input[15:0] mem_access_addr,

input[15:0] mem_write_data,
input mem_write_en,
input mem_read,
output [15:0] mem_read_data
);

reg[`col-1:0]memory[`row_d-1:0];
integer f;
wire[2:0]ram_addr = mem_access_addr[2:0];
initial 
begin
$readmemb("D:/altera/91sp2/quartus/RISC/mem_data.txt",memory);
end

always @(posedge clk) begin
    if(mem_write_en)
        memory[ram_addr] <= mem_write_data;
end

assign mem_read_data = (mem_read == 1'b1) ? memory[ram_addr] : 16'd0;  // Fixed comparison operator

endmodule


module GPRs(
input clk,
input reg_write_en,
input [2:0] reg_write_dest,
input [15:0] reg_write_data,
input [2:0]reg_read_addr_1,
output [15:0]reg_read_data_1,

input [2:0] reg_read_addr_2,
output [15:0]reg_read_data_2
);

reg[15:0]reg_array[7:0];
integer i;

initial begin
for(i=0;i<8;i=i+1)
reg_array[i]<=16'd0;
end

always @(posedge clk)
begin
if(reg_write_en)
begin
reg_array[reg_write_dest] <= reg_write_data;
end
end

assign reg_read_data_1 = reg_array[reg_read_addr_1];
assign reg_read_data_2 = reg_array[reg_read_addr_2];

endmodule


module Instruction_Memory(
input[15:0] pc,
output[15:0] instruction
);

reg[15:0]memory[15:0];
wire[3:0] rom_addr = pc[4:1];
initial
begin
$readmemb("D:/altera/91sp2/quartus/RISC/mem_inst.txt",memory,0,14);
end
assign instruction = memory[rom_addr];
endmodule