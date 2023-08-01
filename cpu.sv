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


logic load_pc, inc_pc, load_ir, mem_rd, mem_wr, load_ac, zero, halt;
logic [4:0] ir_addr, pc_addr, mem_dataOut, mxMem_addr;
logic [2:0] opcode , curren_state, p_state;
logic [7:0] alu_out, acc_out;

logic [6:0] control_sig;

control_sig = {mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr};



Progam_counter pc  (.clk(clk), .rst(rst), .load_Pc(load_pc), .inc_pc(inc_pc), .pc_addin(ir_addr), .pc_addout(pc_addr));
Instruction_reg ir (.clk(clk), .rst(rst), .load_ir(load_ir), .mdata_in(mem_dataOut), .ir_addr (ir_addr), .op_out  (opcode));
Memory mem         (.clk(clk), .rst(rst), .mem_rd(mem_rd), .mem_wr(mem_wr), .mem_add(mxMem_addr) .mem_din(alu_out), .mem_dout(mem_dataOut));
Accum acc          (.clk(clk), .rst(rst), .load_ac(load_ac), .accm_din(alu_out), .accum_dout(acc_out));
Alu   alu          (.clk(clk),            .opcode(opcode), .accum(acc_out), .data(mem_dataOut), .zero(zero));
Controller con     (.clk(clk), .rst(rst), .opcode(opcode), .zero(zero), .mem_rd (mem_rd), .mem_wr (mem_wr), .load_ir(load_ir), .load_ac(load_ac), 
                                                                        .load_pc(load_pc), .inc_pc (inc_pc), .halt(halt), .cs(curren_state));


always_ff @(posedge clk or negedge rst) begin 

    if(~rst) begin
        load_pc <= 0; inc_pc <=0; load_ir <=0; mem_rd <=0; mem_wr <=0; load_ac <= 0; halt <= 0;
        pc_addr <= 5'b00000;
    end 

    else begin
        
        case (control_sig)

            0000000: begin
                     end 

            0000001: begin 
                            if(mem_rd) 

        
            default : /* default */;
        endcase

    end
end




endmodule
