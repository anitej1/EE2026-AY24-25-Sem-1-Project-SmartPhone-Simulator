`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:45:19
// Design Name: 
// Module Name: f_349hz
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


module f_349hz(
    input basys_clock,
    output reg clk_349hz

    );
    reg [31:0] count = 0;
        always @ (posedge basys_clock)
        begin
            count <= (count == 143265) ? 0 : count + 1;
            clk_349hz <= (count == 0) ? ~clk_349hz : clk_349hz;
        end
      
 endmodule