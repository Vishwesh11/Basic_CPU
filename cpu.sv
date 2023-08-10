`timescale 1ns / 1ps

module cpu(

    input clk, rst

    );


logic load_pc, inc_pc, load_ir, mem_rd, mem_wr, load_ac, zero, halt;
logic [4:0] ir_addr, pc_addr, mxMem_addr;
logic [2:0] opcode , curren_state, p_state;
logic [7:0] alu_out, acc_out, mem_dataOutIR, mem_dataOutALU;

logic [6:0] control_sig;


Progam_counter pc  (.clk(clk), .rst(rst), .load_Pc(load_pc), .inc_pc(inc_pc), .pc_addin(ir_addr), .pc_addout(pc_addr));
Instruction_reg ir (.clk(clk), .rst(rst), .load_ir(load_ir), .mdata_in(mem_dataOutIR), .ir_addr (ir_addr), .op_out  (opcode));
Memory mem         (.clk(clk), .rst(rst), .mem_rd(mem_rd), .mem_wr(mem_wr), .mem_add(mxMem_addr) .mem_din(alu_out), .mem_dout(mem_dataOut));
Accum acc          (.clk(clk), .rst(rst), .load_ac(load_ac), .accm_din(alu_out), .accum_dout(acc_out));
Alu   alu          (.clk(clk),            .opcode(opcode), .accum(acc_out), .data(mem_dataOutALU), .zero(zero));
Controller con     (.clk(clk), .rst(rst), .opcode(opcode), .zero(zero), .mem_rd (mem_rd), .mem_wr (mem_wr), .load_ir(load_ir), .load_ac(load_ac), 
                                                                        .load_pc(load_pc), .inc_pc (inc_pc), .halt(halt), .cs(curren_state));


//Assigning value to fetch-(control signal)
assign fetch = (load_ir) ? 1'b1 : 1'b0 ;

//Mux to provide ether (addr of Instruction) or (addr of data to memory)
assign mxMem_addr = (fetch) ? pc_addout : ir_addr; 

//De-Mux to select either the data coming of memory is Instrction or AluData
 if(load_ir) mem_dataOutIR = mxMem_data ;
 else        mem_dataOutALU = mxMem_data;


endmodule
