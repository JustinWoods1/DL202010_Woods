`timescale 1ns / 1ps

module counterTest();

    reg clk, en, rst;
    wire [1:0] count;
    wire tick;
    
    counter #(.N(2)) c(.count(count), .clk(clk),
               .en(en), .rst(rst),
               .tick(tick) );

    always begin 
        clk = ~clk; #5; 
    end
    
// this block only runs once
    initial begin
        clk=0; en=0; rst=0; ; #5;
        rst = 1; #5;
        // reset
        en = 1; rst = 0; #10;
        en = 0;     #5;
        en = 1;     #5;
        en = 0;     #10;
        en = 1;     #5;
        $finish;
    end 
endmodule
