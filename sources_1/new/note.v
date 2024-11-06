`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:31:59
// Design Name: 
// Module Name: note
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


module note (input basys_clock, input [31:0] note0, input [31:0] note1, input [31:0] note2, 
input [31:0] note3, input [3:0] song_state, output reg [31:0] note_out);
    always @ (posedge basys_clock) begin
    if (song_state == 1)
        note_out <= note0;
    else if (song_state == 2)
        note_out <= note1;
    else if (song_state == 3)
        note_out <= note2;
    else if (song_state == 4)
        note_out <= note3;
    else
        note_out <= 0;
                
    end
endmodule
