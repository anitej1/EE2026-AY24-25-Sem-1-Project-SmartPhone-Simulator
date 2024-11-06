`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/24 21:28:34
// Design Name: 
// Module Name: segment_control
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

module segment_control_music(input basys_clock, input [31:0] note, output reg [6:0] seg, output reg [3:0] an


    );
    reg [19:0] counter = 0;
    always @ (posedge basys_clock) begin
        counter <= counter + 1;
        if (counter [19:18] == 1) begin
            an <= 4'b 0111;
            case(note)   
                //a, cH, eH, fH, f, gS, dH, g, gH, b, c, e, eflat;
                "a": seg <= 7'b 0001000;
                "cH": seg <= 7'b 1000110;
                "eH": seg <= 7'b 0000110;
                "fH": seg <= 7'b 0001110;
                "f": seg <= 7'b 0001110;
                "gS": seg <= 7'b 1000010;
                "dH": seg <= 7'b 0100001;
                "g" : seg <= 7'b 1000010;
                "gH" : seg <= 7'b 1000010;
                "b" : seg <= 7'b 0000011;
                "c" : seg <= 7'b 1000110;
                "e": seg <= 7'b 0000110;
                "eS": seg <= 7'b 0000110;
                default: seg <= 7'b 1111111;    
            endcase
         end
         else begin
            an <= 4'b 1011;
            case(note)
                "a": seg <= 7'b 1111111;
                "cH": seg <= 7'b 0001001;
                "eH": seg <= 7'b 0001001;
                "fH": seg <= 7'b 0001001;
                "f": seg <= 7'b 1111111;
                "gS": seg <= 7'b 0010010;
                "dH": seg <= 7'b 0001001;
                "g" : seg <= 7'b 1111111;
                "gH" : seg <= 7'b 0001001;
                "b" : seg <= 7'b 1111111;
                "c" : seg <= 7'b 1111111;
                "e" : seg <= 7'b 1111111;
                "eS": seg <= 7'b 0010010;                
                default: seg <= 7'b 1111111;
            endcase
             
      end
    end
endmodule
