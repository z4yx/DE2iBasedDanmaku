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

module link_master_salve();
reg[9:0] tester_count;
reg rst, sys_clk;
wire scl, sda;
reg[7:0] rdaddress;
reg[7:0] data_in;
wire[7:0] data_out;
wire rd, wr;
reg ready_wr, ready_rd;
wire ready;
assign ready = ready_wr|ready_rd;

pullup(sda);
pullup(scl);

wire[3:0] dbg_state;
wire[2:0] dbg_cur_bit;
wire[7:0] dbg_inter_data;
wire dbg_sda_s, dbg_sda_m;

i2c_slave slave1(
    rst,
    sys_clk,
    scl,
    sda,
    data_in,
    data_out,

    wr,
    rd,
    ready
    ,dbg_state
    ,dbg_cur_bit
    ,dbg_inter_data
    ,dbg_sda_s
);

reg rw, start, stop, next;
reg[7:0] nextbyte;
wire ready_to_rw, is_idle;
wire[7:0] data_recv;

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
    is_nak,
    nextbyte,
    data_recv,
    ready_to_rw,
    is_idle

);

always @(posedge sys_clk or negedge rst) begin
    if(!rst)begin
        rdaddress<=0;
        ready_wr<=0;
        ready_rd<=0;
        data_in<=1;
    end 
    else begin
        if(wr&&!ready_wr)begin
            rdaddress <= data_out;
            ready_wr <= 1;
        end
        else if(!wr&&ready_wr) begin
            ready_wr <= 0;
        end
        else if(rd&&!ready_rd)begin
            rdaddress <= rdaddress+1'b1;
            data_in <= rdaddress; //{data_in[6:0],data_in[7]};
            ready_rd <= 1;
        end
        else if(!rd&&ready_rd) begin
            ready_rd <= 0;
        end
    end
end

initial                                                
begin     
$display("Running testbench"); 
tester_count=0;
start=0;
stop=0;
rw=0;

rst=0;
sys_clk=0;
#10 rst=1;

end


always @(posedge ready_to_rw) begin
    if (tester_count===0)begin
        nextbyte=8'h00;
        next=1;
        #10 next=0;

        tester_count=tester_count+1;
    end else if (tester_count===1)begin
        stop=1;
        rw=1;

        tester_count=tester_count+1;
    end else if (tester_count>=2&&tester_count<='h24)begin
        next=1;
        #10 next=0;

        tester_count=tester_count+1;
    end else begin
        
        stop=1;
    end
end

always @(posedge is_idle) begin
    #150
    stop=0;
    start=1;
    #10 start=0;
end

always                                                 
begin                                                  
#1 sys_clk = ~sys_clk;                                          
end

endmodule