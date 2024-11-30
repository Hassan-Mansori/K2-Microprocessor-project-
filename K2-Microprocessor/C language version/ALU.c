#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

void ALU (uint8_t Reg1, uint8_t Reg2, uint8_t oppreation, bool *carry_out, uint8_t *jc, uint8_t *instruction, uint8_t *result) {
  
  if ((*instruction) == 0x0 || (*instruction) == 0x10 || (*instruction) == 0x04 || (*instruction) == 0x14 )
    {
  if (oppreation == 0) {
    *Figure 10: 4-bit K2 Microprocessorresult = (Reg1 + Reg2) & 0x0F;
    if ((Reg1 + Reg2) > 15) {
      *carry_out = true;
      *jc = 1;
    }
    else {
      *carry_out = 0;
      *jc = 0;
    }

  }
  else {
    *result = (Reg1 - Reg2) & 0x0F;
    if ((Reg1 < Reg2)) {
      *carry_out = true;
       *jc = 1;
    }
    else {
      *carry_out = 0;
      *jc = 0;
    }

  }
  }
  
}
