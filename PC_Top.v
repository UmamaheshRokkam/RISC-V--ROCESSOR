`timescale 1ns / 1ps

module PC_Top(
input reset_n,
output [31:0] pc_top_out,sum_top_out
    );
wire [31:0] sum_in;
wire [31:0] sum_out;
PC dut(
.reset_n(reset_n),
.x1(sum_out),
.y1(sum_in));

assign sum_out = sum_in + 1'b1;
assign sum_top_out = sum_out;
assign pc_top_out = sum_in;
endmodule
