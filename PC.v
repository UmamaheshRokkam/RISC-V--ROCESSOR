`timescale 1ns / 1ps

module PC(
input reset_n,
input [31:0] addr_in,
output [31:0] addr_out
    );
reg [31:0] Q_reg, Q_next;

always @(negedge reset_n)
begin
Q_next = addr_in;
if(!reset_n) Q_reg <= 32'd0;
else if(addr_in < 6'b11111)   Q_reg = Q_next;
else Q_reg <= 32'd0;
end
assign addr_out = Q_reg;
endmodule
