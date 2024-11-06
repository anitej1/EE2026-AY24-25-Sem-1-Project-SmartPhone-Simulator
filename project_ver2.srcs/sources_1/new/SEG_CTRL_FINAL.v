`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 13:14:11
// Design Name: 
// Module Name: SEG_CTRL_FINAL
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


module SEG_CTRL_FINAL(
    input [2:0] app_state,
    input [6:0] music_seg, tttseg,
    input [3:0] music_an, tttan,
    output [6:0] seg,
    output [3:0] an
    );
    assign seg = (app_state == 2) ? music_seg : (app_state == 3) ? tttseg : 7'b1111111;
    assign an = (app_state == 2)? music_an : (app_state == 3) ? tttan : 4'b1111;
endmodule
