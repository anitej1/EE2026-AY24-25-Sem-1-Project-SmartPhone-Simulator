`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 17:36:10
// Design Name: 
// Module Name: led_blinker
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


module led_blinker(
    input clk,
    output [15:0] led
    );
    wire clk2hz;
    improved_clock(clk, 24999999, clk2hz);
    assign led = (clk2hz == 1) ? 16'b1111111111111111 : 0;

endmodule
