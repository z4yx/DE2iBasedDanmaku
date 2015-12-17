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


// $Id: //acds/rel/15.1/ip/merlin/altera_tristate_conduit_bridge/altera_tristate_conduit_bridge.sv.terp#1 $
// $Revision: #1 $
// $Date: 2015/08/09 $
// $Author: swbranch $

//Defined Terp Parameters


			    

`timescale 1 ns / 1 ns
  				      
module de2i_150_qsys_tristate_conduit_bridge_0 (
     input  logic clk
    ,input  logic reset
    ,input  logic request
    ,output logic grant
    ,input  logic[ 0 :0 ] tcs_ssram1_cs_n
    ,output  wire [ 0 :0 ] ssram1_cs_n
    ,input  logic[ 0 :0 ] tcs_ssram_adsc_n
    ,output  wire [ 0 :0 ] ssram_adsc_n
    ,input  logic[ 0 :0 ] tcs_ssram_we_n
    ,output  wire [ 0 :0 ] ssram_we_n
    ,input  logic[ 0 :0 ] tcs_ssram_oe_n
    ,output  wire [ 0 :0 ] ssram_oe_n
    ,output logic[ 31 :0 ] tcs_fs_data_in
    ,input  logic[ 31 :0 ] tcs_fs_data
    ,input  logic tcs_fs_data_outen
    ,inout  wire [ 31 :0 ]  fs_data
    ,input  logic[ 3 :0 ] tcs_ssram_be_n
    ,output  wire [ 3 :0 ] ssram_be_n
    ,input  logic[ 0 :0 ] tcs_ssram0_cs_n
    ,output  wire [ 0 :0 ] ssram0_cs_n
    ,input  logic[ 21 :0 ] tcs_fs_addr
    ,output  wire [ 21 :0 ] fs_addr
		     
   );
   reg grant_reg;
   assign grant = grant_reg;
   
   always@(posedge clk) begin
      if(reset)
	grant_reg <= 0;
      else
	grant_reg <= request;      
   end
   


 // ** Output Pin ssram1_cs_n 
 
    reg                       ssram1_cs_nen_reg;     
  
    always@(posedge clk) begin
	 if( reset ) begin
	   ssram1_cs_nen_reg <= 'b0;
	 end
	 else begin
	   ssram1_cs_nen_reg <= 'b1;
	 end
     end		     
   
 
    reg [ 0 : 0 ] ssram1_cs_n_reg;   

     always@(posedge clk) begin
	 ssram1_cs_n_reg   <= tcs_ssram1_cs_n[ 0 : 0 ];
      end
          
 
    assign 	ssram1_cs_n[ 0 : 0 ] = ssram1_cs_nen_reg ? ssram1_cs_n_reg : 'z ;
        


 // ** Output Pin ssram_adsc_n 
 
    reg                       ssram_adsc_nen_reg;     
  
    always@(posedge clk) begin
	 if( reset ) begin
	   ssram_adsc_nen_reg <= 'b0;
	 end
	 else begin
	   ssram_adsc_nen_reg <= 'b1;
	 end
     end		     
   
 
    reg [ 0 : 0 ] ssram_adsc_n_reg;   

     always@(posedge clk) begin
	 ssram_adsc_n_reg   <= tcs_ssram_adsc_n[ 0 : 0 ];
      end
          
 
    assign 	ssram_adsc_n[ 0 : 0 ] = ssram_adsc_nen_reg ? ssram_adsc_n_reg : 'z ;
        


 // ** Output Pin ssram_we_n 
 
    reg                       ssram_we_nen_reg;     
  
    always@(posedge clk) begin
	 if( reset ) begin
	   ssram_we_nen_reg <= 'b0;
	 end
	 else begin
	   ssram_we_nen_reg <= 'b1;
	 end
     end		     
   
 
    reg [ 0 : 0 ] ssram_we_n_reg;   

     always@(posedge clk) begin
	 ssram_we_n_reg   <= tcs_ssram_we_n[ 0 : 0 ];
      end
          
 
    assign 	ssram_we_n[ 0 : 0 ] = ssram_we_nen_reg ? ssram_we_n_reg : 'z ;
        


 // ** Output Pin ssram_oe_n 
 
    reg                       ssram_oe_nen_reg;     
  
    always@(posedge clk) begin
	 if( reset ) begin
	   ssram_oe_nen_reg <= 'b0;
	 end
	 else begin
	   ssram_oe_nen_reg <= 'b1;
	 end
     end		     
   
 
    reg [ 0 : 0 ] ssram_oe_n_reg;   

     always@(posedge clk) begin
	 ssram_oe_n_reg   <= tcs_ssram_oe_n[ 0 : 0 ];
      end
          
 
    assign 	ssram_oe_n[ 0 : 0 ] = ssram_oe_nen_reg ? ssram_oe_n_reg : 'z ;
        


 // ** Bidirectional Pin fs_data 
   
    reg                       fs_data_outen_reg;
  
    always@(posedge clk) begin
	 fs_data_outen_reg <= tcs_fs_data_outen;
     end
  
  
    reg [ 31 : 0 ] fs_data_reg;   

     always@(posedge clk) begin
	 fs_data_reg   <= tcs_fs_data[ 31 : 0 ];
      end
         
  
    assign 	fs_data[ 31 : 0 ] = fs_data_outen_reg ? fs_data_reg : 'z ;
       
  
    reg [ 31 : 0 ] 	fs_data_in_reg;
								    
    always@(posedge clk) begin
	 fs_data_in_reg <= fs_data[ 31 : 0 ];
    end
    
  
    assign      tcs_fs_data_in[ 31 : 0 ] = fs_data_in_reg[ 31 : 0 ];
        


 // ** Output Pin ssram_be_n 
 
    reg                       ssram_be_nen_reg;     
  
    always@(posedge clk) begin
	 if( reset ) begin
	   ssram_be_nen_reg <= 'b0;
	 end
	 else begin
	   ssram_be_nen_reg <= 'b1;
	 end
     end		     
   
 
    reg [ 3 : 0 ] ssram_be_n_reg;   

     always@(posedge clk) begin
	 ssram_be_n_reg   <= tcs_ssram_be_n[ 3 : 0 ];
      end
          
 
    assign 	ssram_be_n[ 3 : 0 ] = ssram_be_nen_reg ? ssram_be_n_reg : 'z ;
        


 // ** Output Pin ssram0_cs_n 
 
    reg                       ssram0_cs_nen_reg;     
  
    always@(posedge clk) begin
	 if( reset ) begin
	   ssram0_cs_nen_reg <= 'b0;
	 end
	 else begin
	   ssram0_cs_nen_reg <= 'b1;
	 end
     end		     
   
 
    reg [ 0 : 0 ] ssram0_cs_n_reg;   

     always@(posedge clk) begin
	 ssram0_cs_n_reg   <= tcs_ssram0_cs_n[ 0 : 0 ];
      end
          
 
    assign 	ssram0_cs_n[ 0 : 0 ] = ssram0_cs_nen_reg ? ssram0_cs_n_reg : 'z ;
        


 // ** Output Pin fs_addr 
 
    reg                       fs_addren_reg;     
  
    always@(posedge clk) begin
	 if( reset ) begin
	   fs_addren_reg <= 'b0;
	 end
	 else begin
	   fs_addren_reg <= 'b1;
	 end
     end		     
   
 
    reg [ 21 : 0 ] fs_addr_reg;   

     always@(posedge clk) begin
	 fs_addr_reg   <= tcs_fs_addr[ 21 : 0 ];
      end
          
 
    assign 	fs_addr[ 21 : 0 ] = fs_addren_reg ? fs_addr_reg : 'z ;
        

endmodule


