`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 17:11:51
// Design Name: 
// Module Name: TTT
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


module TTT(
    input [2:0] app_state, 
    input clk,
    input [9:0]sw,
    input btnC, //reset
    output reg player = 1'b0, //current player (0 or 1)
    output reg [8:0]board1 = 9'b000000000, //3x3 board (0 for P1, 1 for P2)
    output reg [8:0]board2 = 9'b000000000, 
    output reg [1:0]winner = 2'b00, //00 continue, 01 player 1 win, 10 player 2 win, 11, draw 
    output reg led5 = 0,
    output reg led6 = 0,
    output reg led7 = 0,
    output reg led8 = 0,
    output reg led9 = 0,
    output reg led10 = 0,
    output reg led11 = 0,
    output reg led12 = 0 
    );
    
    reg [9:0]last_switch_state = 10'b0000000000; 
    reg reset;
    
//    initial
//    begin
//        player <= 1'b0;
//        board <= 9'b000000000; //all position empty
//    end
    
    always @ (posedge clk) //reset logic
    begin
        if (app_state == 3) begin
            if (btnC) 
            begin
                reset <= 1'b1; //resets
            end
            else 
            begin
                reset <= 1'b0; //deassert reset
            end
        end        
    end
    
    always @ (posedge clk or posedge reset)
    begin
        if (app_state == 3) begin
            if (reset == 1'b1)
            begin
                player <= 1'b0;
                board1 <= 9'b000000000;
                board2 <= 9'b000000000;
                last_switch_state <= 10'b0000000000;
            end
            else if (reset == 1'b0)
            begin
    //        begin
                if (sw[1] == 1 && last_switch_state[1] == 1'b0)
                begin
                    if (board1[0] == 1'b0 && board2[2] == 1'b0)
                    begin
                        if (player == 1'b0)
                        begin
                            player <= 1'b1;
                            board1[0] <= 1'b1;
                            last_switch_state[1] <= 1'b1;
                        end
                        else if (player == 1'b1)
                        begin
                            board2[0] <= 1'b1;
                            player <= 1'b0;
                            last_switch_state[1] <= 1'b1;
                        end
    //                    board[0] <= player; //sets position for P1/P2
    //                    player <= ~player; //toggle player
                    end
                end
                if (sw[2] == 1'b1 && last_switch_state[2] == 1'b0)
                begin
                    if (board1[1] == 1'b0 && board2[1] == 1'b0)
                    begin
                        if (player == 1'b0)
                        begin
                            board1[1] <= 1'b1;
                            player <= 1'b1;
                            last_switch_state[2] <= 1'b1;
                        end
                        else if (player == 1'b1)
                        begin
                            board2[1] <= 1'b1;
                            player <= 1'b0;
                            last_switch_state[2] <= 1'b1;
                        end
                    end
    //                begin
    //                    board[1] <= player;
    //                    player <= ~player; 
    //                end
                end
                if (sw[3] == 1'b1 && last_switch_state[3] == 1'b0)
                begin
                    if (board1[2] == 1'b0 && board2[2] == 1'b0)
                    begin
                        if (player == 1'b0)
                        begin
                            board1[2] <= 1'b1;
                            player <= 1'b1;
                            last_switch_state[3] <= 1'b1;
                        end
                        else if (player == 1'b1)
                        begin
                            board2[2] <= 1'b1;
                            player <= 1'b0;
                            last_switch_state[3] <= 1'b1;
                        end
                    end               
    //                begin
    //                    board[2] <= player;
    //                    player <= ~player;
    //                end
                end
                if (sw[4] == 1'b1 && last_switch_state[4] == 1'b0)
                begin
                    if (board1[3] == 1'b0 && board2[3] == 1'b0)
                    begin
                        if (player == 1'b0)
                        begin
                            board1[3] <= 1'b1;
                            player <= 1'b1;
                            last_switch_state[4] <= 1'b1;
                        end
                        else if (player == 1'b1)
                        begin
                            board2[3] <= 1'b1;
                            player <= 1'b0;
                            last_switch_state[4] <= 1'b1;
                        end
                    end
    //                begin
    //                    board[3] <= player;
    //                    player <= ~player;
    //                end
                end            
                if (sw[5] == 1'b1 && last_switch_state[5] == 1'b0)
                begin
                    if (board1[4] == 1'b0 && board2[4] == 1'b0)
                    begin
                        if (player == 1'b0)
                        begin
                            board1[4] <= 1'b1;
                            player <= 1'b1;
                            last_switch_state[5] <= 1'b1;
                        end
                        else if (player == 1'b1)
                        begin
                            board2[4] <= 1'b1;
                            player <= 1'b0;
                            last_switch_state[5] <= 1'b1;
                        end
                    end
    //                begin
    //                    board[4] <= player;
    //                    player <= ~player;
    //                end
                end            
                if (sw[6] == 1'b1 && last_switch_state[6] == 1'b0)
                begin
                    if (board1[5] == 1'b0 && board2[5] == 1'b0)
                    begin
                        if (player == 1'b0)
                        begin
                            board1[5] <= 1'b1;
                            player <= 1'b1;
                            last_switch_state[6] <= 1'b1;
                        end
                        else if (player == 1'b1)
                        begin
                            board2[5] <= 1'b1;
                            player <= 1'b0;
                            last_switch_state[6] <= 1'b1;
                        end             
                    end
    //                begin
    //                    board[5] <= player;
    //                    player <= ~player;
    //                end
                end            
                if (sw[7] == 1'b1 && last_switch_state[7] == 1'b0)
                begin
                    if (board1[6] == 1'b0 && board2[6] == 1'b0)
                    begin
                        if (player == 1'b0)
                        begin                       
                            board1[6] <= 1'b1;
                            player <= 1'b1;
                            last_switch_state[7] <= 1'b1;
                        end
                        else if (player == 1'b1)
                        begin
                            board2[6] <= 1'b1;
                            player <= 1'b0;
                            last_switch_state[7] <= 1'b1;
                        end
                    end
    //                begin
    //                    board[6] <= player;
    //                    player <= ~player;
    //                end
                end 
                if (sw[8] == 1'b1 && last_switch_state[8] == 1'b0)
                begin
                    if (board1[7] == 1'b0 && board2[7] == 1'b0)
                    begin
                        if (player == 1'b0)
                        begin
                            board1[7] <= 1'b1;
                            player <= 1'b1;
                            last_switch_state[8] <= 1'b1;
                        end
                        else if (player == 1'b1)
                        begin
                            board2[7] <= 1'b1;
                            player <= 1'b0;
                            last_switch_state[8] <= 1'b1;
                        end
                    end
    //                begin
    //                    board[7] <= player;
    //                    player <= ~player;
    //                end
                end 
                if (sw[9] == 1'b1 && last_switch_state[9] == 1'b0)
                begin
                    if (board1[8] == 1'b0 && board2[8] == 1'b0)
                    begin
                        if (player == 1'b0)
                        begin
                            board1[8] <= 1'b1;
                            player <= 1'b1;
                            last_switch_state[9] <= 1'b1;
                        end
                        else if (player == 1'b1)
                        begin
                            board2[8] <= 1'b1;
                            player <= 1'b0;
                            last_switch_state[9] <= 1'b1;
                        end
                    end
    //                begin
    //                    board[8] <= player;
    //                    player <= ~player;
    //                end
                end  
    //            last_switch_state <= sw;   
            end
        end        
    end

    
    

    //winning 
    always @ (posedge clk)
    begin
        //winning logic (123)
        if (app_state == 3) begin
            if (board1[0] == 1'b1 && board1[1] == 1'b1 && board1[2] == 1'b1 && sw[1] == 1'b1 && sw[2] == 1'b1 && sw[3] == 1'b1) //p1 win
            begin
                winner <= 2'b01;
                led5 <= 1'b1;
            end      
            if (board2[0] == 1'b1 && board2[1] == 1'b1 && board2[2] == 1'b1 && sw[1] == 1'b1 && sw[2] == 1'b1 && sw[3] == 1'b1) //p2 win
            begin
                winner <= 2'b10;
                led5 <= 1'b1;
            end
            //winning logic (456)
            if (board1[3] == 1'b1 && board1[4] == 1'b1 && board1[5] == 1'b1 && sw[4] == 1'b1 && sw[5] == 1'b1 && sw[6] == 1'b1) //p1 win
            begin
                winner <= 2'b01;
                led6 <= 1'b1;
            end
            if (board2[3] == 1'b1 && board2[4] == 1'b1 && board2[5] == 1'b1 && sw[4] == 1'b1 && sw[5] == 1'b1 && sw[6] == 1'b1) //p2 win
            begin
                winner <= 2'b10;
                led6 <= 1'b1;
            end
            //winning logic (789)
            if (board1[6] == 1'b1 && board1[7] == 1'b1 && board1[8] == 1'b1 && sw[7] == 1'b1 && sw[8] == 1'b1 && sw[9] == 1'b1) //p1 win
            begin
                winner <= 2'b01;
                led7 <= 1'b1;
            end
            if (board2[6] == 1'b1 && board2[7] == 1'b1 && board2[8] == 1'b1 && sw[7] == 1'b1 && sw[8] == 1'b1 && sw[9] == 1'b1) //p2 win
            begin
                winner <= 2'b10;
                led7 <= 1'b1;
            end
            //winning logic 147      
            if (board1[0] == 1'b1 && board1[3] == 1'b1 && board1[6] == 1'b1 && sw[1] == 1'b1 && sw[4] == 1'b1 && sw[7] == 1'b1) //p1 win
            begin
                winner <= 2'b01;
                led8 <= 1'b1;
            end
            if (board2[0] == 1'b1 && board2[3] == 1'b1 && board2[6] == 1'b1 && sw[1] == 1'b1 && sw[4] == 1'b1 && sw[7] == 1'b1) //p2 win
            begin
                winner <= 2'b10;
                led8 <= 1'b1;
            end
           
            //winning logic (258)
            if (board1[1] == 1'b1 && board1[4] == 1'b1 && board1[7] == 1'b1 && sw[2] == 1'b1 && sw[5] == 1'b1 && sw[8] == 1'b1) //p1 win
            begin
                winner <= 2'b01;
                led9 <= 1'b1;
            end
            if (board2[1] == 1'b1 && board2[4] == 1'b1 && board2[7] == 1'b1 && sw[2] == 1'b1 && sw[5] == 1'b1 && sw[8] == 1'b1) //p2 win
            begin
                winner <= 2'b10;
                led9 <= 1'b1;
            end
            
            //winning logic (369)  
            if (board1[2] == 1'b1 && board1[5] == 1'b1 && board1[8] == 1'b1 && sw[3] == 1'b1 && sw[6] == 1'b1 && sw[9] == 1'b1) //p1 win
            begin
                winner <= 2'b01;
                led10 <= 1'b1;
            end  
            if (board2[2] == 1'b1 && board2[5] == 1'b1 && board2[8] == 1'b1 && sw[3] == 1'b1 && sw[6] == 1'b1 && sw[9] == 1'b1) //p2 win
            begin
                winner <= 2'b10;
                led10 <= 1'b1;
            end
                
            //winning logic (357)     
            if (board1[2] == 1'b1 && board1[4] == 1'b1 && board1[6] == 1'b1 && sw[3] == 1'b1 && sw[5] == 1'b1 && sw[7] == 1'b1) //p1 win
            begin
                winner <= 2'b01;
                led11 <= 1'b1;
            end 
            if (board2[2] == 1'b1 && board2[4] == 1'b1 && board2[6] == 1'b1 && sw[3] == 1'b1 && sw[5] == 1'b1 && sw[7] == 1'b1) //p2 win
            begin
                winner <= 2'b10;
                led11 <= 1'b1;
            end
            
            //winning logic (159)
            if (board1[0] == 1'b1 && board1[4] == 1'b1 && board1[8] == 1'b1 && sw[1] == 1'b1 && sw[5] == 1'b1 && sw[9] == 1'b1) //p1 win
            begin
                winner <= 2'b01;
                led12 <= 1'b1;
            end
            if (board2[0] == 1'b1 && board2[4] == 1'b1 && board2[8] == 1'b1 && sw[1] == 1'b1 && sw[5] == 1'b1 && sw[9] == 1'b1) //p2 win
            begin
                winner <= 2'b10;
                led12 <= 1'b1;
            end
                    
            //draw
            if (sw == 10'b1111111110 && winner <= 2'b00)
            begin
                winner <= 2'b11;
            end
            if (reset)
            begin
                winner <= 2'b00;
                led5 <= 0;
                led6 <= 0;
                led7 <= 0;
                led8 <= 0;
                led9 <= 0;
                led10 <= 0;
                led11 <= 0;
                led12 <= 0;
            end
        end        
    end 
   
endmodule


