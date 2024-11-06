`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 17:51:43
// Design Name: 
// Module Name: screen_locked
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


module screen_locked(
    input [12:0] pix_ind,
    output [15:0] oled_color
    );
    
    reg [15:0] memtable [0:6143];
    initial begin
        $readmemb("new_welcome.mem",memtable);   //load welcome screen background image. Made a custom python script to translate 96 by 64 png file to display data with color value of each of the 6143 pixels.
    end
    assign oled_color = memtable[pix_ind][15:0];   
endmodule
