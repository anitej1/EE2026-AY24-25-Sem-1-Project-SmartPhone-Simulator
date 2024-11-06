`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:46:48
// Design Name: 
// Module Name: gH_784hz
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


module gH_784hz(
    input basys_clock,
    output reg clk_523hz

    );
    reg [31:0] count = 0;
        always @ (posedge basys_clock)
        begin
            count <= (count == 63774) ? 0 : count + 1;
            clk_523hz <= (count == 0) ? ~clk_523hz : clk_523hz;
        end
      
 endmodule