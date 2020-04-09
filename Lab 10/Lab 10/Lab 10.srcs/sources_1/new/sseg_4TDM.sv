`timescale 1ns / 1ps

module sseg4_TDM(
    input [15:0]data,
    input hex_dec, sign,
    input reset, clock,
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
   
    wire [15:0] mux2mux4, bcd2mux2;
    wire [6:0] ssegmux2;
    wire [3:0] mux4sseg, anan;
    wire [1:0] digit_sel;
    wire andmux2;
    wire timer2counter;
    
    bcd11 bcd11in(
        .in(data[10:0]),
        .out(bcd2mux2)
        );
    mux2 #(.N(16)) mux2num1(
        .in0(data), .in1(bcd2mux2), .sel(hex_dec),
        .out(mux2mux4)
        );
    mux4 mux4num1(
        .in3(mux2mux4[15:12]), .in2(mux2mux4[11:8]), 
        .in1(mux2mux4[7:4]), .in0(mux2mux4[3:0]),
        .sel(digit_sel),
        .out(mux4sseg)
        );
    sseg_decoder ssegdecode(
        .in(mux4sseg),
        .out(ssegmux2)
        );
    mux2 #(.N(7)) mux2num2(
        .in1(7'b0111111), .in0(ssegmux2), .sel(andmux2),
        .out(seg[6:0])
        );
    and A1(
        andmux2,
        sign, ~anan[3]
        );
    an_decoder andecode(
        .in(digit_sel),
        .out(anan)
        );
        
    counter #(.N(18)) timer(
        .en(1'b1), .clk(clock), .rst(reset),
        .count(), .tick(timer2counter)
        );
        
    counter #(.N(2)) counter2(
        .en(1'b1), .clk(timer2counter), .rst(reset),
        .count(digit_sel), .tick()
        );
      
    assign an = anan;
    assign dp = 1;
 
endmodule