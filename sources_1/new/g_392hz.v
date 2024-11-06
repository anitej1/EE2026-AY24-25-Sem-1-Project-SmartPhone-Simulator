`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:46:20
// Design Name: 
// Module Name: g_392hz
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


module g_392hz(
    input basys_clock,
    output reg clk_392hz

    );
    reg [31:0] count = 0;
        always @ (posedge basys_clock)
        begin
            count <= (count == 127550) ? 0 : count + 1;
            clk_392hz <= (count == 0) ? ~clk_392hz : clk_392hz;
        end
      
 endmodule
