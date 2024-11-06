`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 22:23:36
// Design Name: 
// Module Name: coordniate
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


module coordniate(
    input [12:0] pix_index,
    output [6:0] x_coordniate,
    output [5:0] y_coordniate
    );
    assign x_coordniate = (pix_index%96);
    assign y_coordniate = pix_index/96;
endmodule
