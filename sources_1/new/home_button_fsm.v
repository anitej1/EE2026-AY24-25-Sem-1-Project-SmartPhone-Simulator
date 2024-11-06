`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:58:51
// Design Name: 
// Module Name: home_button_fsm
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


module home_button_fsm(
    input clk,
    input [2:0]app_state,
    input btnL,
    input btnR,
    output reg [2:0] state = 1
    );
    
    always @ (posedge clk) begin
        //state <= (state == 5) ? 1 : state;
        if (app_state == 1) begin
            if (btnR == 1) begin
                if (state == 5) begin
                    state <= 1;
                end
                else begin
                    state <= state + 1;
                end
            end
            else if (btnL == 1) begin
                if (state == 1) begin
                    state <= 5 ;
                end
                else begin
                    state <= state - 1;
                end            
            end
        end 
       

    end    

    /*always @ (posedge clk) begin
        //state <= (state == 5) ? 1 : state;
        if (app_state == 1) begin
            if (btnR == 1) begin
                if (state == 5) begin
                    state <= 1;
                end
                else begin
                    state <= state + 1;
                end
            end
            else if (btnL == 1) begin
                if (state == 1) begin
                    state <= 5 ;
                end
                else begin
                    state <= state - 1;
                end            
            end
       end
       else begin 
            state <= 0;
       end
    end*/
    
endmodule
