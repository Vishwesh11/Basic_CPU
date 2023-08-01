`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2023 19:39:05
// Design Name: 
// Module Name: Memory
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


module Memory(

    input logic clk, rst,
    input logic mem_rd, mem_wr,
    input logic [7:0] mem_din,
    input logic [4:0] mem_add,
    output logic [7:0] mem_dout
    );

logic [8:0] memory [31:0];


always_ff @(posedge clk or negedge rst) begin 

    if(~rst) begin
        read <= 0; write <= 0;
    end 
    else begin

         if(mem_wr && !mem_rd) memory[mem_add] <= mem_din;
         else if(mem_rd && !mem_wr ) mem_dout <= memory[mem_add];
    end

end

endmodule
