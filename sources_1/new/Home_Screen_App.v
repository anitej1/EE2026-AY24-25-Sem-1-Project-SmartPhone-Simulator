`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 20:07:29
// Design Name: 
// Module Name: Home_Screen_App
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


module Home_Screen_App(
    input clk,
    input [2:0] app_state,
    input [12:0] pix_ind,
    input btnD, btnL, btnR,
    output [15:0] oled_color,
    output [2:0] change_state
    );
    
    wire clk_200ms;
    wire clk_300ms;
    
    improved_clock clock_0(clk, 14999999, clk_300ms);   

    wire clk_100ms;
    
    improved_clock clock_1(clk, 9999999, clk_200ms);     
    
    wire [2:0] icon_state;
    
    wire left;
    wire right;
    wire enter;
    

    
    debouncer fa1(.clk(clk), .btn(btnL), .press(left));
    debouncer fa2(.clk(clk), .btn(btnR), .press(right));
    debouncer_v1 fa3(btnD, clk, enter); 
    
    app_select app(.clk(clk), .pix_ind(pix_ind), .switch(app_state), .state(icon_state), .oled_color(oled_color));
    
    home_button_fsm slow(clk_300ms, app_state, left, right, icon_state);
    select_app_fsm select(clk, app_state, icon_state, enter, change_state);
endmodule
