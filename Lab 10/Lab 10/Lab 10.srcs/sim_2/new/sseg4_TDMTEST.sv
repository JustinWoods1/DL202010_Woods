`timescale 1ns / 1ps

module sseg4_TDMTEST();

    reg [15:0]data;
    reg hex_dec, sign;
    reg reset, clock;
    wire [6:0] seg;
    wire [3:0] an;
    wire dp;
    
    sseg4_TDM  s(.data(data), .hex_dec(hex_dec),
               .sign(sign), .reset(reset), .clock(clock),
               .seg(seg), .an(an), .dp(dp)
                );

    always begin 
        clock = ~clock; #5; 
    end
    
// this block only runs once
    initial begin
        clock = 0; reset=0; #5;
        reset = 1; #5;
        
        // reset
        reset = 0; sign = 0; hex_dec = 1; 
        data = 16'b0000000000000001; #1000000;
        data = 16'b0000000000000010; #1000000;
        data = 16'b0000000000000011; #1000000;
        data = 16'b0000000000000100; #1000000;
        data = 16'b0000000000000101; #1000000;
        data = 16'b0000000000000110; #1000000;
        data = 16'b0000000000000111; #1000000;
        data = 16'b0000000000001000; #1000000;
        data = 16'b0000000000001001; #1000000;
        data = 16'b0000000000001010; #1000000;
        data = 16'b0000000000001011; #1000000;
        data = 16'b0000000000001100; #1000000;
        data = 16'b0000000000001101; #1000000;
        data = 16'b0000000000001110; #1000000;
        data = 16'b0000000000001111; #1000000;
        
        $finish;
    end 
endmodule