`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 11:36:58
// Design Name: 
// Module Name: app_select_1
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


module app_select_1(
    input [12:0] pix_ind,
    output [15:0] oled_color
    );

    
    reg [15:0] memtable [0:6143];
    initial begin
        $readmemb("speaker_screen_new.mem",memtable);
    end     
    assign oled_color =  memtable[pix_ind][15:0];
endmodule
