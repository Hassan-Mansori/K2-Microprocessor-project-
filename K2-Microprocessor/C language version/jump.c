#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

bool jump(uint8_t J, uint8_t *PC, uint8_t Imm, uint8_t *jc, bool *carry_out) {
    
    if (J) {
        *PC = Imm;  
        return true;
    }
    
    else if (*jc && *carry_out) {
        *PC = Imm;  
        return true;
    }

    return false;  
}


