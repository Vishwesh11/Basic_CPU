// Code your design here
module alu
  (
    input [7:0] accum, data,
    input [2:0] opcode,
    input clk,
    output logic [7:0] out,
    output  zero 
  );
  
 //opcode_t op;
enum { HLT, SKZ, ADD, AND, XOR, LDA, STO, JMP} op;
//state_t  st; 
 //zero = 0;
  
  always_ff @ (negedge clk) begin 
    
    //if(rst) out <= 8'h0;
      
    case(opcode) 
      
      	HLT : out = accum;
      	SKZ : out = accum;
        ADD : out = data + accum;
        AND : out = data & accum;
        XOR : out = data ^ accum;
        LDA : out = data;
        STO : out = accum;
        JMP : out = accum;
        default : out = accum;
        
      endcase 
    
    
  end
  
  assign zero = (accum == 8'h0) ? 1 : 0 ;
  
endmodule 
