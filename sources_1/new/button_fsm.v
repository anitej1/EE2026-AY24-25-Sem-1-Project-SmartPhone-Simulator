`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 09:47:48
// Design Name: 
// Module Name: button_fsm
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


module select_app_fsm(
    input clk,
    input [2:0]switch,
    input [2:0] icon_state,
    input enter,
    output reg [2:0] state
    );
    
    wire pressed;
    
    reg counter1;
    reg counter2;
    reg counter3; 
    reg counter4; 
    reg counter5;                     
    
    detect_press fa0(enter, pressed);
    
    always @ (posedge clk) begin
        if (switch) begin
            if (enter == 1 && icon_state == 1) begin
                counter1 <= counter1 + 1;
            end
            else if (enter == 1 && icon_state == 2) begin
                counter2 <= counter2 + 1;
            end 
            else if (enter == 1 && icon_state == 3) begin
                counter3 <= counter3 + 1;
            end   
            else if (enter == 1 && icon_state == 4) begin
                counter4 <= counter4 + 1;
            end   
            else if (enter == 1 && icon_state == 5) begin
                counter5 <= counter5 + 1;
            end
        end
        else begin
            counter1<=0;
            counter2<=0;
            counter3<=0; 
            counter4<=0; 
            counter5<=0;            
        end                                              
    end
    

    always @ (posedge clk) begin
        if (icon_state == 1 && counter1 == 1) begin
            state <= 2;
        end                     
        else if (icon_state == 2 && counter2 == 1) begin
            state <= 3;
        end
        else if (icon_state == 3 && counter3 == 1) begin
            state <= 4;
        end
        else if (icon_state == 4 && counter4 == 1) begin
            state <= 5;
        end    
        else if (icon_state == 5 && counter5 == 1) begin
            state <= 6;
        end            
        else begin
            state <= 1;
        end
    end
    
    /*always @ (*) begin
        if (icon_state == 1) begin
            if (counter1 == 1) begin
                state = 2;
            end
            else begin
                state = 1;
            end
        end
        else if (icon_state == 2) begin
            if (counter2 == 1) begin
                state = 3;
            end
            else begin
                state = 1;
            end
        end
        else if (icon_state == 3) begin
            if (counter3 == 1) begin
                state = 4;
            end
            else begin
                state = 1;
            end
        end
        else if (icon_state == 4) begin
            if (counter4 == 1) begin
                state = 5;
            end
            else begin
                state = 1;
            end
        end
        else if (icon_state == 5) begin
            if (counter5 == 1) begin
                state = 6;
            end
            else begin
                state = 1;
            end
        end                                
    end*/    

    
    /*assign state = (icon_state == 1 && counter1 == 1) ? 2 : (icon_state == 2 && counter2 == 1) ? 3 :
                   (icon_state == 3 && counter3 == 1) ? 4 : (icon_state == 4 && counter4 == 1) ? 5 :
                   (icon_state == 5 && counter5 == 1) ? 6 : state;*/
endmodule
