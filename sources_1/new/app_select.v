`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 11:01:06
// Design Name: 
// Module Name: app_select
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


module app_select(
    input clk,
    input [2:0] switch,
    input [12:0] pix_ind,
    input [2:0] state,
    output reg [15:0] oled_color = 0
    );
    
    wire [15:0] speaker_icon;
    wire [15:0] TTT_icon;
    wire [15:0] ball_icon;
    wire [15:0] visu_icon;
    wire [15:0] settings_icon;
            
    parameter RED = 16'b11111_000000_00000;
    parameter GREEN = 16'b00000_111111_00000;
    parameter BLUE = 16'b00000_000000_11111;
    parameter ORANGE = 16'b1111110001100000;
    parameter WHITE =  16'b1111111111111111;    
    parameter BLACK =  16'b0000000000000000;     
    
    app_select_1 one(pix_ind,  speaker_icon);
    app_select_2 two(pix_ind,  TTT_icon);    
    app_select_3 three(pix_ind,ball_icon);    
    app_select_4 four(pix_ind, visu_icon);
    app_select_5 five(pix_ind, settings_icon);
    
    wire clk_2;
    improved_clock dut(clk, 24999999, clk_2);    
    
    
    always @ (*) begin
        if (switch == 1 || switch == 6) begin
            if (state == 1) begin
                oled_color <= speaker_icon; 
            end
            else if (state == 2) begin
                oled_color <= TTT_icon; 
            end
            else if (state == 3) begin
                oled_color <= ball_icon; 
            end
            else if (state == 4) begin
                oled_color <= visu_icon; 
            end
            else if (state == 5 || switch == 6) begin
                oled_color <= settings_icon;
            end
            else begin
                oled_color <= BLACK;
            end
        end                                        
    end                
                                            
                 
      
endmodule
