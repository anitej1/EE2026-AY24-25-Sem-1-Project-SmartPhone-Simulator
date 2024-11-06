`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 10:25:16
// Design Name: 
// Module Name: mic_abs
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


module mic_abs(
    input clk,
    input [11:0] mic_data,
    output  reg [11:0] data
    );
    
    always @ (posedge clk)
    begin
        data <= (mic_data > 2048)? mic_data - 2048 : (2048-mic_data);
    end
endmodule
