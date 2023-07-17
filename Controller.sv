// Code your design here
`timescale 1ns / 1ps
/*package typedefs;

        typedef enum logic[2:0] { HLT, SKZ, ADD, AND, XOR, LDA, STO, JMP} opcode_t;
        typedef enum { inst_addr, inst_fetch, inst_load, idle, op_addr, op_fetch, alu_op, store} state_t;

endpackage*/


//import typedefs::*;


module Controller(

        input [2:0] opcode,
        input zero, clk, rst, 
        output logic mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr,
        output logic [2:0] cs 
        );

//logic []

//opcode_t op;
enum { HLT, SKZ, ADD, AND, XOR, LDA, STO, JMP} op;
enum { inst_addr, inst_fetch, inst_load, idle, op_addr, op_fetch, alu_op, store} st;
//state_t  st;
logic [2:0] cur_st , nxt_st;


always_ff @(posedge clk, negedge rst) begin

    if(!rst) begin
        cur_st <= inst_addr;
    end
    else
        cur_st <= nxt_st;

end


always_comb begin 
    
    case (cur_st)
        inst_addr : begin 
                            mem_rd = 0; load_ir = 0; halt= 0; inc_pc=0; load_ac=0; load_pc=0; mem_wr=0;
                            nxt_st = cur_st + 1; cs = 000; 
                       end
        inst_fetch : begin
                            mem_rd = 1; load_ir = 0; halt= 0; inc_pc=0; load_ac=0; load_pc=0; mem_wr=0;
                            nxt_st = cur_st + 1; cs = 001;
                        end
        inst_load : begin 
                            mem_rd = 1; load_ir = 1; halt= 0; inc_pc=0; load_ac=0; load_pc=0; mem_wr=0;
                            nxt_st = cur_st + 1; cs = 010; 
                       end
        idle      : begin
                            mem_rd = 1; load_ir = 1; halt= 0; inc_pc=0; load_ac=0; load_pc=0; mem_wr=0;
                            nxt_st = cur_st + 1; cs = 011;
                       end
        op_addr   : begin
                            if(opcode == HLT) begin 
                                mem_rd = 0; load_ir = 0; halt= 1; inc_pc=0; load_ac=0; load_pc=0; mem_wr=0;
                                nxt_st = cur_st + 1; cs = 100; 
                            end
                       end
        op_fetch   : begin
                            cs = 101;
                            if(opcode == ADD || opcode == AND || opcode==XOR || opcode == LDA ) begin 
                                mem_rd = 1; load_ir = 0; halt= 0; inc_pc=0; load_ac=0; load_pc=0; mem_wr=0;
                                nxt_st = cur_st + 1; 
                            end
                       end
        alu_op  : begin
                             cs = 110;
                            if(opcode == ADD || opcode == AND || opcode==XOR || opcode == LDA ) begin
                                mem_rd = 1; load_ir = 0; halt= 0; inc_pc=0; load_ac=1; load_pc=0; mem_wr=0;
                                nxt_st = cur_st + 1; 
                            end
                            else if(opcode == SKZ && zero) begin 
                                mem_rd = 0; load_ir = 0; halt= 0; inc_pc=1; load_ac=0; load_pc=0; mem_wr=0;
                                nxt_st = cur_st + 1; 
                            end
                            else if(opcode == JMP) begin 
                                mem_rd = 0; load_ir = 0; halt= 0; inc_pc=0; load_ac=0; load_pc=1; mem_wr=0;
                                nxt_st = cur_st + 1; 
                            end

                       end 
        store  : begin      cs = 111;
                            if(opcode == ADD || opcode == AND || opcode==XOR || opcode == LDA ) begin 
                                mem_rd = 1; load_ir = 0; halt= 0; inc_pc=0; load_ac=1; load_pc=0; mem_wr=0;
                                nxt_st = cur_st + 1; 
                            end
                            else if(opcode == JMP) begin 
                                mem_rd = 0; load_ir = 0; halt= 0; inc_pc=1; load_ac=0; load_pc=1; mem_wr=0;
                                nxt_st = cur_st + 1; 
                            end
                            else if(opcode == STO) begin 
                                mem_rd = 0; load_ir = 0; halt= 0; inc_pc=0; load_ac=0; load_pc=0; mem_wr=1;
                                nxt_st = cur_st + 1; 
                            end

                       end 
        default: begin      cs = 000;
                            mem_rd = 0; load_ir = 0; halt= 0; inc_pc=0; load_ac=0; load_pc=0; mem_wr=0;
                            nxt_st = cur_st + 1;
                 end
    endcase
    
end


endmodule
