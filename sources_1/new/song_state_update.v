`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:39:08
// Design Name: 
// Module Name: song_state_update
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


module song_state_update(input [2:0] app_state,input basys_clock, btnL, btnR,  output reg [3:0] song_state = 1

    );
    wire R_pressed, L_pressed;
    debouncer_v1 d1 (btnR, basys_clock,R_pressed);
    debouncer_v1 d2 (btnL, basys_clock,L_pressed);
    always @ (posedge basys_clock) begin
       if (app_state == 2) begin
           if (song_state == 5)
                    song_state <= 1;
           else if (song_state == 0)
                    song_state <= 4;
                    
           if (R_pressed)
                song_state <= song_state + 1;
            else if (L_pressed) 
                song_state <= song_state - 1;
       end
        
    end   
        
        
            
endmodule
