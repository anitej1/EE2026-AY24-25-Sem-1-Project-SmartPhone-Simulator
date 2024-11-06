`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 17:33:30
// Design Name: 
// Module Name: password_check
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


module password_check(
    input clk,
    input [2:0] app_state,
    input [9:0] password,
    input [9:0] sw,
    output reg [1:0] password_state = 0
    );
    
    wire pressed ;
    reg start;
    wire delayed;
    
    reg check_correct = 0;
    //delay delay(start, clk, 49999999,delayed); 
    sw_change(app_state, sw, pressed);    
    
    always @ (posedge clk) begin
        if (app_state == 0) begin
            if (pressed == 0 && check_correct==0) begin
                password_state <= 0;
            end
            else if (sw == password && check_correct==0) begin
                password_state <= 1;
                start<= 1;
                check_correct<=1;
            end
            else if (sw == 0 && check_correct==1) begin
                password_state <= 3;
            end
            else if (sw != password) begin
                password_state <= 2;
            end
        end
        else begin
            password_state <= 3;
            check_correct <= 0;
        end
    end 

            
endmodule
