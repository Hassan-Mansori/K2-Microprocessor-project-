`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 08:20:40 PM
// Design Name: 
// Module Name: muxx
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

module muxx(
    input logic [7 :0]m1,
    input logic  [7:0] memory,
    input logic s,
    output logic [7:0] out 
    );
    
    assign out = ~s ? m1 : memory;
    
endmodule
