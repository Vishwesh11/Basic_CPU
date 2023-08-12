`timescale 1ns / 1ps


module Accum(

        input clk, rst,
        input load_ac,
        input accm_din,
        output [7:0] accum_dout
    );


logic [7:0] accum_reg;

always_ff @(posedge clk or negedge rst) begin 

    if(~rst) 
            accum_reg <= 8'h0;

    else begin
        
        if(load_ac) accum_reg <= accm_din;
        else accum_dout <= accum_reg;

    end
end


endmodule
