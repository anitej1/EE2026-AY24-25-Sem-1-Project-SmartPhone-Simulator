`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:44:59
// Design Name: 
// Module Name: fH_698hz
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


module fH_698hz(
    input basys_clock,
    output reg clk_698hz

    );
    reg [31:0] count = 0;
        always @ (posedge basys_clock)
        begin
            count <= (count == 71632) ? 0 : count + 1;
            clk_698hz <= (count == 0) ? ~clk_698hz : clk_698hz;
        end
      
 endmodule
