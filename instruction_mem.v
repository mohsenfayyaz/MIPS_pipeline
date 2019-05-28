`include "configs.v"

module instruction_mem(input clk, input [`ADDRESS_LEN-1:0] adr, output reg[`WORD_LEN-1:0] inst);
  reg [`WORD_LEN-1:0] regs[0:`MEMORY_SIZE-1];
  reg [`ADDRESS_LEN-1:0] cnt = 0;
  initial begin
 
    regs[0] = 32'b00001000000000000000000000001010;// jmp 10

    regs[10] = 32'b10001100000000010000000011111100;// lw r1,r0,252
    regs[11] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[12] = 32'b00000000000000000000000000000000;// nop
    regs[13] = 32'b00000000000000000000000000000000;// nop
    regs[14] = 32'b00010000000000100000000000000001;// beq r2,r0,12
    regs[15] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[16] = 32'b10001100000000010000000011111101;// lw r1,r0,253
    regs[17] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[18] = 32'b00000000000000000000000000000000;// nop
    regs[19] = 32'b00000000000000000000000000000000;// nop
    regs[20] = 32'b00010000000000100000000000000001;// beq r2,r0,12
    regs[21] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[22] = 32'b10001100000000010000000011111110;// lw r1,r0,254
    regs[23] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[24] = 32'b00000000000000000000000000000000;// nop
    regs[25] = 32'b00000000000000000000000000000000;// nop
    regs[26] = 32'b00010000000000100000000000000001;// beq r2,r0,12
    regs[27] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[28] = 32'b10001100000000010000000011111111;// lw r1,r0,255
    regs[29] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[30] = 32'b00000000000000000000000000000000;// nop
    regs[31] = 32'b00000000000000000000000000000000;// nop
    regs[32] = 32'b00010000000000100000000000000001;// beq r2,r0,12
    regs[33] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
  end
  
  always @(adr) begin
    inst = regs[adr];
    if(adr < 40)
      $display("CLK%d:--%b--", adr, regs[adr]);
  end
endmodule