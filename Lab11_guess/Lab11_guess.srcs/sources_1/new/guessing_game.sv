`timescale 1ns / 1ps
// ELC 2137,  Justin Woods , 2020 -04 -21

module guessing_game
    (input clk, sw, btnC, btnU, btnL, btnR, btnD,
     output [6:0]seg, [3:0]an, [15:0]led
    );
     
    wire [3:0] dataForGuess;
    wire userTime, toMux, winout, loseout;
     
    debounce  #(.N(2)) d1 (.clk(clk),
        .reset(btnC), .in(btnU), .out(dataForGuess[0]),
        .tick());
    
    debounce  #(.N(2)) d2 (.clk(clk),
        .reset(btnC), .in(btnL), .out(dataForGuess[1]),
        .tick());
    
    debounce  #(.N(2)) d3 (.clk(clk),
        .reset(btnC), .in(btnR), .out(dataForGuess[2]),
        .tick());
    
    debounce  #(.N(2)) d4 (.clk(clk),
        .reset(btnC), .in(btnD), .out(dataForGuess[3]),
        .tick());
    
    counter #(.N(2)) count (.clk(clk),
     .rst(btnC), .en(1'b1), .count(), .tick(toMux));
    
    mux2 #(.N(1)) m1 (.in1(toMux), .in0(clk),
     .sel(sw), .out(userTime));
    
    guess_FSM  #(.N(3)) gfms (.clk(userTime),
        .reset(btnC), .b(dataForGuess), .win(winout), .lose(loseout),
        .y(seg[3:0]), .tick());
   
   assign an = 1;
   assign seg[6:4] = 0;
   assign led[13:0] = 0;
   assign led[14] = winout;
   assign led[15] = loseout;
        
   
    
endmodule
