#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

// Function to remove spaces from a string and standardize it if needed
void removeSpacesAndStandardize(char *str) {
    char *i = str;
    char *j = str;
    while (*j != 0) {
        *i = *j++;
        if (*i == ' ') continue;
        i++;
    }
    *i = 0;
}

// Function to convert an immediate value to a 3-bit binary string
void convertImmToBinary(const char *immStr, char *binaryImm) {
    int immVal = atoi(immStr);  // Convert string to integer
    if (immVal > 7) immVal = 7; // Cap to 3-bit maximum (7)

    binaryImm[0] = ((immVal & 0b100) >> 2) + '0';
    binaryImm[1] = ((immVal & 0b010) >> 1) + '0';
    binaryImm[2] = (immVal & 0b001) + '0';
    binaryImm[3] = '\0';
}

void assembler(uint8_t *memory) {
    FILE *inputFile = fopen("assembly.asm", "r");  // Open the assembly file in read mode
    if (inputFile == NULL) {
        perror("Error opening assembly file");
        return;
    }

    FILE *outputFile = fopen("Machine", "w");  // Open the output file in write mode
    if (outputFile == NULL) {
        perror("Error opening output file");
        fclose(inputFile);
        return;
    }

    char line[50];      // Buffer to store each line from the file
    char binaryImm[4];  // Buffer to store the 3-bit binary immediate value

    // Write machine code to output file
    while (fgets(line, sizeof(line), inputFile) != NULL) {
        line[strcspn(line, "\n")] = 0;  // Remove newline
        removeSpacesAndStandardize(line);  // Remove spaces

        if (strcmp(line, "RA=RA+RB") == 0) {
            fprintf(outputFile, "00000000\n");
        } else if (strcmp(line, "RB=RA+RB") == 0) {
            fprintf(outputFile, "00010000\n");
        } else if (strcmp(line, "RA=RA-RB") == 0) {
            fprintf(outputFile, "00000100\n");
        } else if (strcmp(line, "RB=RA-RB") == 0) {
            fprintf(outputFile, "00010100\n");
        } else if (strcmp(line, "RO=RA") == 0) {
            fprintf(outputFile, "00100000\n");
        } else if (sscanf(line, "RA=%s", binaryImm) == 1) {
            convertImmToBinary(binaryImm, binaryImm);  
            fprintf(outputFile, "00001%s\n", binaryImm);
        } else if (sscanf(line, "RB=%s", binaryImm) == 1) {
            convertImmToBinary(binaryImm, binaryImm);  
            fprintf(outputFile, "00011%s\n", binaryImm);
        } else if (sscanf(line, "JC=%s", binaryImm) == 1) {
            convertImmToBinary(binaryImm, binaryImm);  
            fprintf(outputFile, "01110%s\n", binaryImm);
        } else if (sscanf(line, "J=%s", binaryImm) == 1) {
            convertImmToBinary(binaryImm, binaryImm);  
            fprintf(outputFile, "10110%s\n", binaryImm);
        } else {
            fprintf(outputFile, "11111111\n");  // Write 0xFF for unknown instructions for debugging
        }
    }

    // Close files after writing
    fclose(inputFile);
    fclose(outputFile);

    // Reopen output file in read mode to load into memory
    outputFile = fopen("Machine", "r");
    if (outputFile == NULL) {
        perror("Error reopening output file");
        return;
    }

    int index = 0;
    char machineCode[9];  // Buffer to read each line of machine code

    // Read machine code from file and store in memory array
    while (fgets(machineCode, sizeof(machineCode), outputFile) != NULL && index < 9) {
        // Ensure the machine code line has exactly 8 characters (8 bits)
        machineCode[strcspn(machineCode, "\n")] = 0;  // Remove newline if present
        if (strlen(machineCode) == 8) {
            memory[index++] = (uint8_t) strtol(machineCode, NULL, 2);  // Convert binary string to integer
        } else {
            printf("Invalid machine code length in file\n");
        }
    }

    // Close the file after reading
    fclose(outputFile);

    printf("Machine code written to memory array.\n");
}
