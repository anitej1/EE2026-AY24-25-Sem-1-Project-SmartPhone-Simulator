`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:43:18
// Design Name: 
// Module Name: a_440hz
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


module a_440hz(
    input basys_clock,
    output reg clk_440hz

    );
    reg [31:0] count = 0;
        always @ (posedge basys_clock)
        begin
            count <= (count == 113635) ? 0 : count + 1;
            clk_440hz <= (count == 0) ? ~clk_440hz : clk_440hz;
        end
      
 endmodule
