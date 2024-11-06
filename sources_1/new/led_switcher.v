`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 17:37:36
// Design Name: 
// Module Name: led_switcher
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


module led_switcher(
    input basys_clk,
    input [5:0] COUNT,
    output reg [15:0] LEDS = 16'b0000000000000000
    );
    always @ (posedge basys_clk) begin
        if (COUNT == 5'b00001) begin
            LEDS <= 16'b0000000000000001;
        end
        else if (COUNT == 5'b00010) begin
            LEDS <= 16'b0000000000000011;
        end
        else if (COUNT == 5'b00011) begin
            LEDS <= 16'b0000000000000111;
        end
        else if (COUNT == 5'b00100) begin
            LEDS <= 16'b0000000000001111;
        end
        else if (COUNT == 5'b00101) begin
            LEDS <= 16'b0000000000011111;
        end
        else if (COUNT == 5'b00110) begin
            LEDS <= 16'b0000000000111111;
        end
        else if (COUNT == 5'b00111) begin
            LEDS <= 16'b0000000001111111;
        end 
        else if (COUNT == 5'b01000) begin
            LEDS <= 16'b0000000011111111;
        end         
        else if (COUNT == 5'b01001) begin
            LEDS <= 16'b0000000111111111;
        end
        else if (COUNT == 5'b01010) begin
            LEDS <= 16'b0000001111111111;
        end                  
        else if (COUNT == 5'b01011) begin
            LEDS <= 16'b0000011111111111;
        end       
        else if (COUNT == 5'b01100) begin
            LEDS <= 16'b0000111111111111;
        end         
        else if (COUNT == 5'b01101) begin
            LEDS <= 16'b0001111111111111;
        end                             
        else if (COUNT == 5'b01110) begin
            LEDS <= 16'b0011111111111111;
        end                    
        else if (COUNT == 5'b01111) begin
            LEDS <= 16'b0111111111111111;
        end     
        else if (COUNT == 5'b10000) begin
            LEDS <= 16'b1111111111111111;
        end  
        else begin
            LEDS <= 0;
        end                        
    end
    
endmodule

