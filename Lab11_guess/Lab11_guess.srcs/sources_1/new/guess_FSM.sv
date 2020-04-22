`timescale 1ns / 1ps
// ELC 2137,  Justin Woods , 2020 -04 -21

module guess_FSM  #( parameter N = 21)
    (input clk , reset ,
     input  [3:0] b,
     output  reg win, lose , [3:0]y,
     output  reg  tick);
     
    //  define  states  as local  parameters (constants)
    localparam  [2:0]
        s0    = 3'b000,
        s1    = 2'b001,
        s2    = 2'b010,
        s3    = 2'b011,
        swin =  3'b100,
        slose = 3'b101;
        
    //  internal  signals
    reg  [1:0]  state , state_next;
    reg [N -1:0]  counter , counter_next;
    
    // state  memory (register)
    always_ff @(posedge  clk or  posedge reset)
        if (reset) begin
            state    <= s0;
            counter  <= {N{1'b1}};
        end
        else  begin
            state    <= state_next;
            counter  <= counter_next;
        end
        
    //  combined  next -state  and  output logic
    always_comb  begin
        //  default  behavior
        state_next    = state;
        counter_next = counter;
        tick = 0;
        
        case(state)
            s0: begin
                y[0] = 1;                   //Light
                counter_next = {N{1'b1}};
                
                if (b[3] && b[2] && b[1] && !b[0]) //Correct button
                    state_next = swin;
                else if (!b[3] || !b[2] || !b[1]) //Incorrect button
                    state_next = slose;
                else if (b[3] && b[2] && b[1] && b[0]) //No button
                    state_next = s1;
            end
            
            s1: begin
                y[1] = 1;                   //Light
                counter_next = {N{1'b1}};
                //counter_next = counter  - 1;
               // if (counter  == 0) begin
                 //   tick = 1'b1; // Mealy output
                   // state_next = s2;
                //end
                
                if (b[3] && b[2] && !b[1] && b[0]) //Correct button
                    state_next = swin;
                else if (!b[3] || !b[2] || !b[0]) //Incorrect button
                    state_next = slose;
                else if (b[3] && b[2] && b[1] && b[0]) //No button
                    state_next = s2;
            end
            
            s2: begin
                 y[2] = 1;                  //Light
                 counter_next = {N{1'b1}};
                 
                 if (b[3] && !b[2] && b[1] && b[0]) //Correct button
                     state_next = swin;
                 else if (!b[3] || !b[1] || !b[0]) //Incorrect button
                     state_next = slose;
                 else if (b[3] && b[2] && b[1] && b[0]) //No button
                     state_next = s3;
            end
        
            s3: begin
                y[3] = 1;
                counter_next = {N{1'b1}};
                
                if (!b[3] && b[2] && b[1] && !b[0]) //Correct button
                    state_next = swin;
                else if (!b[2] || !b[1] || !b[0]) //Incorrect button
                    state_next = slose;
                else if (b[3] && b[2] && b[1] && b[0]) //No button
                    state_next = s0;
            end
            
            swin: begin
                win = 1;
                if (b[3] && b[2] && b[1] && b[0]) //No button
                    state_next = s0;
                else if (!b[3] || !b[2] || !b[1] || !b[0]) //Any button
                    state_next = swin;
            end
            
            slose: begin
            lose = 1;
                if (b[3] && b[2] && b[1] && b[0]) //No button
                    state_next = s0;
                else if (!b[3] || !b[2] || !b[1] || !b[0]) //Any button
                    state_next = slose;
            end
            
        endcase
    end
endmodule
