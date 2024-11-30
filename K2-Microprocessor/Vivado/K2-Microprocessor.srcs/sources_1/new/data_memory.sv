`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 06:21:50 PM
// Design Name: 
// Module Name: data_memory
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

module Data_memory(
    input logic [2:0] address,       
    input logic [7:0] data_in,       
    input logic write_enable,
    input logic clk,                
    output logic [7:0] data_out,
    input reset
    );
    //write enable == d0 d1
    // address == imm
    logic [7:0] memory [7:0];        

    always @(*) begin
        data_out = memory[address];
    end

//    always @(posedge clk, negedge reset) begin
//        if (write_enable) begin
//            memory[address] = data_in;
//        end
//    end
always @(posedge clk or negedge reset) begin
    if (!reset) begin
        memory[0] = 0;
        memory[1] = 1;
       
        for (int i = 2; i < 8; i = i + 1) begin
            memory[i] <= 8'd0; // Reset memory to zeros
        end
    end else if (write_enable) begin
        memory[address] <= data_in;
    end
end

endmodule

