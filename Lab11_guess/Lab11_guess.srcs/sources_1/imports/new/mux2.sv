`timescale 1ns / 1ps

module mux2
    #(parameter N = 16)
    (input [N-1:0] in1, in0,
    input sel,
    output reg [N-1:0] out
    );
    
    always @*
        case(sel)
            1'b0 : out = in0;
            default : out = in1;
        endcase
   
endmodule
