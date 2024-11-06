`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:45:46
// Design Name: 
// Module Name: gS_415hz
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


module gS_415hz(
    input basys_clock,
    output reg clk_415hz

    );
    reg [31:0] count = 0;
        always @ (posedge basys_clock)
        begin
            count <= (count == 120480) ? 0 : count + 1;
            clk_415hz <= (count == 0) ? ~clk_415hz : clk_415hz;
        end
      
 endmodule
    
