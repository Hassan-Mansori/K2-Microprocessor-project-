`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 09:21:13 AM
// Design Name: 
// Module Name: K2_agony
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


module K2_agonyv2 (
  
   input  clk,
   input reset,
   output logic [7:0] ra_bus, rb_bus, r0_bus,
   output logic [3:0] pc_bus

);


//input logic [1:0]jc;
       logic [7:0] comand_bus;
//    logic [7:0] ra_bus;
//    logic [7:0] rb_bus;
//    logic [7:0] r0_bus;
   logic [3:0] decoder_bus;
   logic [7:0] mux_bus;
   logic [7:0] alu_bus;
   logic carry_bus;
   logic dff_bus;
   logic flipflop_out;
   logic flipflop2_out;
   logic js;
   logic jump_bus;
   logic updown;
   logic [7:0] data_out;
   logic dff2_input;
   logic en_w;
   logic mux_select;
   logic [7:0] mux2_bus;
   logic overflow;
   logic write_en;
//     logic [3:0] pc_bus; 
    //pc counter 
    
    PC pc_counter (.d(comand_bus[3:0]), 
                    .jump(jump_bus),.q(pc_bus), .reset(reset), .clk(clk), .updown(1'b1));
   
    
    //instruction memory
    Instruction_memory im( .PC(pc_bus), .comm(comand_bus));
    
    
    
    //decoder
    decoder_dd d1( .d0(comand_bus[4]), .d1(comand_bus[5]), .out(decoder_bus));
    
     //mux
    mux m1(.a(alu_bus), .imm(comand_bus[2:0]), . s(comand_bus[3]), .out(mux_bus));
    
    assign mux_select = comand_bus[7] & comand_bus[3];
    muxx m2(.m1(mux_bus), .memory(data_out), . s(mux_select), .out(mux2_bus));
    
    mux4 m3 (.b(flipflop_out), .c(js), .d(flipflop2_out), .j(jump_bus), .select1(comand_bus[7]), .select2(comand_bus[6]));
    assign js = comand_bus[7] & ~comand_bus[3];
    //assign jc = {comand_bus[7], comand_bus[6]};
    
    
    //registers
    rege #(8) ra(.en(decoder_bus[0]), .clk(clk), .I(mux2_bus), .Q(ra_bus), .reset(reset));
    rege #(8) rb(.en(decoder_bus[1]), .clk(clk), .I(mux2_bus), .Q(rb_bus), .reset(reset));
    rege #(8) r0(.en(decoder_bus[2]), .clk(clk), .I(ra_bus), .Q(r0_bus), .reset(reset));
    
     //ALU
    ALU al(.a(ra_bus), .b(rb_bus), .sel(comand_bus[2]), .result(alu_bus), .carry_out(carry_bus), .overflow(overflow), .zero(dff2_input));
    
    
     //DFF
      rege #(1) rdff(.en(1), .clk(clk), .I(carry_bus), .Q(flipflop_out), .reset(reset));
      rege #(1) zero_dff(.en(1), .clk(clk), .I(dff2_input), .Q(flipflop2_out), .reset(reset));
//        and(jump_bus,and_bus,comand_bus[6]);
//        or(or_bus,jump_bus,comand_bus[7]);

    
    
    //data memory
    assign write_en = (comand_bus[5] & comand_bus[4] ) & ~(comand_bus[7] | comand_bus[6]);
    Data_memory dm(.address(comand_bus[3:0]), .data_in(ra_bus), .write_enable(write_en), .clk(clk), .data_out(data_out), .reset(reset));

    
   
   
endmodule
