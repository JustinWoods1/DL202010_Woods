`timescale 1ns / 1ps
// ELC2137 Lab8
// Justin Woods and Maya Martin
// 03/24/20

module bcd11(
    input [10:0] in,
    output [15:0] out
    );
    wire [3:0] thousands, hundreds, tens, ones,
               ex1, ex2, ex3, ex4, ex5,
               ex6, ex7, ex8, ex9, ex10,
               ex11, ex12, ex13, ex14, ex15;
    
    add3 D1(
        .in({1'b0, in[10:8]}),
        .out({ex1})
        );
    add3 D2(
        .in({ex1[2:0], in[7]}),
        .out({ex2}) 
        );
    add3 D3( 
        .in({ex2[2:0], in[6]}), 
        .out({ex3}) 
        );
    add3 D9( 
        .in({1'b0, ex1[3], ex2[3], ex3[3]}), 
        .out({ex9}) 
        );
    add3 D4( 
        .in({ex3[2:0], in[5]}), 
        .out({ex4}) 
        );
    add3 D10( 
        .in({ex9[2:0], ex4[3]}), 
        .out({ex10})    
        );
    add3 D5( 
        .in({ex4[2:0], in[4]}), 
        .out({ex5}) 
        );
    add3 D11( 
        .in({ex10[2:0], ex5[3]}), 
        .out({ex11}) 
        );
    add3 D6( 
        .in({ex5[2:0], in[3]}), 
        .out({ex6}) 
        );
    add3 D14( 
        .in({1'b0, ex9[3], ex10[3], ex11[3]}), 
        .out({ex14}) 
        );
    add3 D12( 
        .in({ex11[2:0], ex6[3]}), 
        .out({ex12}) 
        );
    add3 D7(
        .in({ex6[2:0], in[2]}), 
        .out({ex7}) 
        );
    add3 D15( 
        .in({ex14[2:0], ex12[3]}), 
        .out({ex15}) 
        );
    add3 D13( 
        .in({ex12[2:0], ex7[3]}), 
        .out({ex13}) 
        );
    add3 D8( 
        .in({ex7[2:0], in[1]}), 
        .out({ex8}) 
        );
    
    assign ones = {ex8[2:0], in[0]};
    assign tens = {ex13[2:0], ex8[3]};
    assign hundreds = {ex15[2:0], ex13[3]};
    assign thousands = {1'b0, 1'b0, ex14[3], ex15[3]};
    assign out = {thousands, hundreds, tens, ones};
     
endmodule