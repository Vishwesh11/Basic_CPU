`timescale 1ns / 1ps

module Instruction_reg(

    input clk, rst,
    input load_ir,
    input [7:0] mdata_in,
    output logic [2:0] op_out,
    output logic [2:0] ir_addr
    );


    always_ff @(posedge clk or negedge rst) begin 

        if(~rst) begin 
                op_out <= 5'b0; ir_addr <= 3'b0;
        end        
        else begin
            
            if(load_ir) begin 

                op_out <= mdata_in[7:5] ;
                ir_addr <= mdata_in[4:0] ;

            end

        end
    end


endmodule
