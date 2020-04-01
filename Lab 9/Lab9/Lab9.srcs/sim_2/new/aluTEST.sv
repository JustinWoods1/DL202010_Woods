`timescale 1ns / 1ps

module aluTEST();

    wire[7:0] out;
    reg [7:0] in0, in1;
    reg [3:0] op;
    
    alu #(.N(8)) a(.in0(in0), .in1(in1), .op(op),
               .out(out) );
               
    initial begin
        op = 0; in0 = 4; in1 = 10; #10
             
        op = 1; in0 = 14; in1 = 5; #10
        
        op = 2; in0 = 1; in1 = 0; #10
        
        op = 3; in0 = 1; in1 = 0; #10
        
        op = 4; in0 = 1; in1 = 1; #10
        
        op = 5; in0 = 8; in1 = 0; #10
        $finish;  
    end          

endmodule