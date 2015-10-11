// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Simulation tool : ModelSim-Altera (Verilog)
// 

`timescale 1 us/ 1 ns

module adv7513_test();
reg rst, sys_clk;
wire scl, sda;

reg init;
wire[7:0] data_out;
wire[7:0] data_out2;
wire wr,rd;
wire wr2,rd2;

pullup(sda);
pullup(scl);

adv7513 adv7513_1(
    .clk(sys_clk),
    .rst(rst),

    .adv7513_scl(scl),
    .adv7513_sda(sda),

    .init(init)
);

i2c_slave slave1(
    rst,
    sys_clk,
    scl,
    sda,
    8'b100,
    data_out,

    wr,
    rd,
    1'b1
);
defparam slave1.SLAVE_ADDR=8'h72;

i2c_slave slave2(
    rst,
    sys_clk,
    scl,
    sda,
    8'haa,
    data_out2,

    wr2,
    rd2,
    1'b1
);
defparam slave2.SLAVE_ADDR=8'h7e;

initial                                                
begin     
$display("Running testbench"); 
init=0;
rst=0;
sys_clk=0;
#10 rst=1;

#400 init=1;
#30 init=0;

end

always                                                 
begin                                                  
#1 sys_clk = ~sys_clk;                                          
end

endmodule