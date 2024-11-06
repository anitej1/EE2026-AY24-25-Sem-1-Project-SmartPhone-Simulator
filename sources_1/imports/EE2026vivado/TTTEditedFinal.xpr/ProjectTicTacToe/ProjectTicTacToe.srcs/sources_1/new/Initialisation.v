`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 17:19:45
// Design Name: 
// Module Name: Initialisation
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


module TTT_App(
    input [2:0] app_state,
    input clk,
    input [9:0]sw,
    input btnC,
    input [12:0] pix_index,
    output reg [12:0]led,
//    output reg led0,
//    output reg led1,
//    output reg led2,
//    output reg led3,
    output reg [3:0]an = 4'b1111,
    output reg [6:0]seg = 7'b1111111,
    output reg [15:0] oled_colour
//    output reg led5,
//    output reg led6,
//    output reg led7,
//    output reg led8,
//    output reg led9,
//    output reg led10,
//    output reg led11,
//    output reg led12
    );
    
    
    
    wire Clk6p25;
    wire Fb;
    wire send_pix;
    wire samp_pix;
    //reg [15:0] oled_colour = 16'b11111_111111_11111;
    wire [6:0]x;
    wire [6:0]y;
    
    parameter blue = 16'b00000_000000_11111; //t shape colour - Player 2
    parameter green = 16'b00000_111111_00000; //square colour - Player 1
    parameter red = 16'b11111_000000_00000;
    parameter white = 16'b11111_111111_11111;
    parameter black = 16'b00000_000000_00000;
    parameter pink = 16'b11111_110000_11111;
    
    wire [8:0]board1;
    wire [8:0]board2;
    wire player;
    wire [1:0]winner;
    wire led51;
    wire led61;
    wire led71;
    wire led81;
    wire led91;
    wire led101;
    wire led111;
    wire led121;
    

    
    
    Clk6p25 clk6pp25 (.clk(clk),.Clk6p25(Clk6p25));   

    pix_convert xy (.pix_index(pix_index),.x(x),.y(y));    
    TTT toggleplayer (.app_state(app_state),.clk(clk),.sw(sw),.btnC(btnC),.player(player),.board1(board1),.board2(board2),.winner(winner),.led5(led51),.led6(led61),.led7(led71),.led8(led81),.led9(led91),.led10(led101),.led11(led111),.led12(led121));

    assign led51 = led[5];
    assign led61 = led[6];
    assign led71 = led[7];
    assign led81 = led[8];
    assign led91 = led[9];
    assign led101 = led[10];
    assign led111 = led[11];
    assign led121 = led[12];
    
   
    
    always @ (posedge clk) // bounds
    begin
        if (x > 0 && x <= 96 && y == 0) //top bound blue
        begin
            oled_colour <= blue;
        end
        if (x == 0 && y >= 0 && y <= 64) // left bound blue
        begin
            oled_colour <= blue;
        end
        if (x == 96 && y > 0 && y <= 64) //right bound blue
        begin
            oled_colour <= blue;
        end
        if (y == 64 && x > 0 && x <= 96) //bottom bound blue
        begin
            oled_colour <= blue; 
        end  
        if (x >= 26 && x <= 30 && y > 0 && y < 64) // first down
        begin
            oled_colour <= white;
        end
        if (x >= 66 && x <= 70 && y > 0 && y < 64) //second down
        begin
            oled_colour <= white;
        end
        if (y >= 18 && y <= 22 && x > 0 && x < 96) //first right
        begin
            oled_colour <= white;
        end
        if (y >= 42 && y <= 46 && x > 0 && x < 96) //second right
        begin
            oled_colour <= white;
        end
   
        //number1 before selected
        if (x > 0 && x < 26 && y > 0 && y < 4 && sw[1] == 0) //number1 blacked
        begin
            oled_colour <= black;
        end
        if (x > 0 && x < 26 && y > 14 && y < 18 && sw[1] == 0) //number1 blacked
        begin
            oled_colour <= black;
        end
        if (x > 0 && x < 12 && y > 0 && y < 18 && sw[1] == 0) //number1 blacked
        begin
            oled_colour <= black;
        end
        if (x > 14 && x < 26 && y > 0 && y < 18 && sw[1] == 0) //number1 blacked
        begin
            oled_colour <= black;
        end
        if (x >= 12 && x <= 14 && y >= 4 && y <= 14 && sw[1] == 0) // number 1
        begin
            oled_colour <= red;
        end
        //number1 win P1 (123)
        if (x > 8 && x <= 18 && y >= 4 && y <= 14 && sw[1] == 1 && sw[2] == 1 && sw[3] == 1 && board1[0] == 1'b1 && board1[1] == 1'b1 && board1[2] == 1'b1 && winner == 2'b01)
        begin
            oled_colour <= pink;
        end
        //number1 win P2 (123)
        if (x >= 12 && x <= 14 && y >= 3 && y <= 14 && sw[1] == 1 && sw[2] == 1 && sw[3] == 1 &&  board2[0] == 1'b1 && board2[1] == 1'b1 && board2[2] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end
        if (x >= 8 && x <= 18 && y >= 8 && y <= 10 && sw[1] == 1 && sw[2] == 1 && sw[3] == 1 &&  board2[0] == 1'b1 && board2[1] == 1'b1 && board2[2] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end
        //number1 win P1 (147)
        if (x > 8 && x <= 18 && y >= 4 && y <= 14 && sw[1] == 1 && sw[4] == 1 && sw[7] == 1 && board1[0] == 1'b1 && board1[3] == 1'b1 && board1[6] == 1'b1 && winner == 2'b01)
        begin
            oled_colour <= pink;
        end        
        //number1 win P2 (147)
        if (x >= 12 && x <= 14 && y >= 3 && y <= 14 && sw[1] == 1 && sw[4] == 1 && sw[7] == 1 &&  board2[0] == 1'b1 && board2[3] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end
        if (x >= 8 && x <= 18 && y >= 8 && y <= 10 && sw[1] == 1 && sw[4] == 1 && sw[7] == 1 && board2[0] == 1'b1 && board2[3] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end               
        //number1 win P1 (159)
        if (x > 8 && x <= 18 && y >= 4 && y <= 14 && sw[1] == 1 && sw[5] == 1 && sw[9] == 1 && board1[0] == 1'b1 && board1[4] == 1'b1 && board1[8] == 1'b1 && winner == 2'b01)
        begin
            oled_colour <= pink;
        end           
        //number1 win P2 (159)
        if (x >= 12 && x <= 14 && y >= 3 && y <= 14 && sw[1] == 1 && sw[5] == 1 && sw[9] == 1 && board2[0] == 1'b1 && board2[4] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end
        if (x >= 8 && x <= 18 && y >= 8 && y <= 10 && sw[1] == 1 && sw[5] == 1 && sw[9] == 1 && board2[0] == 1'b1 && board2[4] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end          
        //number1 after select (P1 SQUARE)
        if (x > 8 && x <= 18 && y >= 4 && y <= 14 && sw[1] == 1 && board1[0] == 1'b1 && (led[5] == 0 && led[8] == 0 && led[12] == 0)) // square green
        begin
            oled_colour <= green; 
        end
        if (x > 0 && x <= 25 && y > 0 && y <= 4 && sw[1] == 1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 18 && x <= 25 && y > 0 && y <= 17 && sw[1] == 1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 0 && x <= 25 && y > 14 && y <= 17 && sw[1] == 1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 0 && x <= 8 && y > 0 && y <= 17 && sw[1] == 1) //blacked
        begin
            oled_colour <= black;
        end
        //number1 after select (P2 T-SHAPE)
        if (x >= 12 && x <= 14 && y >= 3 && y <= 14 && sw[1] == 1 && board2[0] == 1'b1 && (led[5] == 0 && led[8] == 0 && led[12] == 0)) //t shaped blue
        begin
            oled_colour <= blue;
        end
        if (x >= 8 && x <= 18 && y >= 8 && y <= 10 && sw[1] == 1 && board2[0] == 1'b1 && (led[5] == 0 && led[8] == 0 && led[12] == 0)) //t shaped blue
        begin
            oled_colour <= blue;
        end
        if (x > 8 && x <= 11 && y > 2 && y < 8 && sw[1] == 1 && board2[0] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end 
        if (x > 14 && x <= 18 && y > 2 && y < 8 && sw[1] == 1 && board2[0] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end 
        if (x > 8 && x <= 11 && y > 10 && y <= 14 && sw[1] == 1 && board2[0] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 14 && x <= 18 && y > 10 && y <= 14 && sw[1] == 1 && board2[0] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end
       
        //number 4
        if (x > 0 && x < 26 && y > 22 && y <= 26 && sw[4] == 0) //n4 black
        begin
            oled_colour <= black;
        end
        if (x > 0 & x < 26 && y > 36 && y < 42 && sw[4] == 0) //n4 black
        begin
            oled_colour <= black;
        end
        if (x > 0 && x < 10 && y > 22 && y < 42 && sw[4] == 0) //n4 black
        begin
            oled_colour <= black;
        end        
        if (x > 16 && x < 26 && y > 22 & y < 42 && sw[4] == 0) //n4 black
        begin
            oled_colour <= black;
        end        
        if (x > 12 && x < 14 && y > 26 && y < 30 && sw[4] == 0) //n4 black
        begin
            oled_colour <= black;
        end        
        if (x > 10 && x < 14 && y > 32 && y < 36 && sw[4] == 0) //n4 black
        begin
            oled_colour <= black;
        end       
        if (x >= 10 && x <= 12 && y >= 26 && y <= 32 && sw[4] == 0) //n4 red
        begin
            oled_colour <= red;
        end
        if (x >= 14 && x <= 16 && y >= 26 && y <= 36 && sw[4] == 0) //n4 red
        begin
            oled_colour <= red;
        end       
        if (x >= 10 && x <= 16 && y >= 30 && y <= 32 && sw[4] == 0) //n4 red
        begin
            oled_colour <= red;
        end        
        
        //number 4  selected (p1 sqr)
        if (x > 8 && x <= 18 && y > 26 && y <= 36 && sw[4] == 1 && board1[3] == 1'b1 && (led[6] == 0 && led[8] == 0)) //p1 sqr
        begin
            oled_colour <= green;
        end
        //number4 win P1 (456)
        if (x > 8 && x <= 18 && y > 26 && y <= 36 && sw[4] == 1 && sw[5] == 1 && sw[6] == 1 && board1[3] == 1'b1 && board1[4] == 1'b1 && board1[5] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end        
        //number4 win P1 (147)
        if (x > 8 && x <= 18 && y > 26 && y <= 36 && sw[1] == 1 && sw[4] == 1 && sw[7] == 1 && board1[0] == 1'b1 && board1[3] == 1'b1 && board1[6] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end 
        
        if (x > 0 && x <= 25 && y > 22 && y <= 26 && sw[4] == 1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 18 && x <= 25 && y > 22 & y <= 41 && sw[4] == 1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 0 && x <= 25 && y > 36 && y <= 41 && sw[4] == 1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 0 && x <= 8 && y > 22 && y <= 41 && sw[4] == 1) //blacked
        begin
            oled_colour <= black;
        end
        //number 4 selected (p2 t shape)
        if (x >= 12 && x <= 14 && y > 25 && y <= 36 && sw[4] == 1 && board2[3] == 1'b1 && (led[6] == 0 && led[8] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        if (x >= 8 && x <= 18 && y > 30 && y <= 32 && sw[4] == 1 && board2[3] == 1'b1 && (led[6] == 0 && led[8] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        //number4 win P2 (456)
        if (x >= 12 && x <= 14 && y > 25 && y <= 36 && sw[4] == 1 && sw[5] == 1 && sw[6] == 1 && board2[3] == 1'b1 && board2[4] == 1'b1 && board2[5] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end   
        if (x >= 8 && x <= 18 && y > 30 && y <= 32 && sw[4] == 1 && sw[5] == 1 && sw[6] == 1 && board2[3] == 1'b1 && board2[4] == 1'b1 && board2[5] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end             
        //number4 win P2 (147)
        if (x >= 12 && x <= 14 && y > 25 && y <= 36 && sw[1] == 1 && sw[4] == 1 && sw[7] == 1 && board2[0] == 1'b1 && board2[3] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end   
        if (x >= 8 && x <= 18 && y > 30 && y <= 32 && sw[1] == 1 && sw[4] == 1 && sw[7] == 1 && board2[0] == 1'b1 && board2[3] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end         
        
        if (x > 8 && x <= 11 && y > 22 && y <= 30 && sw[4] == 1 && board2[3] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 14 && x <= 18 && y > 22 && y <= 30 && sw[4] == 1 && board2[3] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 8 && x <= 11 && y > 32 && y <= 41 && sw[4] == 1 && board2[3] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 14 && x <= 18 && y > 32 && y <= 41 && sw[4] == 1 && board2[3] == 1'b1) //black
        begin
            oled_colour <= black;
        end

         //number 7
        if (x > 0 && x < 26 && y > 46 && y < 50 && sw[7] == 0) //n7 black
        begin
            oled_colour <= black;
        end
        if (x > 0 && x < 26 && y > 60 && y < 64 && sw[7] == 0) //n7 black
        begin
            oled_colour <= black;
        end        
        if (x > 16 && x < 26 && y > 46 && y < 64 && sw[7] == 0) //n7 black
        begin
            oled_colour <= black;
        end        
        if (x > 0 && x < 14 && y > 52 && y < 64 && sw[7] == 0) //n7 black
        begin
            oled_colour <= black;
        end        
        if (x > 0 && x < 10 && y > 46 && y < 64 && sw[7] == 0) //n7 black
        begin
            oled_colour <= black;
        end
        if (x >= 10 && x <= 16 && y >= 50 && y <= 52 && sw[7] == 0) //n7 red
        begin
            oled_colour <= red;
        end
        if (x >= 14 && x <= 16 && y >= 50 && y <= 60 && sw[7] == 0) //n7 red
        begin
            oled_colour <= red;
        end
        
        //number7 selected (p1 sqr)
        if (x > 8 && x <= 18 && y > 50 && y <= 60 && sw[7] == 1 && board1[6] == 1'b1 && (led[7] == 0 && led[8] == 0 && led[11] == 0)) //p1 sqr
        begin
            oled_colour <= green;
        end
        //number7 win P1 (789)
        if (x > 8 && x <= 18 && y > 50 && y <= 60 && sw[7] == 1 && sw[8] == 1 && sw[9] == 1 && board1[6] == 1'b1 && board1[7] == 1'b1 && board1[8] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end        
        //number7 win P1 (147)
        if (x > 8 && x <= 18 && y > 50 && y <= 60 && sw[1] == 1 && sw[4] == 1 && sw[7] == 1 && board1[0] == 1'b1 && board1[3] == 1'b1 && board1[6] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end          
        //number7 win P1 (357)
        if (x > 8 && x <= 18 && y > 50 && y <= 60 && sw[3] == 1 && sw[5] == 1 && sw[7] == 1 && board1[2] == 1'b1 && board1[4] == 1'b1 && board1[6] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end          
        
        if (x > 0 && x <= 25 && y > 46 && y <= 50 && sw[7] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 18 && x <= 25 && y > 46 && y <= 63 && sw[7] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 0 && x <= 25 && y > 60 && y <= 63 && sw[7] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 0 && x <= 8 && y > 46 && y <= 63 && sw[7] == 1) //black
        begin
            oled_colour <= black;
        end
        //number7 selected (p2 t-shape)
        if (x >= 12 && x <= 14 && y > 49 && y <= 60 && sw[7] == 1 && board2[6] == 1'b1 && (led[7] == 0 && led[8] == 0 && led[11] == 0)) //t -shape
        begin
            oled_colour <= blue;
        end
        if (x >= 8 && x <= 18 && y > 54 && y <= 56 && sw[7] == 1 && board2[6] == 1'b1 && (led[7] == 0 && led[8] == 0 && led[11] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        //number7 win P2 (789)
        if (x >= 12 && x <= 14 && y > 49 && y <= 60 && sw[7] == 1 && sw[8] == 1 && sw[9] == 1 && board2[6] == 1'b1 && board2[7] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t -shape
        begin
            oled_colour <= pink;
        end
        if (x >= 8 && x <= 18 && y > 54 && y <= 56 && sw[7] == 1 && sw[8] == 1 && sw[9] == 1 && board2[6] == 1'b1 && board2[7] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end        
        //number7 win P2 (147)
        if (x >= 12 && x <= 14 && y > 49 && y <= 60 && sw[1] == 1 && sw[4] == 1 && sw[7] == 1 && board2[0] == 1'b1 && board2[3] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10) //t -shape
        begin
            oled_colour <= pink;
        end
        if (x >= 8 && x <= 18 && y > 54 && y <= 56 && sw[1] == 1 && sw[4] == 1 && sw[7] == 1 && board2[0] == 1'b1 && board2[3] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end         
        //number7 win P2 (357)
        if (x >= 12 && x <= 14 && y > 49 && y <= 60 && sw[3] == 1 && sw[5] == 1 && sw[7] == 1 && board2[2] == 1'b1 && board2[4] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10) //t -shape
        begin
            oled_colour <= pink;
        end
        if (x >= 8 && x <= 18 && y > 54 && y <= 56 && sw[3] == 1 && sw[5] == 1 && sw[7] == 1 && board2[2] == 1'b1 && board2[4] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        
                
        if (x > 8 && x <= 11 && y > 46 && y <= 54 && sw[7] == 1 && board2[6] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 14 && x <= 18 && y > 46 && y <= 54 && sw[7] == 1 && board2[6] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 8 && x <= 11 && y > 56 && y <= 63 && sw[7] == 1 && board2[6] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 14 && x <= 18 && y > 56 && y <= 63 && sw[7] == 1 && board2[6] == 1'b1) //black
        begin
            oled_colour <= black;
        end
  
     //number 2 before select 
        if (x > 30 && x < 66 && y > 0 && y < 4 && sw[2] == 0) //n2 black
        begin
            oled_colour <= black;
        end
        if (x > 30 && x < 66 && y > 14 && y < 18 && sw[2] == 0) //n2 black
        begin
            oled_colour <= black;
        end
        if (x > 30 && x < 45 && y > 0 && y < 18 && sw[2] == 0) //n2 black
        begin
            oled_colour <= black;
        end       
        if (x > 51 && x < 66 && y > 0 && y < 18 && sw[2] == 0) //n2 black
        begin
            oled_colour <= black;
        end 
        if (x > 45 && x < 49 && y > 4 && y < 6 && sw[2] == 0) //n2 black
        begin
            oled_colour <= black;
        end       
        if (x > 47 && x < 51 && y > 10 && y < 12 && sw[2] == 0) //n2 black
        begin
            oled_colour <= black;
        end       
        if (x >= 45 && x <= 51 && y >= 4 && y <= 6 && sw[2] == 0) //number2
        begin
            oled_colour <= red;
        end
        if (x >= 45 && x <= 51 && y >= 8 && y <= 10 && sw[2] == 0) //number2
        begin
            oled_colour <= red;
        end
        if (x >= 45 && x <= 51 && y >= 12 && y <= 14 && sw[2] == 0) //number2
        begin
            oled_colour <= red;
        end
        if (x >= 49 && x <= 51 && y >= 4 && y <= 10 && sw[2] == 0) //number2
        begin
            oled_colour <= red;
        end
        if (x >= 45 && x <= 47 && y >= 8 && y <= 14 && sw[2] == 0) //number2
        begin
            oled_colour <= red;
        end
        
        //number 2 after select (p1 square)
        if (x > 42 && x <= 52 && y > 4 && y <= 14 && sw[2] == 1 && board1[1] == 1'b1 && (led[5] == 0 && led[9] == 0)) //P1 green square
        begin
            oled_colour <= green;
        end
        //number2 win P1 (123)
        if (x > 42 && x <= 52 && y > 4 && y <= 14 && sw[1] == 1 && sw[2] == 1 && sw[3] == 1 && board1[0] == 1'b1 && board1[1] == 1'b1 && board1[2] == 1'b1 && winner == 2'b01) //P1 green square
        begin
            oled_colour <= pink;
        end        
        //number2 win P1 (258)
        if (x > 42 && x <= 52 && y > 4 && y <= 14 && sw[2] == 1 && sw[5] == 1 && sw[8] == 1 && board1[1] == 1'b1 && board1[4] == 1'b1 && board1[7] == 1'b1 && winner == 2'b01) //P1 green square
        begin
            oled_colour <= pink;
        end         
        
        if (x > 30 && x <= 65 && y > 0 && y <= 4 && sw[2] == 1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 52 && x <= 65 && y > 0 && y <= 17 && sw[2] == 1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 30 && x <= 65 && y > 14 && y <= 17 && sw[2] == 1)//blacked
        begin
            oled_colour <= black;
        end
        if (x > 30 && x <= 42 && y > 0 && y <= 17 && sw[2] == 1) //blacked
        begin
            oled_colour <= black;
        end
        
        //number 2 after select (P2 T-shape)
        if (x >= 46 && x <= 48 && y > 3 && y <= 14 && sw[2] == 1 && board2[1] == 1'b1 && (led[5] == 0 && led[9] == 0)) //t-shaped
        begin
            oled_colour <= blue;
        end
        if (x >= 42 && x <= 52 && y > 8 && y <= 10 && sw[2] == 1 && board2[1] == 1'b1 && (led[5] == 0 && led[9] == 0)) //t-shaped
        begin
            oled_colour <= blue;
        end
        //number2 win P2 (123)
        if (x >= 46 && x <= 48 && y > 3 && y <= 14 && sw[1] == 1 && sw[2] == 1 && sw[3] == 1 && board2[0] == 1'b1 && board2[1] == 1'b1 && board2[2] == 1'b1 && winner == 2'b10) //t-shaped
        begin
            oled_colour <= pink;
        end
        if (x >= 42 && x <= 52 && y > 8 && y <= 10 && sw[1] == 1 && sw[2] == 1 && sw[3] == 1 && board2[0] == 1'b1 && board2[1] == 1'b1 && board2[2] == 1'b1 && winner == 2'b10) //t-shaped
        begin
            oled_colour <= pink;
        end        
        //number2 win P2 (258)
        if (x >= 46 && x <= 48 && y > 3 && y <= 14 && sw[2] == 1 && sw[5] == 1 && sw[8] == 1 && board2[1] == 1'b1 && board2[4] == 1'b1 && board2[7] == 1'b1 && winner == 2'b10) //t-shaped
        begin
            oled_colour <= pink;
        end
        if (x >= 42 && x <= 52 && y > 8 && y <= 10 && sw[2] == 1 && sw[5] == 1 && sw[8] == 1 && board2[1] == 1'b1 && board2[4] == 1'b1 && board2[7] == 1'b1 && winner == 2'b10) //t-shaped
        begin
            oled_colour <= pink;
        end         
        
        
        if (x > 30 && x <= 45 && y > 2 && y <= 8 && sw[2] == 1 && board2[1] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 48 && x <= 65 && y > 2 && y <= 8 && sw[2] == 1 && board2[1] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 30 && x <= 45 && y > 10 && y <= 14 && sw[2] == 1 && board2[1] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 48 && x <= 65 && y > 10 && y <= 14 && sw[2] == 1 && board2[1] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end
 
  
   
        //number 5
        if (x >= 45 && x <= 51 && y >= 26 && y <= 28 && sw[5] == 0) //n5 red
        begin
            oled_colour <= red;
        end
        if (x >= 45 && x <= 51 && y >= 30 && y <= 32 && sw[5] == 0) //n5 red
        begin
            oled_colour <= red;
        end        
        if (x >= 45 && x <= 51 && y >= 34 && y <= 36 && sw[5] == 0) //n5 red
        begin
            oled_colour <= red;
        end       
        if (x >= 45 && x <= 47 && y >= 26 && y <= 32 && sw[5] == 0) //n5 red
        begin
            oled_colour <= red;
        end        
        if (x >= 47 && x <= 51 && y >= 30 && y <= 36 && sw[5] == 0) //n5 red
        begin
            oled_colour <= red;
        end        
        if (x > 30 && x < 66 && y > 22 && y < 26 && sw[5] == 0) //n5 black
        begin
            oled_colour <= black;
        end
        if (x > 30 && x < 66 && y > 36 && y < 42 && sw[5] == 0) //n5 black
        begin
            oled_colour <= black;
        end       
        if (x > 30 && x < 45 && y > 22 && y < 42 && sw[5] == 0) //n5 black
        begin
            oled_colour <= black;
        end        
        if (x > 51 && x < 66 && y > 22 && y < 42 && sw[5] == 0) //n5 black
        begin
            oled_colour <= black;
        end        
        if (x > 45 && x < 49 && y > 32 && y < 34 && sw[5] == 0) //n5 black
        begin
            oled_colour <= black;
        end        
        if (x > 47 && x < 51 && y > 28 && y < 30 && sw[5] == 0) //n5 black
        begin
            oled_colour <= black;
        end        
        
        //number 5 selected (p1 sqr)
        if (x > 42 && x <= 52 && y > 26 && y <= 36 && sw[5] == 1 && board1[4] == 1'b1 && (led[6] == 0 && led[9] == 0 && led[11] == 0 && led[12] == 0)) //p1 square
        begin
            oled_colour <= green;
        end
        //number5 win P1 (456)
        if (x > 42 && x <= 52 && y > 26 && y <= 36 && sw[4] == 1 && sw[5] == 1 && sw[6] == 1 && board1[3] == 1'b1 && board1[4] == 1'b1 && board1[5] == 1'b1 && winner == 2'b01) //p1 square
        begin
            oled_colour <= pink;
        end        
        //number5 win P1 (258)
        if (x > 42 && x <= 52 && y > 26 && y <= 36 && sw[2] == 1 && sw[5] == 1 && sw[8] == 1 && board1[1] == 1'b1 && board1[4] == 1'b1 && board1[7] == 1'b1 && winner == 2'b01) //p1 square
        begin
            oled_colour <= pink;
        end        
        //number5 win P1 (159)
        if (x > 42 && x <= 52 && y > 26 && y <= 36 && sw[1] == 1 && sw[5] == 1 && sw[9] == 1 && board1[0] == 1'b1 && board1[4] == 1'b1 && board1[8] == 1'b1 && winner == 2'b01) //p1 square
        begin
            oled_colour <= pink;
        end        
        //number5 win P1 (357)
        if (x > 42 && x <= 52 && y > 26 && y <= 36 && sw[3] == 1 && sw[5] == 1 && sw[7] == 1 && board1[2] == 1'b1 && board1[4] == 1'b1 && board1[6] == 1'b1 && winner == 2'b01) //p1 square
        begin
            oled_colour <= pink;
        end        
        
        if  (x > 30 && x <= 65 && y > 22 && y <= 26 && sw[5] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 52 && x <= 65 && y > 22 && y <= 41 && sw[5] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 30 && x <= 65 && y > 36 && y <= 41 && sw[5] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 30 && x <= 42 && y > 22 && y <= 41 && sw[5] == 1) //black
        begin
            oled_colour <= black;
        end
        //number 5 selected (p2 t-shape)
        if (x >= 46 && x <= 48 && y > 25 && y <= 36 && sw[5] == 1 && board2[4] == 1'b1 && (led[6] == 0 && led[9] == 0 && led[11] == 0 && led[12] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        if (x >= 42 && x <= 52 && y > 30 && y <= 32 && sw[5] == 1 && board2[4] == 1'b1 && (led[6] == 0 && led[9] == 0 && led[11] == 0 && led[12] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        //number5 win P2 (456)
        if (x >= 46 && x <= 48 && y > 25 && y <= 36 && sw[4] == 1 && sw[5] == 1 && sw[6] == 1 && board2[3] == 1'b1 && board2[4] == 1'b1 && board2[5] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 42 && x <= 52 && y > 30 && y <= 32 && sw[4] == 1 && sw[5] == 1 && sw[6] == 1 && board2[3] == 1'b1 && board2[4] == 1'b1 && board2[5] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end        
        //number5 win P2 (258)
        if (x >= 46 && x <= 48 && y > 25 && y <= 36 && sw[2] == 1 && sw[5] == 1 && sw[8] == 1 && board2[1] == 1'b1 && board2[4] == 1'b1 && board2[7] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 42 && x <= 52 && y > 30 && y <= 32 && sw[2] == 1 && sw[5] == 1 && sw[8] == 1 && board2[1] == 1'b1 && board2[4] == 1'b1 && board2[7] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end         
        //number5 win P2 (159)
        if (x >= 46 && x <= 48 && y > 25 && y <= 36 && sw[1] == 1 && sw[5] == 1 && sw[9] == 1 && board2[0] == 1'b1 && board2[4] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 42 && x <= 52 && y > 30 && y <= 32 && sw[1] == 1 && sw[5] == 1 && sw[9] == 1 && board2[0] == 1'b1 && board2[4] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end        
        //number5 win P2 (357)
        if (x >= 46 && x <= 48 && y > 25 && y <= 36 && sw[3] == 1 && sw[5] == 1 && sw[7] == 1 && board2[2] == 1'b1 && board2[4] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 42 && x <= 52 && y > 30 && y <= 32 && sw[3] == 1 && sw[5] == 1 && sw[7] == 1 && board2[2] == 1'b1 && board2[4] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end         
        
        
        if (x > 30 && x <= 45 && y > 22 && y <= 30 && sw[5] == 1 && board2[4] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 48 && x <= 65 && y > 22 && y <= 30 && sw[5] == 1 && board2[4] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 30 && x <= 45 && y > 32 && y <= 41 && sw[5] == 1 && board2[4] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 48 && x <= 65 && y > 32 && y <= 41 && sw[5] == 1 && board2[4] == 1'b1) //black
        begin
            oled_colour <= black;
        end
     
        //number 8
        if (x >= 45 && x <= 51 && y >= 50 && y <= 52 && sw[8] == 0) //n8 red
        begin
            oled_colour <= red;
        end
        if (x >= 45 && x <= 51 && y >= 54 && y <= 56 && sw[8] == 0) //n8red
        begin
            oled_colour <= red;
        end        
        if (x >= 45 && x <= 51 && y >= 58 && y <= 60 && sw[8] == 0) //n8 red
        begin
            oled_colour <= red;
        end        
        if (x >= 45 && x <= 47 && y >= 50 && y <= 60 && sw[8] == 0) //n8 red
        begin
            oled_colour <= red;
        end        
        if (x >= 49 && x <= 51 && y >= 50 && y <= 60 && sw[8] == 0) //n8 red
        begin
            oled_colour <= red;
        end             
        if (x > 30 && x < 45 && y > 46 && y < 64 && sw[8] == 0) //n8 black
        begin
            oled_colour <= black;
        end
        if (x > 51 && x < 66 && y > 46 && y < 64 && sw[8] == 0) //n8 black
        begin
            oled_colour <= black;
        end        
        if (x > 30 && x < 66 && y > 46 && y < 50 && sw[8] == 0) //n8 black
        begin
            oled_colour <= black;
        end        
        if (x > 51 && x < 66 && y > 60 && y < 64 && sw[8] == 0) //n8 black
        begin
            oled_colour <= black;
        end        
        if (x > 47 && x < 49 && y > 52 && y < 54 && sw[8] == 0) //n8 black
        begin
            oled_colour <= black;
        end        
        if (x > 47 && x < 49 && y > 56 && y < 58 && sw[8] == 0) //n8 black
        begin
            oled_colour <= black;
        end     
        
        //number 8 selected (p1 sqr)
        if (x > 42 && x <= 52 && y > 50 && y <= 60 && sw[8] == 1 && board1[7] == 1'b1 && (led[7] == 0 && led[9] == 0)) //p1 sqr
        begin
            oled_colour <= green;
        end
        //number8 win P1 (789)
        if (x > 42 && x <= 52 && y > 50 && y <= 60 && sw[7] == 1 && sw[8] == 1 && sw[9] == 1 && board1[6] == 1'b1 && board1[7] == 1'b1 && board1[8] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end        
        //number8 win P1 (258)
        if (x > 42 && x <= 52 && y > 50 && y <= 60 && sw[2] == 1 && sw[5] == 1 && sw[8] == 1 && board1[1] == 1'b1 && board1[4] == 1'b1 && board1[7] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end
        
        if (x > 30 && x <= 65 && y > 46 && y <= 50 && sw[8] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 52 && x <= 65 && y > 46 && y <= 63 && sw[8] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 30 && x <= 65 && y > 60 && y <= 63 && sw[8] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 30 && x <= 42 && y > 46 && y <= 63 && sw[8] == 1) //black
        begin
            oled_colour <= black;
        end
        //number 8 selected (p2 t-shape)  
        if (x >= 46 && x <= 48 && y > 49 && y <= 60 && sw[8] == 1 && board2[7] == 1'b1 && (led[7] == 0 && led[9] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        if (x >= 42 && x <= 52 && y > 54 && y <= 56 && sw[8] == 1 && board2[7] == 1'b1 && (led[7] == 0 && led[9] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        //number8 win P2 (789)
        if (x >= 46 && x <= 48 && y > 49 && y <= 60 && sw[7] == 1 && sw[8] == 1 && sw[9] == 1 && board2[6] == 1'b1 && board2[7] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 42 && x <= 52 && y > 54 && y <= 56 && sw[7] == 1 && sw[8] == 1 && sw[9] == 1 && board2[6] == 1'b1 && board2[7] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end
                
        //number8 win P2 (258)
        if (x >= 46 && x <= 48 && y > 49 && y <= 60 && sw[2] == 1 && sw[5] == 1 && sw[8] == 1 && board2[1] == 1'b1 && board2[4] == 1'b1 && board2[7] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 42 && x <= 52 && y > 54 && y <= 56 && sw[2] == 1 && sw[5] == 1 && sw[8] == 1 && board2[1] == 1'b1 && board2[4] == 1'b1 && board2[7] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end        
        
        if (x > 30 && x <= 45 && y > 46 && y <= 54 && sw[8] == 1 && board2[7] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 48 && x <= 65 && y > 46 && y <= 54 && sw[8] == 1 && board2[7] == 1'b1)//black
        begin
            oled_colour <= black;
        end
        if (x > 30 && x <= 45 && y > 56 && y <= 63 && sw[8] == 1 && board2[7] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 48 && x <= 65 && y > 56 && y <= 63 && sw[8] == 1 && board2[7] == 1'b1) //black
        begin
            oled_colour <= black;
        end
            
        //number 3
        if (x > 70 && x < 96 && y > 0 && y < 4 && sw[3] == 0) //n3 black
        begin
            oled_colour <= black;
        end
        if (x > 70 && x < 96 && y > 14 && y < 18 && sw[3] == 0) //n3 black
        begin
            oled_colour <= black;
        end
        if (x > 70 && x < 80 && y > 0 && y < 18 && sw[3] == 0) //n3 black
        begin
            oled_colour <= black;
        end        
        if (x > 86 && x < 96 && y > 0 && y < 18 && sw[3] == 0) //n3 black
        begin
            oled_colour <= black;
        end        
        if (x > 70 && x < 84 && y > 6 && y < 8 && sw[3] == 0) //n3 black
         begin
            oled_colour <= black;
        end       
        if (x > 70 && x < 84 && y > 10 && y < 12 && sw[3] == 0) //n3 black
        begin
            oled_colour <= black;
        end       
        if (x >= 84 && x <= 86 && y >= 4 && y <= 14 && sw[3] == 0) //n3 red
        begin
            oled_colour <= red;
        end
        if (x >= 80 && x <= 86 && y >= 4 && y <= 6 && sw[3] == 0) //n3red 
        begin
            oled_colour <= red;
        end        
        if (x >= 80 && x <= 86 && y >= 8 && y <= 10 && sw[3] == 0) //n3red
        begin
            oled_colour <= red;
        end        
        if (x >= 80 && x <= 86 && y >= 12 && y <= 14 && sw[3] == 0) //n3red
        begin
            oled_colour <= red;
        end      
        
        //number 3 selected (p1 sqr)
        if (x > 78 && x <= 88 && y > 4 && y <= 14 && sw[3] == 1 && board1[2] == 1'b1 && (led[5] == 0 && led[10] == 0 && led[11] == 0)) //p1 sqr
        begin
            oled_colour <= green;
        end
        //number3 win P1 (123)
        if (x > 78 && x <= 88 && y > 4 && y <= 14 && sw[1] == 1 && sw[2] == 1 && sw[3] == 1 && board1[0] == 1'b1 && board1[1] == 1'b1 && board1[2] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end        
        //number3 win P1 (369)
        if (x > 78 && x <= 88 && y > 4 && y <= 14 && sw[3] == 1 && sw[6] == 1 && sw[9] == 1 && board1[2] == 1'b1 && board1[5] == 1'b1 && board1[8] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end         
        //number3 win P1 (357)
        if (x > 78 && x <= 88 && y > 4 && y <= 14 && sw[3] == 1 && sw[5] == 1 && sw[7] == 1 && board1[2] == 1'b1 && board1[4] == 1'b1 && board1[6] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end        
        
        if (x > 70 && x <= 95 && y > 0 && y <= 4 && sw[3] == 1) //blacked
        begin
            oled_colour <= black;
        end 
        if (x > 88 && x <= 95 && y > 0 && y <= 17 && sw[3] == 1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 70 && x <= 95 && y > 14 && y <= 17 && sw[3] == 1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 70 && x <= 78 && y > 0 && y <= 17 && sw[3] == 1) //blacked
        begin
            oled_colour <= black;
        end 
        //number 3 selected [p2 t-shape)
        if (x >= 82 && x <= 84 && y > 3 && y <= 14 && sw[3] == 1 && board2[2] == 1'b1 && (led[5] == 0 && led[10] == 0 && led[11] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        if (x >= 78 && x <= 88 && y > 8 && y <= 10 && sw[3] == 1 && board2[2] == 1'b1 && (led[5] == 0 && led[10] == 0 && led[11] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        //number3 win P2 (123)
        if (x >= 82 && x <= 84 && y > 3 && y <= 14 && sw[1] == 1 && sw[2] == 1 && sw[3] == 1 && board2[0] == 1'b1 && board2[1] == 1'b1 && board2[2] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 78 && x <= 88 && y > 8 && y <= 10 && sw[1] == 1 && sw[2] == 1 && sw[3] == 1 && board2[0] == 1'b1 && board2[1] == 1'b1 && board2[2] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end        
        //number3 win P2 (369)
        if (x >= 82 && x <= 84 && y > 3 && y <= 14 && sw[3] == 1 && sw[6] == 1 && sw[9] == 1 && board2[2] == 1'b1 && board2[5] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 78 && x <= 88 && y > 8 && y <= 10 && sw[3] == 1 && sw[6] == 1 && sw[9] == 1 && board2[2] == 1'b1 && board2[5] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end        
        //number3 win P2 (357)
        if (x >= 82 && x <= 84 && y > 3 && y <= 14 && sw[3] == 1 && sw[5] == 1 && sw[7] == 1 && board2[2] == 1'b1 && board2[4] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 78 && x <= 88 && y > 8 && y <= 10 && sw[3] == 1 && sw[5] == 1 && sw[7] == 1 && board2[2] == 1'b1 && board2[4] == 1'b1 && board2[6] == 1'b1 && winner == 2'b10)
        begin
            oled_colour <= pink;
        end        
        
        
        
        if (x > 70 && x <= 81 && y > 2 && y <= 8 && sw[3] == 1 && board2[2] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 84 && x <= 95 && y > 2 && y <= 8 && sw[3] == 1 && board2[2] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 70 && x <= 81 && y > 10 && y <= 14 && sw[3] == 1 && board2[2] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end
        if (x > 84 && x <= 95 && y > 10 && y <= 14 && sw[3] == 1 && board2[2] == 1'b1) //blacked
        begin
            oled_colour <= black;
        end
 
        //number 6        
        if (x > 70 && x < 96 && y > 22 && y < 42 && sw[6] == 0) //n6 black
        begin
            oled_colour <= black;
        end      
        if (x > 70 && x < 96 && y > 22 && y < 26 && sw[6] == 0) //n6 black
        begin
            oled_colour <= black;
        end
        if (x > 70 && x < 96 && y > 36 && y < 42 && sw[6] == 0) //n6 black
        begin
            oled_colour <= black;
        end        
        if (x > 70 && x < 80 && y > 22 && y < 42 && sw[6] == 0) //n6 black
        begin
            oled_colour <= black;
        end        
        if (x > 86 && x < 96 && y > 22 && y < 42 && sw[6] == 0) //n6 black
        begin
            oled_colour <= black;
        end        
        if (x > 82 && x < 86 && y > 28 && y < 30 && sw[6] == 0) //n6 black
        begin
            oled_colour <= black;
        end        
        if (x > 82 && x <= 84 && y > 32 && y <= 34 && sw[6] == 0) //n6 black
         begin
            oled_colour <= black;
        end       
        if (x >= 80 && x <= 86 && y >= 26 && y <= 28 && sw[6] == 0) //n6 red
        begin
            oled_colour <= red;
        end
        if (x >= 80 && x <= 82 && y >= 26 && y <= 36 && sw[6] == 0) //n6 red
        begin
            oled_colour <= red;
        end        
        if (x >= 84 && x <= 86 && y >= 30 && y <= 36 && sw[6] == 0) //n6 red
        begin
            oled_colour <= red;
        end       
        if (x >= 80 && x <= 86 && y >= 30 && y <= 32 && sw[6] == 0) //n6 red
        begin
            oled_colour <= red;
        end        
        if (x >= 80 && x <= 86 && y >= 34 && y <= 36 && sw[6] == 0) //n6 red
        begin
            oled_colour <= red;
        end     
        
        //number 6 selected (p1 sqr)
        if (x > 78 && x <= 88 && y > 26 && y <= 36 && sw[6] == 1 && board1[5] == 1'b1 && (led[6] == 0 && led[10] == 0)) //p1 sqr
        begin
            oled_colour <= green;
        end
        //number6 win P1 (456)
        if (x > 78 && x <= 88 && y > 26 && y <= 36 && sw[4] == 1 && sw[5] == 1 && sw[6] == 1 && board1[3] == 1'b1 && board1[4] == 1'b1 && board1[5] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end        
        //number6 win P1 (369)
        if (x > 78 && x <= 88 && y > 26 && y <= 36 && sw[3] == 1 && sw[6] == 1 && sw[9] == 1 && board1[2] == 1'b1 && board1[5] == 1'b1 && board1[8] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end        
        
        if (x > 70 && x <= 95 && y > 22 && y <= 26 && sw[6] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 88 & x <= 95 && y > 22 && y <= 41 && sw[6] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 70 && x <= 95 && y > 36 && y <= 41 && sw[6] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 70 && x <= 78 && y > 22 && y <= 41 && sw[6] == 1) //black
        begin
            oled_colour <= black;
        end
        //number6 selected (p2 t-shape)
        if (x >= 82 && x <= 84 && y > 25 && y <= 36 && sw[6] == 1 && board2[5] == 1'b1 && (led[6] == 0 && led[10] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        if (x >= 78 && x <= 88 && y > 30 && y <= 32 && sw[6] == 1 && board2[5] == 1'b1 && (led[6] == 0 && led[10] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        //number6 win P2 (456)
        if (x >= 82 && x <= 84 && y > 25 && y <= 36 && sw[4] == 1 && sw[5] == 1 && sw[6] == 1 && board2[3] == 1'b1 && board2[4] == 1'b1 && board2[5] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 78 && x <= 88 && y > 30 && y <= 32 && sw[4] == 1 && sw[5] == 1 && sw[6] == 1 && board2[3] == 1'b1 && board2[4] == 1'b1 && board2[5] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end        
        //number6 win P2 (369)
        if (x >= 82 && x <= 84 && y > 25 && y <= 36 && sw[3] == 1 && sw[6] == 1 && sw[9] == 1 && board2[2] == 1'b1 && board2[5] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 78 && x <= 88 && y > 30 && y <= 32 && sw[3] == 1 && sw[6] == 1 && sw[9] == 1 && board2[2] == 1'b1 && board2[5] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end          
   
        if (x > 70 && x <= 81 && y > 22 && y <= 30  && sw[6] == 1 && board2[5] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 84 && x <= 95 && y > 22 && y <= 30 && sw[6] == 1 && board2[5] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 70 && x <= 81 && y > 32 && y <= 41 && sw[6] == 1 && board2[5] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 84 && x <= 95 && y > 32 && y <= 41 && sw[6] == 1 && board2[5] == 1'b1) //black
        begin
            oled_colour <= black;
        end
     
     
     
        //number 9          
        if (x >= 80 && x <= 86 && y >= 50 && y <= 52 && sw[9] == 0) //n9 red
        begin
            oled_colour <= red;
        end
        if (x >= 80 && x <= 86 && y >= 54 && y <= 56 && sw[9] == 0) //n9 red
        begin
            oled_colour <= red;
        end        
        if (x >= 80 && x <= 82 && y >= 50 && y <= 56 && sw[9] == 0) //n9 red
        begin
            oled_colour <= red;
        end        
        if (x >= 84 && x <= 86 && y >= 50 && y <= 60 && sw[9] == 0) //n9 red
        begin
            oled_colour <= red;
        end        
        if (x > 70 && x < 96 && y > 46 && y < 50 && sw[9] == 0) //n9 black
        begin
            oled_colour <= black;
        end
        if (x > 70 && x < 96 && y > 60 && y < 64 && sw[9] == 0) //n9 black
        begin
            oled_colour <= black;
        end        
        if (x > 86 && x < 96 && y > 46 && y < 64 && sw[9] == 0) //n9 black
        begin
            oled_colour <= black;
        end        
        if (x > 70 && x < 80 && y > 46 && y < 64 && sw[9] == 0) //n9 black
        begin
            oled_colour <= black;
        end        
        if (x > 70 && x < 84 && y > 56 && y < 64 && sw[9] == 0) //n9 black
        begin
            oled_colour <= black;
        end       
        if (x > 82 && x < 84 && y > 52 && y < 54 && sw[9] == 0) //n9 black
        begin
            oled_colour <= black;
        end
        //number 9 selected (p1 sqr)
        if (x > 78 && x <= 88 && y > 50 && y <= 60 && sw[9] == 1 && board1[8] == 1'b1 && (led[7] == 0 && led[10] == 0 && led[12] == 0)) //p1 sqr
        begin
            oled_colour <= green;
        end
        //number9 win P1 (789)
        if (x > 78 && x <= 88 && y > 50 && y <= 60 && sw[7] == 1 && sw[8] == 1 && sw[9] == 1 && board1[6] == 1'b1 && board1[7] == 1'b1 && board1[8] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end        
        //number9 win P1 (369)
        if (x > 78 && x <= 88 && y > 50 && y <= 60 && sw[3] == 1 && sw[6] == 1 && sw[9] == 1 && board1[2] == 1'b1 && board1[5] == 1'b1 && board1[8] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end        
        //number9 win P1 (159)
        if (x > 78 && x <= 88 && y > 50 && y <= 60 && sw[1] == 1 && sw[5] == 1 && sw[9] == 1 && board1[0] == 1'b1 && board1[4] == 1'b1 && board1[8] == 1'b1 && winner == 2'b01) //p1 sqr
        begin
            oled_colour <= pink;
        end        
        
        if (x > 70 && x <= 95 && y > 46 && y <= 50 && sw[9] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 88 && x <= 95 && y > 46 && y <= 63 && sw[9] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 70 && x <= 95 && y > 60 && y <= 63 && sw[9] == 1) //black
        begin
            oled_colour <= black;
        end
        if (x > 70 && x <= 78 && y > 46 && y <= 63 && sw[9] == 1) //black
        begin
            oled_colour <= black;
        end
        //number 9 selected (p2 t-shape)
        if (x >= 82 && x <= 84 && y > 49 && y <= 60 && sw[9] == 1 && board2[8] == 1'b1 && (led[7] == 0 && led[10] == 0 && led[12] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        if (x >= 78 && x <= 88 && y > 54 && y <= 56 && sw[9] == 1 && board2[8] == 1'b1 && (led[7] == 0 && led[10] == 0 && led[12] == 0)) //t-shape
        begin
            oled_colour <= blue;
        end
        //number9 win P2 (789)
        if (x >= 82 && x <= 84 && y > 49 && y <= 60 && sw[7] == 1 && sw[8] == 1 && sw[9] == 1 && board2[6] == 1'b1 && board2[7] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 78 && x <= 88 && y > 54 && y <= 56 && sw[7] == 1 && sw[8] == 1 && sw[9] == 1 && board2[6] == 1'b1 && board2[7] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end        
        //number9 win P2 (369)
        if (x >= 82 && x <= 84 && y > 49 && y <= 60 && sw[3] == 1 && sw[6] == 1 && sw[9] == 1 && board2[2] == 1'b1 && board2[5] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 78 && x <= 88 && y > 54 && y <= 56 && sw[3] == 1 && sw[6] == 1 && sw[9] == 1 && board2[2] == 1'b1 && board2[5] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end        
        //number9 win P2 (159)
        if (x >= 82 && x <= 84 && y > 49 && y <= 60 && sw[1] == 1 && sw[5] == 1 && sw[9] == 1 && board2[0] == 1'b1 && board2[4] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end
        if (x >= 78 && x <= 88 && y > 54 && y <= 56 && sw[1] == 1 && sw[5] == 1 && sw[9] == 1 && board2[0] == 1'b1 && board2[4] == 1'b1 && board2[8] == 1'b1 && winner == 2'b10) //t-shape
        begin
            oled_colour <= pink;
        end        
        
        
        if (x > 70 && x <= 81 && y > 46 && y <= 54 && sw[9] == 1 && board2[8] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 84 && x <= 95 && y > 46 && y <= 54 && sw[9] == 1 && board2[8] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 70 && x <= 81 && y > 56 && y <= 63 && sw[9] == 1 && board2[8] == 1'b1) //black
        begin
            oled_colour <= black;
        end
        if (x > 84 && x <= 95 && y > 56 && y <= 63 && sw[9] == 1 && board2[8] == 1'b1) //black
        begin
            oled_colour <= black;
        end
    end
    
    always @ (posedge clk)
    begin
        if (player == 1'b0 && winner == 1'b00)
        begin
            an <= 4'b1110;
            seg <= 7'b1001111;
        end
        if (player == 1'b1 && winner == 1'b00)
        begin
            an <= 4'b1110;
            seg <= 7'b0100100;
        end
        else if (winner == 2'b01)
        begin
            an <= 4'b0000;
            seg <= 7'b1001111;
        end
        else if (winner == 2'b10)
        begin
            an <= 4'b0000;
            seg <= 7'b0100100;
        end
        else if (winner == 2'b11)
        begin
            an <= 4'b0000;
            seg <= 7'b0111111;
        end
    end
    
    always @ (posedge clk)
    begin
        if (winner == 2'b00)
        begin
            led[0] <= 1;
            led[1] <= 0;
            led[2] <= 0;
            led[3] <= 0;
        end
        else if (winner == 2'b01)
        begin
            led[0] <= 0;
            led[1] <= 1;
            led[2] <= 0;
            led[3] <= 0;     
        end
        else if (winner == 2'b10)
        begin
            led[0] <= 0;
            led[1] <= 0;
            led[2] <= 1;
            led[3] <= 0;
        end
        else if (winner == 2'b11)
        begin
            led[0] <= 1;
            led[1] <= 1;
            led[2] <= 1;
            led[3] <= 1;
        end
    end   
endmodule
