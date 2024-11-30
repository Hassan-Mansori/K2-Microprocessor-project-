#include <stdio.h>
#include <stdint.h>

void loading(uint8_t *instruction, uint8_t *D1D0, uint8_t *S, uint8_t *J, uint8_t *immediate, uint8_t *Sreg, uint8_t *jc) {
    *D1D0 = (*instruction & 0b00110000) >> 4;
    *S = (*instruction & 0b00000100) >> 2;
    *J = (*instruction & 0b10000000) >> 7;
    *immediate = (*instruction & 0b00000111);
    *Sreg = (*instruction & 0b00001000) >> 3;
    *jc = (*instruction & 0b01000000) >> 6;
}
