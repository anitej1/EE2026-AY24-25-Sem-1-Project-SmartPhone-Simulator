`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:48:12
// Design Name: 
// Module Name: c_256hz
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


module c_256hz(
    input basys_clock,
    output reg clk_659hz

    );
    reg [31:0] count = 0;
        always @ (posedge basys_clock)
        begin
            count <= (count == 195311) ? 0 : count + 1;
            clk_659hz <= (count == 0) ? ~clk_659hz : clk_659hz;
        end
      
 endmodule
