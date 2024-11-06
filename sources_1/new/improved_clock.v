`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 23:49:44
// Design Name: 
// Module Name: improved_clock
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

module improved_clock(
    input basys_clk,
    input  [31:0] m,
    output reg clk = 0
    );
    reg [31:0] count = 0;
    always @ (posedge basys_clk) begin
        count <= (count == m) ? 0 : count + 1;
        clk <= (count == 0) ? ~clk : clk;  
    end
endmodule
