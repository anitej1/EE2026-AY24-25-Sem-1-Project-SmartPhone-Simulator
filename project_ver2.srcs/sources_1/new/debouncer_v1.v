`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 20:16:38
// Design Name: 
// Module Name: debouncer_v1
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


module debouncer_v1(
    input btnC,
    input clk_oled,
    output reset
    );
    
    wire dff_1_out;
    wire dff_2_out;
    
    dff dff0 (clk_oled, btnC, dff_1_out);
    dff dff1 (clk_oled, dff_1_out, dff_2_out);
    
    assign reset = dff_1_out & ~dff_2_out;
endmodule
