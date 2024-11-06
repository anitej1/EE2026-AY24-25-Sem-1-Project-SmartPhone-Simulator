`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 11:11:43
// Design Name: 
// Module Name: Top_Student
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


module Top_Student(
    input clk,
    input btnU,
    input btnL,
    input btnR,
    input btnC,
    input btnD,
    input [9:0] sw,
    input [1:0] sw2,
    input SW13,
    input J_MIC3_Pin3,
    output J_MIC3_Pin4,
    output J_MIC3_Pin1,    
    output [7:0] JC,
    output [15:0] led,
    output GAIN,
    output Shutdown,
    output AIN,
    output [6:0] seg,
    output [3:0] an
    );
    
    wire clk_6p25;             //clocks for different modules
    wire clk_25;
    wire clk_20khz;    
    
    wire [15:0] final_oled_color;
    wire [15:0] lock_screen;    //oled wires
    wire [15:0] home_screen;
    wire [15:0] music_app;
    wire [15:0] tic_app;
    wire [15:0] catch_app;
    wire [15:0] visu_app;
    
    wire [2:0] change_state;
    wire change_to_home;
    
    wire [11:0] mic_data;
    
    reg set = 0;   //oled     
    wire fb;
    wire send_pix;
    wire [12:0] pix_ind;
    wire samp_pix;
    wire [6:0] x;
    wire [6:0] y;    
    
    wire [6:0] seg_music;
    wire [3:0] an_music;
    wire [6:0] seg_ttt;
    wire [3:0] an_ttt;
    
    wire [2:0] app_state;
    wire [1:0] password_state;
    
    wire [15:0] app_leds;
    wire [15:0] music_leds;
    wire [12:0] ttt_led;
    
    //reg [8:0] password = 9'b110010101;  //Anitej Student ID
    reg [9:0] password = 10'b0100000000;  //Anitej Student ID    
    
    pix_convert copy2(pix_ind,x,y);
        
    improved_clock clock_6p25mhz(.basys_clk(clk), .m(7), .clk(clk_6p25));
    improved_clock clock_20khz(.basys_clk(clk), .m(2499), .clk(clk_20khz));
    
    Oled_Display display_control(.clk(clk_6p25), .reset(set), .frame_begin(fb), .sending_pixels(send_pix),.sample_pixel(samp_pix), 
    .pixel_index(pix_ind), .pixel_data(final_oled_color), .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), 
    .resn(JC[5]), .vccen(JC[6]),.pmoden(JC[7]));
    
    LEDS(.clk(clk), .led_state(password_state), .app_leds(app_leds), .leds(led));
    
    Lock_Screen_App(.btnU(btnU),.clk(clk), .app_state(app_state), .password_state(password_state), .pix_ind(pix_ind),
                    .oled_color(lock_screen) ,.sw(sw), .change_to_home(change_to_home));
                    
    Home_Screen_App(.clk(clk), .app_state(app_state), .pix_ind(pix_ind), .btnD(btnD), .btnR(btnR), .btnL(btnL),
                    .oled_color(home_screen), .change_state(change_state));
                    
    Music_App(.app_state(app_state), .pixel_index(pix_ind),.basys_clock(clk), .btnC(btnC) ,.btnL(btnL), .btnR(btnR), 
              .GAIN(GAIN) , .Shutdown(Shutdown), .AIN(AIN), .seg(seg_music), .an(an_music) , .oled_color(music_app), .led(music_leds));  
              
    TTT_App(.app_state(app_state), .clk(clk), .sw(sw), .btnC(btnC), .pix_index(pix_ind),.led(ttt_led), .an(an_ttt), .seg(seg_ttt), 
            .oled_colour(tic_app));
    
    Catch_Ball_App(.app_state(app_state), .pixel_index(pix_ind),.CLOCK(clk) ,.btnL(btnL) ,.btnR(btnR) ,.sw(sw2),.oled_color(catch_app));           
                    
    password_check(.clk(clk), .app_state(app_state) ,.password(password), .sw(sw), .password_state(password_state));

    app_fsm(.clk(clk),  .change_to_home(change_to_home), .app_state(app_state), .change_state(change_state));
    
    Audio_Capture(.CLK(clk), .cs(clk_20khz), .MISO(J_MIC3_Pin3), .clk_samp(J_MIC3_Pin1), .sclk(J_MIC3_Pin4), .sample(mic_data));  
    
    SEG_CTRL_FINAL(.app_state(app_state) , .music_seg(seg_music), .music_an(an_music), .tttseg(seg_ttt), .tttan(an_ttt),
                   .seg(seg) ,.an(an));   
                   
    Audio_Visualizer_App(.app_state(app_state), .clk(clk), .mic_data(mic_data) ,.x(x), .y(y), .oled_color(visu_app));               
    
    assign final_oled_color = (app_state == 0) ? lock_screen : (app_state == 1) ? home_screen : (app_state == 2) ? music_app : 
                              (app_state == 3) ? tic_app : (app_state == 4) ? catch_app : (app_state == 5) ? visu_app : 0;
    
    
    assign app_leds = (app_state == 2) ? music_leds : (app_state == 3) ? ttt_led : 0;
    
endmodule    

