`timescale 1ns / 1ps

module Instruction_Memory(
input [4:0] addr,
input clk,
output [31:0] data_out
    );
reg [31:0] Inst_reg_mem [4:0];
reg [31:0] instruction;
initial
begin
    // R Type Instructions
    
    // here funct7 is actually funct4 (4 bits instead of 7). Same with funct3
    // I generally wrote that way to match original notation
    
    // funct7_____rs2____rs1____funct3_____rd___opcode
    Inst_reg_mem[0] = 32'b0000__00101__00001__0000__01001__011_0011;    // rd = rs1 + rs2   
    Inst_reg_mem[1] = 32'b0000__00101__00001__0001__01001__011_0011;   // rd = rs1 - rs2
    Inst_reg_mem[2] = 32'b0000__00101__00001__0010__01001__011_0011;  // rd = rs1 * rs2
    Inst_reg_mem[3] = 32'b0000__00101__00001__0011__01001__011_0011;  // rd = rs1 / rs2
    Inst_reg_mem[4] = 32'b0000__00101__00001__0100__01001__011_0011;  // rd = rs1 & rs2
    Inst_reg_mem[5] = 32'b0000__00101__00001__0101__01001__011_0011;  // rd = rs1 | rs2
    Inst_reg_mem[6] = 32'b0000__00101__00001__0110__01001__011_0011;  // rd = rs1 ^ rs2
    Inst_reg_mem[7] = 32'b0000__00101__00001__0111__01001__011_0011;  // rd = rs1 << rs2
    Inst_reg_mem[8] = 32'b0000__00101__00001__1000__01001__011_0011;  // rd = rs1 >>u rs2
    Inst_reg_mem[9] = 32'b0000__00101__00001__1001__01001__011_0011;  // rd = rs1 >>s rs2
    Inst_reg_mem[10] = 32'b0000__00101__00001__1010__01001__011_0011;  // rd = (rs1 s<< rs2)?1:0
    Inst_reg_mem[11] = 32'b0000__00101__00001__1011__01001__011_0011;  // rd = (rs1 u<< rs2)?1:0
    // I Type Instructions
    
    // imm[11:0]_____rs1___funct3___rd____opcode // rd = saved register 
    Inst_reg_mem[12] = 32'b0000_11100__00001__0000__10010__001_0011;  // rd = rs1 + IMMI
    Inst_reg_mem[13] = 32'b0000_11100__00001__0001__10010__001_0011;  // rd = rs1 - IMMI
    Inst_reg_mem[14] = 32'b0000_11100__00001__0010__10010__001_0011; // rd = rs1 * IMMI
    Inst_reg_mem[15] = 32'b0000_11100__00001__0011__10010__001_0011;  // rd = rs1 / IMMI
    Inst_reg_mem[16] = 32'b0000_11100__00001__0100__10010__001_0011;  // rd = rs1 & IMMI
    Inst_reg_mem[17] = 32'b0000_11100__00001__0101__10010__001_0011;  // rd = rs1 | IMMI
    Inst_reg_mem[18] = 32'b0000_11100__00001__0110__10010__001_0011;  // rd = rs1 ^ IMMI
    Inst_reg_mem[19] = 32'b0000_11100__00001__0111__10010__001_0011;  // rd = rs1 << IMM[4:0]
    Inst_reg_mem[20] = 32'b0000_11100__00001__1000__10010__001_0011;  // rd = rs1 >>u IMM[4:0]
    Inst_reg_mem[21] = 32'b0000_11100__00001__1001__10010__001_0011;  // rd = rs1 >>s IMM[4:0]
    Inst_reg_mem[22] = 32'b0000_11100__00001__1010__10010__001_0011;  // rd = (rs1 s<< IMM[4:0])?1:0
    Inst_reg_mem[23] = 32'b0000_11100__00001__1011__10010__001_0011;  // rd = (rs1 u<< IMM[4:0])?1:0
    
    /* S Type Instructions
     Simple store operation */
    
    //  imm[11:5]___rs2__rs1___funct3___imm[4:0]___opcode
    Inst_reg_mem[24] = 32'b0000__10000__01101__0000__00000__010_0011; // rs2 = M[rs1 + IMMI]

/* In future, will further extend to B,U and J Type Instructions
      32'b0000_00101_00001_1011_xxxxx__010_0011:
      32'b0000_00101_00001_1011_xxxxx__010_0011:
*/
    Inst_reg_mem[25] = 32'd0;
    Inst_reg_mem[26] = 32'd0;
    Inst_reg_mem[27] = 32'd0;
    Inst_reg_mem[28] = 32'd0;
    Inst_reg_mem[29] = 32'd0;
    Inst_reg_mem[30] = 32'd0;
    Inst_reg_mem[31] = 32'd0;
  
end

always @(posedge clk)
begin
instruction <= Inst_reg_mem[addr];
end
assign data_out = instruction;
endmodule