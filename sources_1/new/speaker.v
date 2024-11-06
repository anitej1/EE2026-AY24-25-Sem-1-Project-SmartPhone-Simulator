`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:31:23
// Design Name: 
// Module Name: speaker
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


module speaker(input [2:0] app_state, input basys_clock, input [3:0] speakers, input [3:0] song_state, output reg speaker = 0

    );
    always @ (posedge basys_clock) begin
        if (app_state == 2) begin
            if (song_state == 1)
              speaker <= speakers[0];
            else if (song_state == 2)
              speaker <= speakers[1];
            else if (song_state == 3)
              speaker <= speakers[2];
            else if (song_state == 4)
              speaker <= speakers[3];
            else
              speaker <= 0;
        end      
              
    end
    
    
endmodule