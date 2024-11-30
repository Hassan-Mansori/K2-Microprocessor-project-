#include <stdio.h>
#include <stdint.h>
uint8_t fetch_instruction (uint8_t *meomry, uint8_t PC) {
  uint8_t instruction = meomry[PC];
  return instruction;
}
