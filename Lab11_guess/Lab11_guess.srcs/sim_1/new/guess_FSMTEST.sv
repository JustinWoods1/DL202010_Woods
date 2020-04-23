`timescale 1ns / 1ps
// ELC 2137,  Justin Woods , 2020 -04 -21

module guess_FSMTEST();
    
    reg clk , reset;
    reg [3:0]b;
    wire win, lose, tick;
    wire [3:0]y;
    
    guess_FSM  #(.N(3)) gfms (.clk(clk),
        .reset(reset), .b(b), .win(win), .lose(lose),
        .y(y), .tick(tick));
        
    always  begin
        #5 clk = ~clk;
    end
    
    initial  begin
       clk =0; reset = 0; b = 4'b0000; #10;
       reset = 1; #5;
       reset = 0; #5;
       
       b[2] = 1; #10; b[2] = 0; #10;
       b[0] = 1; #10; b[0] = 0; #10;
       
       
      
        
        $finish;
    end
endmodule  


