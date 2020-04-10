`timescale 1ns / 1ps

module mux4
    #(parameter N = 4)
    (input [N-1:0]in3, in2, in1, in0,
    input [1:0]sel,
    output reg [N-1:0] out
    );
    
    always @*
    begin
        case(sel)
            2'b00 : out = in0;
            2'b01 : out = in1;
            2'b10 : out = in2;
            default : out = in3;
        endcase
    end
endmodule
