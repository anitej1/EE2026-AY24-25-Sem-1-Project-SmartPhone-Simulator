`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 20:08:55
// Design Name: 
// Module Name: Catch_Ball_App
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


module Catch_Ball_App (
    input [2:0] app_state,
    input [12:0] pixel_index,
    input CLOCK, 
    input btnL,btnR,
    input[1:0]sw,
    output [15:0] oled_color
    );
    
    wire slower_clock;
    wire ball_speed;
        
    wire frame_begin;
    wire sending_pixel;
    wire sample_pixel;
    reg reset = 0;
    wire  slow_clock;

    improved_clock fa_0(CLOCK, 7, slow_clock);


    clock_chosen fa_1(sw, slower_clock, CLOCK);

    assign ball_speed = 3'b001;
    ball_game fa_3(app_state, CLOCK, slower_clock, btnL, btnR, ball_speed, pixel_index, oled_color);
             


endmodule
