`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 10:06:53
// Design Name: 
// Module Name: bar_height
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


module bar_height(
    input [11:0] mic_data,
    output [6:0] height
    );
    assign height = ((mic_data*64)/2050);
endmodule
