
module tb_K2_agony;

    // Testbench signals
    reg clk, reset;
    logic  write_en;                              // Clock signal
    wire [3:0] pc_bus;                    // Program counter
//    wire [7:0] comand_bus;                // Command bus
    wire [7:0] ra_bus, rb_bus, r0_bus;
    // mux2_bus;    // Register buses
//    wire [3:0] decoder_bus;               // Decoder bus
//    wire [7:0] mux_bus, alu_bus;          // Mux and ALU buses
//    wire overflow, mux_select, en_w, carry_bus, dff_bus, jump_bus, flipflop_out, flipflop2_out, js, data_out, dff2_input; // Control signals

    // Instantiate the DUT (Device Under Test)
    K2_agonyv2 dut (
        .pc_bus(pc_bus),  // Inout connected to wire
        .clk(clk),
        .reset(reset),
        .ra_bus(ra_bus),
        .rb_bus(rb_bus),
        .r0_bus(r0_bus)
       // .decoder_bus(decoder_bus)
//        .mux_bus(mux_bus),    
//        .alu_bus(alu_bus),    
//        .carry_bus(carry_bus),
//        .dff_bus(dff_bus),       
//        .flipflop_out(flipflop_out),
//         .js(js),
//         .jump_bus(jump_bus),
//         //.updown(updown),
//         .data_out(data_out),
//         .dff2_input( dff2_input),
//         .en_w(en_w),
//         .mux_select(mux_select),
//         .mux2_bus(mux2_bus),
//         .write_en(write_en),
//         .flipflop2_out(flipflop2_out)                   
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #10 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Monitor signals for debugging
         reset = 0;
       #5
       reset = 1;
       #5
        $monitor("Time=%0t | PC=%b | Command=%b | RA=%b | RB=%b | R0=%b | ALU=%b | Carry=%b | Jump=%b", 
                 $time, pc_bus, comand_bus, ra_bus, rb_bus, r0_bus, alu_bus, carry_bus, jump_bus);
        // Reset state
        #0; // Initial state at time=0
        #700; // Run for 100 ns
        $finish; // End simulation
    end

endmodule