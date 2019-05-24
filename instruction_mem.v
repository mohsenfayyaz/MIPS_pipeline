`include "configs.v"

module instruction_mem(input clk, input [`ADDRESS_LEN-1:0] adr, output reg[`WORD_LEN-1:0] inst);
  reg [`WORD_LEN-1:0] regs[0:`MEMORY_SIZE-1];
  reg [`ADDRESS_LEN-1:0] cnt = 0;
  initial begin
 
  
    regs[0] = 32'b10001100000000010000000011111010;// lw r1,r0,250
    regs[1] = 32'b00000000011000010001000000101010;// slt r2,r3<r1
    regs[2] = 32'b00000100000000000000000000000000;// nop
    regs[3] = 32'b00010000000000100000000000000001;// beq r2,r0,4
    regs[4] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[5] = 32'b10001100000000010000000011111011;// lw r1,r0,251
    regs[6] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[7] = 32'b00000100000000000000000000000000;//nop
    regs[8] = 32'b00010000000000100000000000000001;// beq r2,r0,8
    regs[9] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[10] = 32'b10001100000000010000000011111100;// lw r1,r0,252
    regs[11] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[12] = 32'b00000100000000000000000000000000;//nop
    regs[13] = 32'b00010000000000100000000000000001;// beq r2,r0,12
    regs[14] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[15] = 32'b10001100000000010000000011111101;// lw r1,r0,253
    regs[16] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[17] = 32'b00000100000000000000000000000000;//nop
    regs[18] = 32'b00010000000000100000000000000001;// beq r2,r0,16
    regs[19] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[20] = 32'b10001100000000010000000011111110;// lw r1,r0,254
    regs[21] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[22] = 32'b00000100000000000000000000000000;//nop
    regs[23] = 32'b00010000000000100000000000000001;// beq r2,r0,20
    regs[24] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[25] = 32'b10001100000000010000000011111111;// lw r1,r0,255
    regs[26] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[27] = 32'b00000100000000000000000000000000;//nop
    regs[28] = 32'b00010000000000100000000000000001;// beq r2,r0,24
    regs[29] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[30] = 32'b10001100000000010000000100000000;// lw r1,r0,256
    regs[31] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[32] = 32'b00000100000000000000000000000000;//nop
    regs[33] = 32'b00010000000000100000000000000001;// beq r2,r0,28
    regs[34] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[35] = 32'b10001100000000010000000100000001;// lw r1,r0,257
    regs[36] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[37] = 32'b00000100000000000000000000000000;//nop
    regs[38] = 32'b00010000000000100000000000000001;// beq r2,r0,32
    regs[39] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[40] = 32'b10001100000000010000000100000010;// lw r1,r0,258
    regs[41] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[42] = 32'b00000100000000000000000000000000;//nop
    regs[43] = 32'b00010000000000100000000000000001;// beq r2,r0,36
    regs[44] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[45] = 32'b10001100000000010000000100000011;// lw r1,r0,259
    regs[46] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[47] = 32'b00000100000000000000000000000000;//nop
    regs[48] = 32'b00010000000000100000000000000001;// beq r2,r0,40
    regs[49] = 32'b00000000000000010001100000100000;// add r3,r1,r0

  end
  
  always @(adr) begin
    inst = regs[adr];
    $display("CLK%d:--%b--", adr, regs[adr]);
  end
endmodule