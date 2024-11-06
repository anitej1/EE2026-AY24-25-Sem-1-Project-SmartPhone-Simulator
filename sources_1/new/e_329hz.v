`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:48:41
// Design Name: 
// Module Name: e_329hz
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


module e_329hz(
    input basys_clock,
    output reg clk_329hz

    );
    reg [31:0] count = 0;
        always @ (posedge basys_clock)
        begin
            count <= (count == 151974) ? 0 : count + 1;
            clk_329hz <= (count == 0) ? ~clk_329hz : clk_329hz;
        end
      
 endmodule