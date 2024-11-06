`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:47:18
// Design Name: 
// Module Name: dH_587hz
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


module dH_587hz(
    input basys_clock,
    output reg clk_587hz

    );
    reg [31:0] count = 0;
        always @ (posedge basys_clock)
        begin
            count <= (count == 85177) ? 0 : count + 1;
            clk_587hz <= (count == 0) ? ~clk_587hz : clk_587hz;
        end
      
 endmodule
