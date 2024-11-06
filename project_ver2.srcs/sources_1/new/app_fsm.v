`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 18:55:07
// Design Name: 
// Module Name: app_fsm
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


module app_fsm(
    input clk,
    //input [1:0] password_state,
    input change_to_home,
    input [2:0] change_state,
    output reg [2:0] app_state = 0
    );
    reg pressed = 0;
    always @ (posedge clk) begin
        if (change_to_home == 1 ) begin
            app_state<=1;
        end
        if(change_state == 2) begin
            app_state <= 2;
        end
        else if(change_state == 3) begin
            app_state <= 3;
        end
        else if(change_state == 4) begin
            app_state <= 4;
        end
        else if(change_state == 5) begin
            app_state <= 5;
        end
        else if(change_state == 6) begin
            app_state <= 6;
        end
                          
    end

    
endmodule
