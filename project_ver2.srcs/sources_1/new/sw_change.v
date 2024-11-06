`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 19:47:46
// Design Name: 
// Module Name: sw_change
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


module sw_change(
    input [2:0] app_state,
    input [9:0] sw,
    output reg change
    );
    always @ (*) begin
        if (app_state == 0) begin
            if (sw) begin
                change = 1;
            end
            else begin 
                change = 0;
            end
        end
        else begin
            change = 0;
        end 
        
    end
endmodule
