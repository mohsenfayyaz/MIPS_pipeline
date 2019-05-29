`include "configs.v"

module instruction_mem(input clk, input [`ADDRESS_LEN-1:0] adr, output reg[`WORD_LEN-1:0] inst);
  reg [`WORD_LEN-1:0] regs[0:`MEMORY_SIZE-1];
  reg [`ADDRESS_LEN-1:0] cnt = 0;
  initial begin
 
    regs[0] = 32'b00001000000000000000000001100100;// jmp 100
    
    //---BUBLE_SORT----
    regs[100] = 32'b10001100000000010000000000100000;// lw r1,r0,32 -> R1=1 for incrementing counter
    regs[101] = 32'b10001100000100000000000000100001;// lw r16,r0,33 -> R16=10 for counter boundry
    regs[102] = 32'b00000000000000000001000000100100;// and r2,r0,r0 -> R2=0 as counter
    
    
    regs[103] = 32'b10001100010010100000000000000000;// lw r10,r2,+0 -> R10=M[R2+0]
    regs[104] = 32'b10001100010010110000000000000001;// lw r11,r2,+1 -> R10=M[R2+1]
        
    regs[105] = 32'b00000001010010110010100000101010;// slt r5,r10,r11 -> R5=(R10<R11)
    
    regs[106] = 32'b00000000000000000000000000000000;// nop
    regs[107] = 32'b00000000000000000000000000000000;// nop
    regs[108] = 32'b00010100000001010000000000000010;// bne r5,r0,+2
    
    regs[109] = 32'b10101100010010100000000000000001;// sw r10,r2,+1 -> M[R2+1] = R10
    regs[110] = 32'b10101100010010110000000000000000;// sw r11,r2,+0 -> M[R2] = R11
    
    regs[111] = 32'b00000000001000100001000000100000;// add r2,r1,r2 -> R2=R2+1
    regs[112] = 32'b00000000010100000010100000101010;// slt r5,r2,r16 -> R5=(R2<R16)
    regs[113] = 32'b00000000000000000000000000000000;// nop
    regs[114] = 32'b00000000000000000000000000000000;// nop
    regs[115] = 32'b00010000000001010000000000000001;// beq r5,r0,+1
    
    regs[116] = 32'b00001000000000000000000001100111;// jmp 103
    regs[117] = 32'b00001000000000000000000001100110;// jmp 100
  
    
    //----FIND MAX-------
    regs[10] = 32'b10001100000000010000000011111100;// lw r1,r0,252 - 200
    regs[11] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[12] = 32'b00000000000000000000000000000000;// nop
    regs[13] = 32'b00000000000000000000000000000000;// nop
    regs[14] = 32'b00010000000000100000000000000001;// beq r2,r0,12
    regs[15] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[16] = 32'b10001100000000010000000011111101;// lw r1,r0,253 - 100
    regs[17] = 32'b00000000011000010001000000101010;// slt r2,r3,r1
    regs[18] = 32'b00000000000000000000000000000000;// nop
    regs[19] = 32'b00000000000000000000000000000000;// nop
    regs[20] = 32'b00010000000000100000000000000001;// beq r2,r0,12
    regs[21] = 32'b00000000000000010001100000100000;// add r3,r1,r0
    
    regs[22] = 32'b10001100000000010000000011111110;// lw r1,r0,254 - 234
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
    //if(adr < 40)
      //$display("CLK%d:--%b--", adr, regs[adr]);
  end
endmodule