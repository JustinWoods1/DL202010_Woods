

module calc_lab10(
    input btnU, btnD, clk, btnC,
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led,
    output dp
    );
    
       
    top_lab9 calc_unit(
        .btnU(btnU), .btnD(btnD), .clk(clk), .btnC(btnC),
        .sw(sw),
        .led(led)
    );
    
    sseg4_TDM disp_unit(
        .data({8'b00000000, led[15:8]}), .hex_dec(sw[15]),
        .sign(sw[14]), .reset(btnC), .clock(clk),
        .seg(seg), .an(an), .dp(dp)
        
    );
    
endmodule
