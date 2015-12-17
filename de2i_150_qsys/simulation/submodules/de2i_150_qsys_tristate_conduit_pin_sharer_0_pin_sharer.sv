// (C) 2001-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



  
`timescale 1 ns / 1 ns

			 
module de2i_150_qsys_tristate_conduit_pin_sharer_0_pin_sharer (
 // ** Clock and Reset Connections
    input  logic clk
   ,input  logic reset

 // ** Arbiter Connections

 // *** Arbiter Grant Interface
   ,output logic ack
   ,input  logic [ 2 - 1 : 0 ] next_grant

// *** Arbiter Request Interface

    ,output logic arb_ssram1_tcm 
    ,output logic arb_ssram0_tcm 
		
		     // ** Avalon TC Slave Interfaces




  // Slave Interface tcs1

    ,input  logic tcs1_request 
    ,output logic tcs1_grant   

  //ssram1.tcm signals
    ,input  logic[ 21 :0 ] tcs1_tcm_address_out
    ,input  logic[ 3 :0 ] tcs1_tcm_byteenable_n_out
    ,input  logic[ 0 :0 ] tcs1_tcm_outputenable_n_out
    ,input  logic[ 0 :0 ] tcs1_tcm_begintransfer_n_out
    ,input  logic[ 0 :0 ] tcs1_tcm_write_n_out
    ,output logic[ 31 :0 ]  tcs1_tcm_data_in
    ,input  logic[ 31 :0 ]  tcs1_tcm_data_out
    ,input  logic tcs1_tcm_data_outen
    ,input  logic[ 0 :0 ] tcs1_tcm_chipselect_n_out



  // Slave Interface tcs0

    ,input  logic tcs0_request 
    ,output logic tcs0_grant   

  //ssram0.tcm signals
    ,input  logic[ 21 :0 ] tcs0_tcm_address_out
    ,input  logic[ 3 :0 ] tcs0_tcm_byteenable_n_out
    ,input  logic[ 0 :0 ] tcs0_tcm_outputenable_n_out
    ,input  logic[ 0 :0 ] tcs0_tcm_begintransfer_n_out
    ,input  logic[ 0 :0 ] tcs0_tcm_write_n_out
    ,output logic[ 31 :0 ]  tcs0_tcm_data_in
    ,input  logic[ 31 :0 ]  tcs0_tcm_data_out
    ,input  logic tcs0_tcm_data_outen
    ,input  logic[ 0 :0 ] tcs0_tcm_chipselect_n_out
		     
		     // ** Avalon TC Master Interface
    ,output logic request
    ,input  logic grant

		     // *** Passthrough Signals
		     
		     
                     // *** Shared Signals
		      	     
    ,output  logic[ 0 :0 ] ssram_be_n
    ,input   logic[ 31  :0 ]  fs_data_in
    ,output  logic[ 31  :0 ]  fs_data
    ,output  logic fs_data_outen
    ,output  logic[ 0 :0 ] ssram_we_n
    ,output  logic[ 21 :0 ] fs_addr
    ,output  logic[ 3 :0 ] ssram_oe_n
    ,output  logic[ 0 :0 ] ssram_adsc_n
    ,output  logic[ 0 :0 ] ssram1_cs_n
    ,output  logic[ 0 :0 ] ssram0_cs_n

		     );

   function [2-1:0] getIndex;
      
      input [2-1:0] select;
      
      getIndex = 'h0;
      
      for(int i=0; i < 2; i = i + 1) begin
	 if( select[i] == 1'b1 )
           getIndex = i;
      end
      
   endfunction // getIndex

   logic[ 2 - 1 : 0 ] selected_grant;


   // Request Assignments

    assign arb_ssram1_tcm = tcs1_request;
    assign arb_ssram0_tcm = tcs0_request;
   
   logic [ 2 - 1 : 0 ] concated_incoming_requests;
   
   
   assign 			      concated_incoming_requests = {						    
         tcs1_request 
        ,tcs0_request 
				};
   
				       
   assign 			      request = | concated_incoming_requests;
  assign        tcs0_grant = selected_grant[0];
  assign        tcs1_grant = selected_grant[1];

   
    // Perform Grant Selection						  
   always@(posedge clk, posedge reset) begin
     if(reset) begin
	selected_grant<=0;
	ack <= 0;
     end 
     else begin
       if(grant && (concated_incoming_requests[getIndex(selected_grant)] == 0 || selected_grant == 0 )) begin
	  if(~request)
	    selected_grant <= '0;
	  else
	    selected_grant <= next_grant;
	  
          ack<=1;
       end
       else begin
         ack<=0;
         selected_grant <= selected_grant;
       end
     end
   end // always@ (posedge clk, posedge reset)

// Passthrough Signals

  
// Renamed Signals
    assign ssram1_cs_n = tcs1_tcm_chipselect_n_out ;
    assign ssram0_cs_n = tcs0_tcm_chipselect_n_out ;
  
// Shared Signals
  de2i_150_qsys_tristate_conduit_pin_sharer_0_pin_sharer_multiplexor_2 #(.WIDTH(1) )
    ssram_be_n_mux (
                              {
                                tcs1_grant
                               ,tcs0_grant
                              }
                              ,tcs1_tcm_outputenable_n_out
                              ,tcs0_tcm_outputenable_n_out
                              , ssram_be_n
                             );
  assign tcs0_tcm_data_in = fs_data_in[31:0]; 
  assign tcs1_tcm_data_in = fs_data_in[31:0]; 
  de2i_150_qsys_tristate_conduit_pin_sharer_0_pin_sharer_multiplexor_2 #(.WIDTH(1) )
    fs_data_outen_mux (
                              {
                                tcs1_grant
                               ,tcs0_grant
                              }
                              ,tcs1_tcm_data_outen
                              ,tcs0_tcm_data_outen
                              , fs_data_outen
                             );
  de2i_150_qsys_tristate_conduit_pin_sharer_0_pin_sharer_multiplexor_2 #(.WIDTH(32) )
    fs_data_mux (
                              {
                                tcs1_grant
                               ,tcs0_grant
                              }
                              ,tcs1_tcm_data_out
                              ,tcs0_tcm_data_out
                              , fs_data
                             );
  de2i_150_qsys_tristate_conduit_pin_sharer_0_pin_sharer_multiplexor_2 #(.WIDTH(1) )
    ssram_we_n_mux (
                              {
                                tcs1_grant
                               ,tcs0_grant
                              }
                              ,tcs1_tcm_write_n_out
                              ,tcs0_tcm_write_n_out
                              , ssram_we_n
                             );
  de2i_150_qsys_tristate_conduit_pin_sharer_0_pin_sharer_multiplexor_2 #(.WIDTH(22) )
    fs_addr_mux (
                              {
                                tcs1_grant
                               ,tcs0_grant
                              }
                              ,tcs1_tcm_address_out
                              ,tcs0_tcm_address_out
                              , fs_addr
                             );
  de2i_150_qsys_tristate_conduit_pin_sharer_0_pin_sharer_multiplexor_2 #(.WIDTH(4) )
    ssram_oe_n_mux (
                              {
                                tcs1_grant
                               ,tcs0_grant
                              }
                              ,tcs1_tcm_byteenable_n_out
                              ,tcs0_tcm_byteenable_n_out
                              , ssram_oe_n
                             );
  de2i_150_qsys_tristate_conduit_pin_sharer_0_pin_sharer_multiplexor_2 #(.WIDTH(1) )
    ssram_adsc_n_mux (
                              {
                                tcs1_grant
                               ,tcs0_grant
                              }
                              ,tcs1_tcm_begintransfer_n_out
                              ,tcs0_tcm_begintransfer_n_out
                              , ssram_adsc_n
                             );
  
endmodule   
					    

  
module de2i_150_qsys_tristate_conduit_pin_sharer_0_pin_sharer_multiplexor_2
  #( parameter WIDTH      = 8
    ) (
    input logic  [ 2 -1 : 0]                       SelectVector,
    input logic  [ WIDTH - 1 : 0 ]                Input_1,
    input logic  [ WIDTH - 1 : 0 ]                Input_0,
    output logic [ WIDTH - 1 : 0 ]                OutputSignal
       );


function [2-1:0] getIndex;
      
    input [2-1:0] select;
   
    getIndex = 'h0;
    
    for(int i=0; i < 2; i = i + 1) begin
      if( select[i] == 1'b1 )
        getIndex = i;
    end
			      				
endfunction
								 
   always @* begin
     case(getIndex(SelectVector))
       default: OutputSignal = Input_0;
       0 : OutputSignal = Input_0;									   
       1 : OutputSignal = Input_1;									   
     endcase
   end
   
endmodule



