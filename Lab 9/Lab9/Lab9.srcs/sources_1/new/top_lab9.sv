`timescale 1ns / 1ps

module top_lab9(
    input btnU, btnD, clk, btnC,
    input [15:0]sw,
    output [15:0] led
    );
    
    wire [7:0]reg1out, a1out, reg2out;
    
    register #(.N(8)) reg1 (.D(sw[7:0]), .clk(clk),
               .en(btnD), .rst(btnC),
               .Q(reg1out) ); 
               
    alu #(.N(8)) a1 (.in1(reg1out), .in0(sw[7:0]), .op(sw[11:8]),
               .out(a1out) ); 
               
    register #(.N(8)) reg2 (.D(a1out), .clk(clk),
               .en(btnU), .rst(btnC),
               .Q(reg2out) );
               
    assign led[7:0] = reg1out;
    assign led[15:8] = reg2out;
    
endmodule
