`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 08:32:19 PM
// Design Name: 
// Module Name: mux4x1
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


//module mux4(
//    input logic a,     
//    input logic b,   
//    input logic c,     
//    input logic d,    
//    input logic [1:0] select, 
//    output logic j     
//    );
    
//    always @(*)
//    begin 
//        case(select)
//            //2'b00: j = a;  
//            2'b01: j = b;  
//            2'b10: j = c;  
//            2'b11: j = d;  
//            default: j = 1'hff; 
//        endcase
//    end
//endmodule


/*
module mux4(
    input logic b,   
    input logic c,     
    input logic d,    
    input logic [1:0] select, 
    output logic j     
);

    always @(*) begin
        if (select == 2'b01) begin
            j = b;
        end else if (select == 2'b10) begin
            j = c;
        end else if (select == 2'b11) begin
            j = d;
        end 
    end

endmodule

*/


module mux4(
    input logic b,                 // Input b
    input logic c,                 // Input c
    input logic d,                 // Input d
    input logic select1,           // First select signal
    input logic select2,           // Second select signal
    output logic j                 // Output j
);

    always @(*) begin
        case ({select1, select2})   // Combine select1 and select2 into a 2-bit value
            2'b01: j = b;          // Select input b
            2'b10: j = c;          // Select input c
            2'b11: j = d;          // Select input d
            default: j = 1'b0;     // Default case (e.g., when both select1 and select2 are 0)
        endcase
    end

endmodule
