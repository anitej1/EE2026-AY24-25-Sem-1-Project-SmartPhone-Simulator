`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2024 21:57:04
// Design Name: 
// Module Name: wave_new
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


module Audio_Visualizer_App(
    input [2:0] app_state,
    input clk,
    input [11:0] mic_data,
    input [6:0] x, [6:0] y,
    output reg [15:0] oled_color
    );
    
    wire [6:0] height;
    
    wire clk_25mhz;
    
    
    parameter WIDTH = 4'b1000;  //colors
    parameter WHITE = 16'b1111111111111111;
    parameter BLACK = 16'b0;
    parameter MAGENTA = 16'b11111_000000_11111;
    parameter CYAN = 16'b00000_111111_11111;
    parameter YELLOW = 16'b11111_111111_00000;
    parameter GREEN = 16'b00000_111111_00000;
    parameter RED = 16'b11111_000000_00000;
    parameter BLUE = 16'b00000_000000_11111;
    parameter ORANGE = 16'b11111_100110_00000;
    parameter GREY = 16'b01100_011000_01100;    
    parameter INDIGO = 16'b0100100000010000;
    parameter VIOLET = 16'b0111100000011111;
    
    //
    
    wire clk_100fps;
    wire [11:0] mic_data_new;
    
    reg [6:0] y_inv ;
    
    always @ (*)
    begin
        y_inv <= 64- y;
    end
    
    mic_abs abs(clk_100fps, mic_data, mic_data_new);
    bar_height h(mic_data_new, height);     
    
    improved_clock clock_20khz(.basys_clk(clk), .m(1), .clk(clk_25mhz)); 
    improved_clock clock_100(.basys_clk(clk), .m(499999), .clk(clk_100fps));

    always @ (posedge clk_25mhz)   // TEXT : VISUALIZER
    begin
        if (app_state==5)
        begin
            if (mic_data_new <= 410/2 &&  ((x>=12 && x<=17) && (y_inv>=10 && y_inv<=height)))
            begin
             oled_color <= RED;
            end
            else if ((410/2 < mic_data_new && mic_data_new <= 820/2) &&  ((x>=21 && x<=26) && (y_inv>=10 && y_inv<=height)))
            begin
                oled_color <= MAGENTA;
            end  
            else if ((820/2 < mic_data_new && mic_data_new <= 1230/2) &&  ((x>=30 && x<=35) && (y_inv>=10 && y_inv<=height)))
            begin
                oled_color <= VIOLET;
            end 
            else if ((1230/2 < mic_data_new && mic_data_new <= 1640/2) &&  ((x>=39 && x<=44) && (y_inv>=10 && y_inv<=height)))
            begin
                oled_color <= INDIGO;
            end 
            else if ((2050/2 < mic_data_new && mic_data_new <= 2460/2) &&  ((x>=48 && x<=53) && (y_inv>=10 && y_inv<=height)))
            begin
                oled_color <= BLUE;
            end 
            else if ((2460/2 < mic_data_new && mic_data_new <= 2870/2) &&  ((x>=57 && x<=62) && (y_inv>=10 && y_inv<=height)))
            begin
                oled_color <= GREEN;
            end 
            else if ((3280/2 < mic_data_new && mic_data_new <= 3690/2) &&  ((x>=66 && x<=71) && (y_inv>=10 && y_inv<=height)))
            begin
                oled_color <= YELLOW;
            end 
            else if ((3690/2 < mic_data_new && mic_data_new <= 2047) &&  ((x>=75 && x<=80) && (y_inv>=10 && y_inv<=height)))
            begin
                oled_color <= ORANGE;
            end               
            else if (y == 58 && (x == 14 || x == 15 || x == 20 || x == 21 || (23<=x && x<= 27) || (29<=x && x<=33) || x == 35 || x == 39 || (43<=x && x<=45)  // text VISUALIZER
                || x == 49 || (55<=x && x<=59) || (61<=x && x<=65) || (67<=x && x<=72) || (74<=x && x<=78))) 
            begin
                oled_color <= WHITE;
            end
            else if ((y == 59 && (x == 15 || x == 20 || x == 25 || x == 29 || x == 35 || x == 39 || x == 42 || x == 46 || x == 49 || x == 57 || 
                x == 65 || x == 67 || x == 74 || x == 78))) 
            begin
                oled_color <= WHITE;
            end
            else if ((y==60 && (x == 15 || x == 16 || x == 19 || x == 20 || x == 25 || (x >= 29 && x <= 33) || x == 35 || x == 39 || (x>=41 && x<=47) 
                    || x == 49 || x == 57 || (x >= 62 && x <= 64) || (x>=67 && x<=72) || (x>=74 && x<=78))))
            begin
                oled_color <= WHITE;
            end
            else if ((y==61) && ((x>=16 && x<=19) || (x==25) || x == 33 || x == 35 || x == 39 || x == 41 || x == 47 || x == 49 || x == 57 || x == 61 ||
                    x == 67 || x == 74 || x == 76))
            begin
                oled_color <= WHITE;
            end
            else if ((y==62) && ((x>=17 && x <=18) || (x>=23 && x<=27) || (x>=29 && x<=33) || (x>=35 && x<=39) || x == 41 || x == 47 || (x>=49 && x<=53)
                    || (x>=55 && x<=59) || (x>=61 && x<=65) || (x>=67 && x<=72) || x == 74 || x == 77 || x == 78))
            begin
                oled_color <= WHITE;
            end
            else begin
                oled_color <= 16'b0000000000000000;
           end
        end
   end     
                  
    
    
endmodule
