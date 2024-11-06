`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 14:15:09
// Design Name: 
// Module Name: detect_press
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


module detect_press(
    input button,
    output reg pressed = 0
    );
    always @ (*) begin
        if (button) begin
            pressed = 1;
        end
    end
endmodule
