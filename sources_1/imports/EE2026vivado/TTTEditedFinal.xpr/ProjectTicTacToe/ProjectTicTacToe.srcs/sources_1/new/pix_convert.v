`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 17:40:07
// Design Name: 
// Module Name: pix_convert
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


module pix_convert(
    input [12:0]pix_index,
    output [6:0]x,
    output [6:0]y
    );
    
    assign x = (pix_index % 96);
    assign y = (pix_index / 96);
    
    
endmodule
