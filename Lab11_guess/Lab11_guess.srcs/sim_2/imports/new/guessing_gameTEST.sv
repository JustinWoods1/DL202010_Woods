`timescale 1ns / 1ps
// ELC 2137,  Justin Woods , 2020 -04 -21

module guessing_gameTEST();

    reg clk, sw, btnC, btnU, btnL, btnR, btnD;
    wire [6:0]seg;
    wire [3:0]an;
    wire [15:0]led;
    
    
    guessing_game gg (.clk(clk), .sw(sw), 
            .btnC(btnC), .btnU(btnU), .btnL(btnL),
            .btnR(btnR), .btnD(btnD), .seg(seg), 
            .an(an), .led(led));
            
    always  begin
        #5 clk = ~clk;
    end
    
        
    initial  begin
       clk = 0; 
       sw = 1;
       btnC = 0; btnU = 0; btnL = 0; btnR = 0; btnD = 0;
       #10;
       
       btnC = 1; #5;
       btnC = 0; #5;
       
       btnL = 1; #5 btnL = 0; #5;
       btnL = 1; #5 btnL = 0; #5;
       btnL = 1; #5 btnL = 0; #5;
       btnL = 1; #5 btnL = 0; #5;
       
       #250;
       sw = 0;
       btnC = 1; #5;
       btnC = 0; #25;
       

       $finish;
       
    end     
endmodule
