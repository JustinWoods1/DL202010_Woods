`timescale 1ns / 1ps
// ELC2137 Lab 8
// Justin Woods and Maya Martin
// 03/24/20

module add3(
    input [3:0]in, 
    output reg [3:0]out
    );
    
    always @*
    if (in > 4'd4)
        out = in + 4'd3;
    else out = in;
    
endmodule

