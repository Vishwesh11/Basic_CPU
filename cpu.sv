`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2023 22:21:57
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu(

    input clk, rst

    );


logic load_pc, inc_pc, load_ir
logic [4:0] ir_addr, pc_addr, mem_data
logic [2:0] opcode


Progam_counter pc (.clk(clk), .rst(rst), .load_Pc(load_pc), .inc_pc(inc_pc), .pc_addin(ir_addr), .pc_addout(pc_addr));
Instruction_reg ir (.clk(clk), .rst(rst), .load_ir(load_ir), .mdata_in(mem_data), .ir_addr (ir_addr), .op_out  (opcode))




endmodule
