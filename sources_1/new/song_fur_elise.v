`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/13 14:47:17
// Design Name: 
// Module Name: song
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


module song_fur_elise (input basys_clock, button, input [3:0] song_state, output reg speaker, output reg [31:0] note

    );
   
   //tone signals
   wire eH,dH,b,cH,a,c,e,eS;
   
   cH_523hz  tone1 (basys_clock, cH);
   a_440hz  tone3 (basys_clock, a);
   c_256hz  tone4 (basys_clock, c);
   eH_659hz tone5 (basys_clock, eH);
   dH_587hz tone6 (basys_clock, dH);
   e_329hz tone7 (basys_clock, e);
   b_494hz ton8 (basys_clock, b);
   dsharp tone9(basys_clock, eS);
   //time delay
   parameter integer basys_freq = 100_000_000;
   parameter integer delay_500ms = basys_freq * 0.5;
   parameter integer delay_350ms = basys_freq * 0.35;
   parameter integer delay_150ms = basys_freq * 0.15;
   parameter integer delay_650ms = basys_freq * 0.65;
   parameter integer delay_break = basys_freq * 0.1;
   
   
   // reg for counter and trigger
   reg [31:0] counter = 0;
   reg counter_clear = 0;
   reg past_500ms = 0;
   reg past_350ms = 0;
   reg past_150ms = 0;
   reg past_650ms = 0;
   reg past_break = 0;
   
   
   
   
   
   // state selection
   reg [31:0] state = "ini";
   
   always @ (posedge basys_clock) begin
    speaker <= (state=="t1" || state=="t3" || state=="t5") 
                                 ? eH :  
                                 (state=="t2" || state=="t4" ) ? eS :
                                 (state == "t7") ? dH :                                                 
                                 (state=="t6" || state=="t13" || state=="t16") ? b :                                
                                 (state=="t8" || state=="t17") ? cH :    
                                 (state=="t9" || state=="t12" || state =="t15") ? a :   
                                 (state=="t10") ? c :                                                                                                               
                                 (state=="t11" || state=="t14") ? e : 0;
    note <= (state=="t1" || state=="t3" || state=="t5") 
              ? "eH" :  
              (state=="t2" || state=="t4") ? "eS" :
              (state=="t7")? "dH" :                                                 
              (state=="t6" || state=="t13" || state=="t16") ? "b" :                                
              (state=="t8" || state=="t17") ? "cH" :    
              (state=="t9" || state=="t12" || state =="t15") ? "a" :   
              (state=="t10") ? "c" :                                                                                                               
              (state=="t11" || state=="t14") ? "e" : 0;
    
    
    
    if (counter_clear) begin
        counter <= 0;
        counter_clear <= 0;
        past_500ms <= 0;
        past_350ms <= 0;
        past_150ms <= 0;
        past_650ms <= 0;
        past_break <= 0;
     end
    
    else begin
        counter <= counter + 1;
        if (counter == delay_500ms) 
            past_500ms <= 1;
        if (counter == delay_350ms)
            past_350ms <= 1;
        if (counter == delay_150ms)
            past_150ms <= 1;
        if (counter == delay_650ms)
            past_650ms <= 1;
        if (counter == delay_break)
            past_break <= 1;
    end
    
    case(state)
    "ini" : begin counter_clear <= 1; 
            
                    if (button == 1 && song_state == 2) begin
                        state <= "t1";
                        
                    end
             end
    
             "t1" : begin 
                    if (past_350ms) begin
                        counter_clear <= 1;
                        state <= "b1";
                     end
             end
             
             "b1" : begin
                    if (past_break) begin
                        counter_clear <= 1;
                        state <= "t2";
                    end
             end
             
             "t2" :begin
                    if (past_350ms) begin
                        counter_clear <= 1;
                        state <= "b2";
                    end
             end
             
             "b2" : begin
                     if (past_break) begin
                         counter_clear <= 1;
                         state <= "t3";
                     end
             end
             
             "t3" : begin
                      if (past_350ms) begin
                          counter_clear <= 1;
                          state <= "b3";
                      end
             end
             
             "b3" : begin
                     if (past_break) begin
                         counter_clear <= 1;
                         state <= "t4";
                     end
             end
             
             "t4" : begin
                      if (past_350ms) begin
                          counter_clear <= 1;
                          state <= "b4";
                      end
              
              end
              
              "b4" : begin
                       if (past_break) begin
                           counter_clear <= 1;
                           state <= "t5";
                       end
               end
               
               "t5" : begin
                        if (past_350ms) begin
                           counter_clear <= 1;
                           state <= "b5";
                        end
                         
                end
                
                "b5" : begin
                         if (past_break) begin
                             counter_clear <= 1;
                             state <= "t6";
                         end
                end
                
                "t6" : begin
                          if (past_350ms) begin
                              counter_clear <= 1;
                              state <= "b6";
                          end
                                     
                 end
                 
                 "b6" : begin
                           if (past_break) begin
                               counter_clear <= 1;
                               state <= "t7";
                           end
                 end
                 
                 "t7" : begin
                            if (past_350ms) begin
                                counter_clear <= 1;
                                state <= "b7";
                            end
                                                  
                  end
                 
                  "b7" : begin
                            if (past_break) begin
                                counter_clear <= 1;
                                state <= "t8";
                         end
                  end
                  
                  "t8" : begin
                            if (past_350ms) begin
                                counter_clear <= 1;
                                state <= "b8";
                            end
                                                                
                   end
                   
                   "b8" : begin
                             if (past_break) begin
                                 counter_clear <= 1;
                                 state <= "t9";
                              end
                   end
                   
                   "t9" : begin
                              if (past_break) begin
                                  counter_clear <= 1;
                                  state <= "b9";
                               end
                                                                               
                    end
                    
                    "b9" : begin
                              if (past_500ms) begin
                                  counter_clear <= 1;
                                  state <= "t10";
                              end
                     end
                     
                     "t10" : begin
                               if (past_350ms) begin
                                   counter_clear <= 1;
                                   state
                                    <= "b10";
                                end
                                                                                                
                      end
                      
                      "b10" : begin
                                 if (past_break) begin
                                     counter_clear <= 1;
                                     state <= "t11";
                                 end
                       end
                       
                       "t11" : begin
                                  if (past_350ms) begin
                                      counter_clear <= 1;
                                      state <= "b11";
                                   end
                                                                                                                   
                       end
                        
                       "b11" : begin
                                   if (past_break) begin
                                      counter_clear <= 1;
                                      state <= "t12";
                                   end
                       end
                        
                       "t12" : begin
                                   if (past_350ms) begin
                                     counter_clear <= 1;
                                     state <= "b12";
                                   end                                                                                                   
                        end
                                 
                        "b12" : begin
                                  if (past_break) begin
                                      counter_clear <= 1;
                                      state <= "t13";
                                  end
                         end
                                 
                         "t13" : begin
                                   if (past_650ms) begin
                                       counter_clear <= 1;
                                       state <= "b13";
                                   end                                                                                                   
                         end
                         
                         "b13" : begin
                                    if (past_break) begin
                                        counter_clear <= 1;
                                        state <= "t14";
                                    end
                         end
                          
                          "t14" : begin
                                    if (past_350ms) begin
                                        counter_clear <= 1;
                                        state <= "b14";
                                    end                                                                                                   
                          end
                          
                         "b14" : begin
                                   if (past_break) begin
                                       counter_clear <= 1;
                                       state <= "t15";
                                   end
                          end 
                         "t15" : begin
                                    if (past_350ms) begin
                                    counter_clear <= 1;
                                    state <= "b15";
                                    end                                                                                                   
                                 end
                         "b15" : begin
                                    if (past_break) begin
                                        counter_clear <= 1;
                                        state <= "t16";
                                    end
                                 end
                         "t16" : begin
                                     if (past_350ms) begin
                                         counter_clear <= 1;
                                         state <= "b16";
                                     end                                                                                                   
                                 end
                         "b16" : begin
                                     if (past_break) begin
                                        counter_clear <= 1;
                                        state <= "t17";
                                     end
                                 end
                         "t17" : begin
                                     if (past_350ms) begin
                                        counter_clear <= 1;
                                        state <= "b17";
                                 end                                                                                                   
                            end      
                            
                        "b17" : begin
                                      if (past_break) begin
                                        counter_clear <= 1;
                                        state <= "ini";
                               end                                                                                                   
                        end    

                  
    endcase        
 end
   
endmodule


