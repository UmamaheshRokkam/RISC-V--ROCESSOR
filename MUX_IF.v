`timescale 1ns / 1ps

module MUX_IF
#(parameter N = 32)(
input [N-1:0] a,b,
input sel,
output [N-1:0] out
    );
assign out = sel?a:b; 
   
endmodule

