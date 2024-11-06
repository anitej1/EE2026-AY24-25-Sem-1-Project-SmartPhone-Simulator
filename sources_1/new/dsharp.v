`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:49:30
// Design Name: 
// Module Name: dsharp
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


module dsharp(
    input basys_clock,
    output reg clk_622hz

    );
    reg [31:0] count = 0;
        always @ (posedge basys_clock)
        begin
            count <= (count == 80320) ? 0 : count + 1;
            clk_622hz <= (count == 0) ? ~clk_622hz : clk_622hz;
        end
      
 endmodule
