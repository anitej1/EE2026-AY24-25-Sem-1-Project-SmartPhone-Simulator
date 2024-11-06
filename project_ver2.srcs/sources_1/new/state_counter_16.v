`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 17:39:18
// Design Name: 
// Module Name: state_counter_16
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


module state_counter_16(
    input [1:0] correct_psw,
    input clk,
    output reg [5:0] COUNT = 0
    );
    always @ (posedge clk)
    begin
        if (correct_psw)
            COUNT <= (COUNT >= 5'b10000) ? 5'b10001 : COUNT + 1;  //if count reaches 16 => stop increasing the count as all LEDS turned on
        else 
            COUNT <= 0; 
    end       
endmodule
