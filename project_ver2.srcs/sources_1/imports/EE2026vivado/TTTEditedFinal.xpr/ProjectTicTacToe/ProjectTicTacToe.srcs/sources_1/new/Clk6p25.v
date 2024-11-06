`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 17:19:45
// Design Name: 
// Module Name: Clk6p25
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


module Clk6p25(
    input clk,
    output Clk6p25
    );
    
    reg [31:0]m_value = 79;
    
    flexi_clk copy0 (.clk(clk),.m_value(m_value), .slower_clk(Clk6p25));
     
endmodule
