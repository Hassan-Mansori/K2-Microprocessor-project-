`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 05:22:16 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
/*module ALU  (
    input logic [7:0] a,
    input logic [7:0] b,
    input logic sel,     
    output logic [7:0] result, 
    output logic carry_out,    
    output logic overflow,
    output logic zero     
);

    logic [8:0] temp_result; 

    always@(*) begin
        if (sel == 0) begin
            temp_result = a + b; 
        end else begin
            temp_result = a - b;
        end
        if (temp_result == 0)
            assign zero = 1;

    end

     assign   result = temp_result[7:0]; 
     assign   carry_out = temp_result[8]; 
        assign overflow = (a[7] ^ b[7] ^ sel ^ temp_result[7]); 
endmodule
*/
module ALU  (
    input logic [7:0] a,         // First operand
    input logic [7:0] b,         // Second operand
    input logic sel,             // Operation selector: 0 for addition, 1 for subtraction
    output logic [7:0] result,   // Result of the operation
    output logic carry_out,      // Carry out for addition or borrow out for subtraction
    output logic overflow,       // Overflow flag
    output logic zero            // Zero flag
);

    logic [8:0] temp_result;      // Temporary result to hold 9 bits (for carry/borrow)

    always @(*) begin
        // Perform addition or subtraction
        if (sel == 0)
            temp_result = a + b; // Addition
        else
            temp_result = a - b; // Subtraction

        // Assign outputs
        result = temp_result[7:0];
        carry_out = temp_result[8];
        overflow = (a[7] ^ b[7] ^ sel ^ temp_result[7]);
        zero = (temp_result[7:0] == 8'b0); // Check if result is zero
    end

endmodule
