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
module fake_i2c_salve();
reg rst, sys_clk;
wire scl;
wire sda, sda_pad_i;
reg sda_padoen_o, sda_pad_o;

reg rw, start, stop, next;
wire[7:0] data_recv;
reg[7:0] nextbyte;
wire ready_to_rw, is_idle;

assign sda = (sda_padoen_o == 1'b1) ? sda_pad_o : 1'bz;
assign sda_pad_i = sda;
pullup(sda);

reg[3:0] tester_count;

i2c_master master1(
    rst,
    sys_clk,

    scl,
    sda,

    8'ha0,
    rw,

    start,
    stop,
    next,
    nextbyte,
    data_recv,
    ready_to_rw,
    is_idle
);

initial                                                
begin     
$display("Running testbench"); 
tester_count=0;
stop=0;
sda_pad_o=0;
sda_padoen_o=0;
rst=0;
sys_clk=0;
#10 rst=1;
 

rw=0;
start=1;
#10 start=0;

end

always @(posedge ready_to_rw) begin
    if (tester_count===0)begin
        nextbyte=8'haa;
        next=1;
        #10 next=0;

        tester_count=tester_count+1;
    end else if (tester_count===1)begin
        nextbyte=8'hff;
        next=1;
        #10 next=0;

        tester_count=tester_count+1;
    end else if (tester_count===2)begin
        nextbyte=8'h55;
        next=1;
        #10 next=0;

        tester_count=tester_count+1;
    end else if (tester_count===3)begin
        nextbyte=8'h00;
        next=1;
        #10 next=0;

        tester_count=tester_count+1;
    end else if (tester_count===4)begin
        nextbyte=8'h01;
        next=1;
        #10 next=0;

        tester_count=tester_count+1;
    end else if (tester_count===5)begin
        stop=1;
        #10 stop=0;
        rw=1;
        tester_count=tester_count+1;
    end else if (tester_count===6)begin
        next=1;
        #10 next=0;

        tester_count=tester_count+1;
    end else if (tester_count===7)begin
        next=1;
        #10 next=0;

        tester_count=tester_count+1;
    end else begin
        
        stop=1;
        #10 stop=0;
    end
end

always @(posedge is_idle) begin
    #20
    start=1;
    #10 start=0;
end

always                                                 
begin                                                  
#1 sys_clk = ~sys_clk;                                          
end

endmodule

