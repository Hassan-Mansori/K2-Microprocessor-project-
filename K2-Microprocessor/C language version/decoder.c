#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>


void decoder(uint8_t address, bool *RAen, bool *RBen, bool *ROen) {
  *RAen = false;
  *RBen = false;
  *ROen = false;
  switch (address) {
   case 0b00:
     *RAen = true;
      break;
   case 0b01:
     *RBen = true;
     break;
   case 0b10:
     *ROen = true;
     break;
   case 0b11:
     break;
  }


}
