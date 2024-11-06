`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 14:46:31
// Design Name: 
// Module Name: Lock_Screen_App
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


module Lock_Screen_App(
    input btnU,
    input clk,
    input [9:0] sw,
    input [2:0] app_state,
    input [1:0] password_state,
    input [12:0] pix_ind,
    output [15:0] oled_color,
    output change_to_home
    );
    
    wire lock;
    
    wire [15:0] lock_screen;
    wire [15:0] correct_psw;
    wire [15:0] wrong_psw;
    
    debouncer_v1 (btnU, clk, lock);
    
    screen_locked(.pix_ind(pix_ind), .oled_color(lock_screen));
    screen_correct_psw(.pix_ind(pix_ind), .oled_color(correct_psw));
    screen_wrong_psw(.pix_ind(pix_ind), .oled_color(wrong_psw));     
       
    assign oled_color =  (password_state == 0) ? lock_screen : (password_state == 1) ? correct_psw : (password_state == 2) ? wrong_psw : 0;
    assign change_to_home = (lock == 1 && sw == 0) ? 0 :(password_state == 3 && sw == 0) ? 1 : 0;
endmodule
