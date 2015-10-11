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
module fake_i2c_master();
reg rst, sys_clk, ready;
reg[7:0] data_r;
wire[7:0] data_w;
wire sda, sda_pad_i;
reg sda_padoen_o, sda_pad_o;
reg scl;
reg[7:0] nextbyte;

wire rd, wr;

assign sda = (sda_padoen_o == 1'b1) ? sda_pad_o : 1'bz;
assign sda_pad_i = sda;
pullup(sda);

i2c_slave slave1(
    rst,
    sys_clk,
    scl,
    sda,
    data_r,
    data_w,
    wr,
    rd,
    ready
);

initial                                                
begin     
$display("Running testbench"); 
nextbyte=8'ha0;   
ready=0;
scl=1;                   
sda_pad_o=1;
sda_padoen_o=0;
rst=0;
sys_clk=0;
#10 rst=1;

//Write.........
/*
sda_pad_o=0;
sda_padoen_o=1; //START
#10
scl=0;
#10
repeat (8) begin //Address
    sda_pad_o=nextbyte[7];
    nextbyte={nextbyte[6:0],1'b0};
    #10 scl=1;
    #10 scl=0;
end
sda_padoen_o=0;  
#10 scl=1; //ACK
#10 scl=0;

#100
nextbyte = 8'h55;

sda_padoen_o=1;  
repeat (8) begin //DATA
    sda_pad_o=nextbyte[7];
    nextbyte={nextbyte[6:0],1'b0};
    #10 scl=1;
    #10 scl=0;
end
sda_padoen_o=0;  
#10 scl=1; //ACK
#10 scl=0;

#100
nextbyte = 8'haa;

sda_padoen_o=1;  
repeat (8) begin //DATA
    sda_pad_o=nextbyte[7];
    nextbyte={nextbyte[6:0],1'b0};
    #10 scl=1;
    #10 scl=0;
end
sda_padoen_o=0;  
#10 scl=1; //ACK
#10 scl=0;


#10 
sda_pad_o=0;
sda_padoen_o=1;  

#10 scl=1;
#10 sda_padoen_o=0;  //STOP 
*/
#100
//Read.....

nextbyte=8'ha1;   
data_r = 8'h00;

sda_pad_o=0;
sda_padoen_o=1; //START
#10
scl=0;
#10
repeat (8) begin //Address
    sda_pad_o=nextbyte[7];
    nextbyte={nextbyte[6:0],1'b0};
    #10 scl=1;
    #10 scl=0;
end
sda_padoen_o=0;  
#10 scl=1; //ACK
#10 scl=0;

#100

data_r = 8'h01;

repeat (8) begin //DATA
    #10 scl=1;
    #10 scl=0;
end
sda_pad_o=0;
sda_padoen_o=1;  
#10 scl=1; //ACK
#10 scl=0;
sda_padoen_o=0;  

#100

data_r = 8'h02;

repeat (8) begin //DATA
    #10 scl=1;
    #10 scl=0;
end
sda_pad_o=0;
sda_padoen_o=1;  
#10 scl=1; //ACK
#10 scl=0;
sda_padoen_o=0;  

#100

data_r = 8'h03;

repeat (8) begin //DATA
    #10 scl=1;
    #10 scl=0;
end
sda_pad_o=0;
sda_padoen_o=1;  
#10 scl=1; //ACK
#10 scl=0;
sda_padoen_o=0;  


#10
sda_pad_o=0;
sda_padoen_o=1;  

#10 scl=1;
#10 sda_padoen_o=0;  //STOP 
end

always @(posedge rd) begin
    ready <= 1;
end

always @(negedge rd) begin
    ready <= 0;
end

always                                                 
begin                                                  
#1 sys_clk = ~sys_clk;                                          
end

endmodule

