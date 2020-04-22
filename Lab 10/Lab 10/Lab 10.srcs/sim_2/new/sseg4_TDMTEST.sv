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
        reset = 0; sign = 0; hex_dec = 0; 
        data = 16'b0000000001000001; #2000000;
        data = 16'b0000000010000010; #2000000;
        data = 16'b0000000100000011; #2000000;
        data = 16'b0000001000000100; #2000000;
        reset = 0; sign = 0; hex_dec = 1; 
        data = 16'b0000000001000001; #2000000;
        data = 16'b0000000010000010; #2000000;
        data = 16'b0000000100000011; #2000000;
        data = 16'b0000001000000100; #2000000;
        reset = 0; sign = 1; hex_dec = 1; 
        data = 16'b0000000001000001; #2000000;
        data = 16'b0000000010000010; #2000000;
        data = 16'b0000000100000011; #2000000;
        data = 16'b0000001000000100; #2000000;
 
        
        $finish;
    end 
endmodule