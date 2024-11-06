`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 20:50:31
// Design Name: 
// Module Name: debouncer_clk200ms
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


module debouncer_clk200ms(
    input basys_clk,
    input  [31:0] m,
    output reg [1:0] clk 
    );
    reg [31:0] count = 0;
    always @ (posedge basys_clk) begin
        count <= (count == m) ? 0 : count + 1;
        clk <= (count == 0) ? 1 : 2;  
    end
endmodule
