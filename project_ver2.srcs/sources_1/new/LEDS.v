`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 17:42:08
// Design Name: 
// Module Name: LEDS
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


module LEDS(
    input clk,
    input [1:0] led_state,
    input [15:0] app_leds,
    output [15:0] leds
    );
    wire [15:0] leds1;
    wire [15:0] leds2;
    
    wire hz10;
    wire [5:0] COUNT;
    
    improved_clock(clk, 4999999, hz10); 
    
    led_switcher switch_leds(clk, COUNT, leds1);
    led_blinker blink_led(clk, leds2);
    
    assign leds = (led_state == 0) ? leds2 : (led_state == 1) ? leds1 : 
                  (led_state == 2) ? 16'b1111111111111111 : (led_state == 3) ? 
                  app_leds : 0; 
    state_counter_16 counter(led_state, hz10, COUNT);

endmodule
