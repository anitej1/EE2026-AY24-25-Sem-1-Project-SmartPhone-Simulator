`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 13:54:17
// Design Name: 
// Module Name: clock_chosen
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


module clock_chosen(
    input  [1:0]sw,
    output reg slow_clock,
    input CLOCK
    );
    wire clock_5hz;
    wire clock_10hz;
    wire clock_20hz;
    wire clock_25hz;
    improved_clock fa_0(CLOCK, 9999999, clock_5hz);
    improved_clock fa_1(CLOCK, 4999999, clock_10hz);
    improved_clock fa_2(CLOCK, 2499999, clock_20hz);
    improved_clock fa_3(CLOCK, 1999999, clock_25hz);
    always @ (posedge CLOCK) begin
      if (sw[0] == 0 && sw[1] == 0) begin
        slow_clock <= clock_5hz;
      end
      else if (sw[0] == 1 && sw[1] == 0) begin
        slow_clock <= clock_10hz;
      end
      else if (sw[0] == 0 && sw[1] == 1) begin
        slow_clock <= clock_20hz;
      end
      else if (sw[1] == 1 && sw[0] == 1) begin
        slow_clock <= clock_25hz;
      end
    end
endmodule