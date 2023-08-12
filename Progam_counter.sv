`timescale 1ns / 1ps


module Progam_counter(


    input clk, rst,
    input load_pc, inc_pc,
    input [4:0] pc_addin,
    output logic [4:0] pc_addout

    );

logic [7:0] pc_reg;

always_ff @(posedge clk or negedge rst) begin 

    if(!rst) begin 
            pc_addout <= 5'h0;
    end

    else begin 

        if(load_pc) pc_reg <= pc_addin;
        else if(inc_pc)  pc_reg <= pc_reg + 1;
        else pc_addout <= pc_reg;

    end

end

endmodule
