#ifndef ASSEMBLER_H
#define ASSEMBLER_H

#include <stdint.h>  // For uint8_t

// Function to remove spaces from a string and standardize it
void removeSpacesAndStandardize(char *str);

// Function to convert an immediate value to a 3-bit binary string
void convertImmToBinary(const char *immStr, char *binaryImm);

// Assembler function to convert assembly instructions to machine code and store in memory
void assembler(uint8_t *memory);

#endif // ASSEMBLER_H
