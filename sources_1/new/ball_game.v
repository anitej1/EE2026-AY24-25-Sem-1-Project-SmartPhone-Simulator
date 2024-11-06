`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/13 22:53:09
// Design Name: 
// Module Name: ball_game
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


module ball_game(
    input [2:0] app_state,
    input CLOCK,
    input slow_clock,
    input btnL,
    input btnR,
    input [2:0] ball_speed,
    input [12:0] pixel_index,
    output reg [15:0] pixel_data
    );
    
    reg [6:0] x_ball = 7'd31 ;
    reg [5:0] y_ball = 6'd4 ;
    reg [6:0] x_bar = 7'd47 ;
    reg [5:0] y_bar = 6'd63 ;
    reg [2:0] radius = 3'd3 ;
    wire [6:0] x_coordniate ;
    wire [5:0] y_coordniate ;
    reg [4:0] edge_length = 5'd5;
    reg [2:0] direction = 3'b100;
    reg reset = 0;
    coordniate fa_0(pixel_index, x_coordniate, y_coordniate);
    wire R_pressed;
    wire L_pressed;
    debouncer_v1 fa_1( CLOCK, btnL, L_pressed);
    debouncer_v1 fa_2 (CLOCK, btnR, R_pressed);
    always @ (posedge pixel_index) begin
      if (app_state == 4) begin
          if ((x_coordniate - x_ball) ** 2 + (y_coordniate - y_ball) ** 2 <= 9)
          begin
            pixel_data <= 16'h435c;
          end
          else if (x_coordniate <= x_bar + edge_length && x_coordniate >= x_bar - edge_length && y_coordniate == 63)
          begin
            pixel_data <= 16'hffff ; 
          end
          else begin
            pixel_data <= 16'h0;
          end
      end    
    end
    always @ (posedge slow_clock) begin
      if (app_state == 4) begin    
          if ( x_bar > 5  && btnL == 1) 
          begin
            x_bar <= x_bar - 1;
          end
          else if (  x_bar < 88 && btnR == 1)
          begin
            x_bar <= x_bar + 1;
          end
          else if ( x_bar == 5 && btnL == 1)
          begin 
            x_bar <= x_bar;
          end
          else if ( x_bar == 88 && btnR == 1) 
          begin
            x_bar <= x_bar;
          end
          if ( y_ball <= 60 && y_ball >= 3 && x_ball >= 3 && x_ball <= 90 && (direction == 3'b100 ))
          begin
            y_ball <= y_ball + 1;
          end
           if (y_ball <= 61 && y_ball >= 4 && x_ball >= 3 && x_ball <= 90 && (direction ==3'b000))
          begin
            y_ball <= y_ball - 1;
          end
          if (y_ball <= 61 && y_ball >= 4 && x_ball >= 5 && x_ball <= 90 && (direction == 3'b001)) begin
            y_ball <= y_ball - 1;
            x_ball <= x_ball - 2;
          end
          if (y_ball <= 61 && y_ball >= 4 && x_ball >= 3 && x_ball <= 88 && (direction == 3'b010)) begin
            y_ball <= y_ball - 1;
            x_ball <= x_ball + 2;
          end
          if (y_ball <= 60 && y_ball >= 3 && x_ball >=5 && x_ball <=90 && (direction == 3'b101)) begin
            y_ball <= y_ball + 1;
            x_ball <= x_ball - 2;
          end
          if (y_ball<= 60 && y_ball >= 3 && x_ball >=3 && x_ball <= 88 && (direction == 3'b110)) begin
            y_ball <= y_ball + 1;
            x_ball <= x_ball + 2;
          end
          if (y_ball == 3 && direction == 3'b001 && reset == 0 && x_ball !=3 &&  x_ball != 4) begin
            direction <= 3'b101;
          end
          if (y_ball == 3 && direction == 3'b010 && reset == 0 && x_ball !=88 &&  x_ball != 89) begin
            direction <= 3'b110;
          end
          if (y_ball == 3 && (x_ball == 3 || x_ball == 4) && reset == 0 ) begin 
            direction <= 3'b110;
          end
          if (y_ball == 3 && (x_ball == 88 || x_ball == 89 ) && reset == 0) begin
            direction <= 3'b101;
          end
          if ( (x_ball == 3 || x_ball == 4) && direction == 3'b101 && y_ball <= 60 && y_ball >= 4) begin
            direction <= 3'b110;
          end
          if ( (x_ball == 3 || x_ball == 4) && direction == 3'b001 && y_ball <= 60 && y_ball >= 4) begin
            direction <= 3'b010;
          end
          if ( (x_ball == 90 || x_ball == 89) && direction == 3'b010 && y_ball <= 60 && y_ball >= 4) begin
            direction <= 3'b001;
          end
          if ( (x_ball == 90 || x_ball == 89) && direction == 3'b110 && y_ball <= 60 && y_ball >= 4) begin
            direction <= 3'b101;
          end
          if ( y_ball == 3 && x_ball <= 47 && reset == 0 && direction == 3'b000 ) begin
            direction <= 3'b110;
          end
          if (y_ball == 3 && x_ball > 47 && reset == 0 && direction == 3'b000)  begin
            direction <= 3'b101;
          end
          if (y_ball == 61 && x_ball== x_bar && direction == 3'b100) begin
            direction <= 3'b000;
          end
          if (y_ball== 61 && x_ball <= x_bar + edge_length && x_ball> x_bar && direction == 3'b100 ) begin
            direction<= 3'b010;
          end
          if (y_ball == 61 && x_ball>= x_bar - edge_length && x_ball< x_bar && direction == 3'b100) begin
            direction<= 3'b001;
          end
          if (y_ball == 61 && x_ball <= x_bar + edge_length && x_ball > x_bar - edge_length && direction == 3'b101 && x_ball >= 5) begin
            direction <= 3'b001;
          end
          if (y_ball == 61 && x_ball <= x_bar + edge_length && x_ball > x_bar - edge_length && direction == 3'b110 && x_ball <= 88) begin
            direction <= 3'b010;
          end
          if (y_ball == 61 && x_ball <= x_bar + edge_length && x_ball > x_bar - edge_length && direction == 3'b101 && (x_ball == 3 || x_ball == 4 )) begin
            x_ball <= x_bar;
          end
          if (y_ball == 61 && x_ball <= x_bar + edge_length && x_ball > x_bar - edge_length && direction == 3'b110 && (x_ball == 89 || x_ball == 90)) begin
            x_ball <= x_bar;
          end
          if (y_ball == 61 && ( x_ball > x_bar + edge_length || x_ball < x_bar - edge_length)) begin
            y_ball <= 3;
            x_ball <= 95 - x_ball;
            reset <= 1;
          end
          if (y_ball == 3 && reset == 1) begin
            direction<= 3'b100;
            reset <= 0;
          end
      end      
    end
      
endmodule
