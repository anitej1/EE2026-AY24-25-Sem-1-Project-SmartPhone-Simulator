`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 17:19:45
// Design Name: 
// Module Name: flexi_clk
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

module flexi_clk(
    input clk,
    input [31:0]m_value,
    output reg slower_clk = 0
    );
    
    reg [31:0]count = 0;
    
    always @ (posedge clk)
    begin
        count <= (count == m_value) ? 0 : count + 1;
        slower_clk <= (count == 0)  ? ~slower_clk : slower_clk;
    end
endmodule
