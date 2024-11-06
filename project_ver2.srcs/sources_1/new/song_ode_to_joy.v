module song_ode_to_joy (input basys_clock, button, input [3:0] song_state, output reg speaker, output reg [31:0] note

    );
   
   //tone signals
   wire cH, dH, eH, fH, gH ;
   
   cH_523hz  tone1 (basys_clock, cH);
   dH_587hz  tone0 (basys_clock, dH);
   eH_659hz  tone2 (basys_clock, eH);
   fH_698hz  tone3 (basys_clock, fH);
   gH_784hz  tone4 (basys_clock, gH);
   
        
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
    speaker <= (state=="t1" || state=="t2" || state=="t7" || state=="t12" || state=="t13") 
          ? eH :  
          (state=="t3" || state=="t6") ? fH :                                                 
          (state=="t5" || state=="t4") ? gH :                                
          (state=="t8" || state=="t11" || state=="t14" || state=="t15") ? dH :                                              
          (state=="t9"  || state=="t10") ? cH : 0;
     //assign note out
    note <= (state=="t1" || state=="t2" || state=="t7" || state=="t12" || state=="t13") 
               ? "eH" :  
               (state=="t3" || state=="t6") ? "fH" :                                                 
               (state=="t5" || state=="t4") ? "gH" :                                
               (state=="t8" || state=="t11" || state=="t14" || state=="t15") ? "dH" :                                              
               (state=="t9"  || state=="t10") ? "cH" : 0;
               
    
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
        
                if (button == 1 && song_state == 3) begin
                    state <= "t1";
                    
                end
         end

         "t1" : begin 
                if (past_500ms) begin
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
                if (past_500ms) begin
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
                  if (past_500ms) begin
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
                  if (past_500ms) begin
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
                    if (past_500ms) begin
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
                      if (past_500ms) begin
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
                        if (past_500ms) begin
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
                        if (past_500ms) begin
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
                          if (past_500ms) begin
                              counter_clear <= 1;
                              state <= "b9";
                           end
                                                                           
                end
                
                "b9" : begin
                          if (past_break) begin
                              counter_clear <= 1;
                              state <= "t10";
                          end
                 end
                 
                 "t10" : begin
                           if (past_500ms) begin
                               counter_clear <= 1;
                               state <= "b10";
                            end
                                                                                            
                  end
                  
                  "b10" : begin
                             if (past_break) begin
                                 counter_clear <= 1;
                                 state <= "t11";
                             end
                   end
                   
                   "t11" : begin
                              if (past_500ms) begin
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
                               if (past_500ms) begin
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
                               if (past_500ms) begin
                                   counter_clear <= 1;
                                   state <= "b13";
                               end                                                                                                   
                     end
                     
                     "b13" : begin
                                if (past_350ms) begin
                                    counter_clear <= 1;
                                    state <= "t14";
                                end
                     end
                      
                      "t14" : begin
                                if (past_500ms) begin
                                    counter_clear <= 1;
                                    state <= "b14";
                                end                                                                                                   
                      end
                      
                     "b14" : begin
                               if (past_350ms) begin
                                   counter_clear <= 1;
                                   state <= "t15";
                               end
                      end 
                      
                      "t15" : begin
                                if (past_500ms) begin
                                    counter_clear <= 1;
                                    state <= "b15";
                                end                                                                                                   
                       end
                      
                      "b15" : begin
                                if (past_break) begin
                                    counter_clear <= 1;
                                    state <= "ini";
                                end
                       end
                       
                        
                  endcase
                  
            
 end
   
endmodule

