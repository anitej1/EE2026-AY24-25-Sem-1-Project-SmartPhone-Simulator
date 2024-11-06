`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 20:49:27
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input clk,
    input btn,
    output reg press
    );
    
    wire [1:0] clk_200ms;
    
    reg [1:0] check;
    reg pressed;
    reg [31:0] counter;
    
    debouncer_clk200ms dut(clk, 9999999, clk_200ms);
    
    always @ (posedge clk) begin
        if (btn == 1 && counter > 0)
        begin
            press <= 1;           
        end
        else begin 
            press <= 0;
        end
    end
    always @ (posedge clk) begin
        if (btn)
        begin
            counter <= counter + clk_200ms;
        end         
        else begin 
            counter <= 0;
        end
    end   
endmodule
