`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 20:07:46
// Design Name: 
// Module Name: Music_App
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


module Music_App(
    input [12:0] pixel_index,
    input [2:0] app_state,
    input basys_clock,
    input btnC, btnL, btnR,
    output GAIN, Shutdown, output AIN,
    output [6:0] seg, 
    output [3:0] an,
    output [15:0] oled_color,
    output reg [15:0] led
    );
    
    //wires for display
        wire send_pix;
        //wire slow_clk;
        wire [15:0] pixel_data;
        wire fb;
        wire samp_pix;
        reg reset = 0;
        wire [3:0] song_state;    
    wire [31:0] note0; wire [3:0] speaker;
    wire [31:0] note1; 
    wire [31:0] note2; 
    wire [31:0] note3; 
    wire [31:0] note_out;
    speaker speaker_start (app_state, basys_clock, speaker, song_state, AIN);
    note note_start (basys_clock, note0, note1, note2, note3, song_state, note_out);
    
    
    song_imperial_march song0 (basys_clock, btnC, song_state, speaker[0], note0);
    segment_control_music control0(basys_clock, note_out, seg,an);
    song_never_gonna_give_you_up song3(basys_clock, btnC, song_state, speaker[3], note3);
    song_fur_elise song1(basys_clock, btnC, song_state, speaker[1], note1);
    song_ode_to_joy song2 (basys_clock, btnC, song_state, speaker[2], note2);

        
        
        //slow_clock clk0 (basys_clock, slow_clk);

     
    Oled_C colour0 (basys_clock, pixel_index, song_state, oled_color);
    song_state_update update0 (app_state, basys_clock, btnL, btnR, song_state);
    always @ (posedge basys_clock) begin
       if (song_state == 1)
           led[0] <= 1;
       else
           led[0] <= 0;
       if (song_state == 2)
          led[1] <= 1;
       else 
          led[1] <= 0;   
       if (song_state == 3)
          led[2] <= 1;
       else 
          led[2] <= 0; 
       if (song_state == 4)
          led[3] <= 1;
       else 
          led[3] <= 0;
    end
    
    
    
endmodule
