`timescale 1ns / 1ps

module an_decoder(
    input [1:0]in,
    output reg [3:0]out
    );
    
    always @*
        case(in)
            2'b00 : out = 4'b1110;
            2'b01 : out = 4'b1101;
            2'b10 : out = 4'b1011;
            default : out = 4'b0111;
        endcase
    
    
endmodule
