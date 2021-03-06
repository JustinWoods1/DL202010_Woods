`timescale 1ns / 1ps
// ELC 2137,  Justin Woods , 2020 -04 -21

module guessing_game
    (input clk, btnC, btnU, btnL, btnR, btnD,
     input [15:0]sw,
     output [6:0]seg, [3:0]an, [15:0]led
    );
     
    wire [3:0] dataForGuess;
    wire userTime, toMux, winout, loseout;
     
    debounce  #(.N(21)) d1 (.clk(clk),
        .reset(btnC), .in(btnU), .out(dataForGuess[0]),
        .tick());
    
    debounce  #(.N(21)) d2 (.clk(clk),
        .reset(btnC), .in(btnL), .out(dataForGuess[1]),
        .tick());
    
    debounce  #(.N(21)) d3 (.clk(clk),
        .reset(btnC), .in(btnR), .out(dataForGuess[2]),
        .tick());
    
    debounce  #(.N(21)) d4 (.clk(clk),
        .reset(btnC), .in(btnD), .out(dataForGuess[3]),
        .tick());
    
    counter #(.N(23)) count (.clk(clk),
     .rst(btnC), .en(1'b1), .count(), .tick(toMux));
    
    mux2 #(.N(1)) m1 (.in1(toMux), .in0(clk),
     .sel(sw[0]), .out(userTime));
    
    guess_FSM  #(.N(3)) gfms (.clk(userTime),
        .reset(btnC), .b(dataForGuess), .win(winout), .lose(loseout),
        .y(seg[3:0]), .tick());
   
   assign an[3:0] = 4'b1110;
   assign seg[6:4] = 3'b111;
   assign led[13:0] = 0;
   assign led[14] = winout;
   assign led[15] = loseout;
        
endmodule
