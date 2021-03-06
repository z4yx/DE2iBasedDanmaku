
# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 15.1 185 win32 2015.11.09.03:59:27
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script can be used to simulate the following IP:
#     de2i_150_qsys
# To create a top-level simulation script which compiles other
# IP, and manages other system issues, copy the following template
# and adapt it to your needs:
# 
# # Start of template
# # If the copied and modified template file is "aldec.do", run it as:
# #   vsim -c -do aldec.do
# #
# # Source the generated sim script
# source rivierapro_setup.tcl
# # Compile eda/sim_lib contents first
# dev_com
# # Override the top-level name (so that elab is useful)
# set TOP_LEVEL_NAME top
# # Compile the standalone IP.
# com
# # Compile the user top-level
# vlog -sv2k5 ../../top.sv
# # Elaborate the design.
# elab
# # Run the simulation
# run
# # Report success to the shell
# exit -code 0
# # End of template
# ----------------------------------------
# If de2i_150_qsys is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "de2i_150_qsys"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera_lite/15.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/submodules/de2i_150_qsys_onchip_memory.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                        ./libraries/altera_ver            
vmap       altera_ver             ./libraries/altera_ver            
ensure_lib                        ./libraries/lpm_ver               
vmap       lpm_ver                ./libraries/lpm_ver               
ensure_lib                        ./libraries/sgate_ver             
vmap       sgate_ver              ./libraries/sgate_ver             
ensure_lib                        ./libraries/altera_mf_ver         
vmap       altera_mf_ver          ./libraries/altera_mf_ver         
ensure_lib                        ./libraries/altera_lnsim_ver      
vmap       altera_lnsim_ver       ./libraries/altera_lnsim_ver      
ensure_lib                        ./libraries/cycloneiv_hssi_ver    
vmap       cycloneiv_hssi_ver     ./libraries/cycloneiv_hssi_ver    
ensure_lib                        ./libraries/cycloneiv_pcie_hip_ver
vmap       cycloneiv_pcie_hip_ver ./libraries/cycloneiv_pcie_hip_ver
ensure_lib                        ./libraries/cycloneiv_ver         
vmap       cycloneiv_ver          ./libraries/cycloneiv_ver         
ensure_lib                                            ./libraries/error_adapter_0                           
vmap       error_adapter_0                            ./libraries/error_adapter_0                           
ensure_lib                                            ./libraries/rsp_mux                                   
vmap       rsp_mux                                    ./libraries/rsp_mux                                   
ensure_lib                                            ./libraries/rsp_demux                                 
vmap       rsp_demux                                  ./libraries/rsp_demux                                 
ensure_lib                                            ./libraries/cmd_mux                                   
vmap       cmd_mux                                    ./libraries/cmd_mux                                   
ensure_lib                                            ./libraries/cmd_demux                                 
vmap       cmd_demux                                  ./libraries/cmd_demux                                 
ensure_lib                                            ./libraries/router_001                                
vmap       router_001                                 ./libraries/router_001                                
ensure_lib                                            ./libraries/router                                    
vmap       router                                     ./libraries/router                                    
ensure_lib                                            ./libraries/avalon_st_adapter_001                     
vmap       avalon_st_adapter_001                      ./libraries/avalon_st_adapter_001                     
ensure_lib                                            ./libraries/avalon_st_adapter                         
vmap       avalon_st_adapter                          ./libraries/avalon_st_adapter                         
ensure_lib                                            ./libraries/pcie_ip_bar1_0_to_led_s1_cmd_width_adapter
vmap       pcie_ip_bar1_0_to_led_s1_cmd_width_adapter ./libraries/pcie_ip_bar1_0_to_led_s1_cmd_width_adapter
ensure_lib                                            ./libraries/rsp_mux_003                               
vmap       rsp_mux_003                                ./libraries/rsp_mux_003                               
ensure_lib                                            ./libraries/rsp_mux_001                               
vmap       rsp_mux_001                                ./libraries/rsp_mux_001                               
ensure_lib                                            ./libraries/rsp_demux_003                             
vmap       rsp_demux_003                              ./libraries/rsp_demux_003                             
ensure_lib                                            ./libraries/cmd_mux_005                               
vmap       cmd_mux_005                                ./libraries/cmd_mux_005                               
ensure_lib                                            ./libraries/cmd_mux_003                               
vmap       cmd_mux_003                                ./libraries/cmd_mux_003                               
ensure_lib                                            ./libraries/cmd_mux_001                               
vmap       cmd_mux_001                                ./libraries/cmd_mux_001                               
ensure_lib                                            ./libraries/cmd_demux_003                             
vmap       cmd_demux_003                              ./libraries/cmd_demux_003                             
ensure_lib                                            ./libraries/cmd_demux_002                             
vmap       cmd_demux_002                              ./libraries/cmd_demux_002                             
ensure_lib                                            ./libraries/cmd_demux_001                             
vmap       cmd_demux_001                              ./libraries/cmd_demux_001                             
ensure_lib                                            ./libraries/onchip_memory_s1_burst_adapter            
vmap       onchip_memory_s1_burst_adapter             ./libraries/onchip_memory_s1_burst_adapter            
ensure_lib                                            ./libraries/pcie_ip_bar1_0_limiter                    
vmap       pcie_ip_bar1_0_limiter                     ./libraries/pcie_ip_bar1_0_limiter                    
ensure_lib                                            ./libraries/router_010                                
vmap       router_010                                 ./libraries/router_010                                
ensure_lib                                            ./libraries/router_008                                
vmap       router_008                                 ./libraries/router_008                                
ensure_lib                                            ./libraries/router_006                                
vmap       router_006                                 ./libraries/router_006                                
ensure_lib                                            ./libraries/router_005                                
vmap       router_005                                 ./libraries/router_005                                
ensure_lib                                            ./libraries/router_003                                
vmap       router_003                                 ./libraries/router_003                                
ensure_lib                                            ./libraries/onchip_memory_s1_agent_rsp_fifo           
vmap       onchip_memory_s1_agent_rsp_fifo            ./libraries/onchip_memory_s1_agent_rsp_fifo           
ensure_lib                                            ./libraries/onchip_memory_s1_agent                    
vmap       onchip_memory_s1_agent                     ./libraries/onchip_memory_s1_agent                    
ensure_lib                                            ./libraries/pcie_ip_bar1_0_agent                      
vmap       pcie_ip_bar1_0_agent                       ./libraries/pcie_ip_bar1_0_agent                      
ensure_lib                                            ./libraries/pcie_ip_bar1_0_translator                 
vmap       pcie_ip_bar1_0_translator                  ./libraries/pcie_ip_bar1_0_translator                 
ensure_lib                                            ./libraries/arbiter                                   
vmap       arbiter                                    ./libraries/arbiter                                   
ensure_lib                                            ./libraries/pin_sharer                                
vmap       pin_sharer                                 ./libraries/pin_sharer                                
ensure_lib                                            ./libraries/tda                                       
vmap       tda                                        ./libraries/tda                                       
ensure_lib                                            ./libraries/slave_translator                          
vmap       slave_translator                           ./libraries/slave_translator                          
ensure_lib                                            ./libraries/tdt                                       
vmap       tdt                                        ./libraries/tdt                                       
ensure_lib                                            ./libraries/pipe_interface_internal                   
vmap       pipe_interface_internal                    ./libraries/pipe_interface_internal                   
ensure_lib                                            ./libraries/reset_controller_internal                 
vmap       reset_controller_internal                  ./libraries/reset_controller_internal                 
ensure_lib                                            ./libraries/altgx_internal                            
vmap       altgx_internal                             ./libraries/altgx_internal                            
ensure_lib                                            ./libraries/pcie_internal_hip                         
vmap       pcie_internal_hip                          ./libraries/pcie_internal_hip                         
ensure_lib                                            ./libraries/rst_controller                            
vmap       rst_controller                             ./libraries/rst_controller                            
ensure_lib                                            ./libraries/irq_mapper                                
vmap       irq_mapper                                 ./libraries/irq_mapper                                
ensure_lib                                            ./libraries/mm_interconnect_1                         
vmap       mm_interconnect_1                          ./libraries/mm_interconnect_1                         
ensure_lib                                            ./libraries/mm_interconnect_0                         
vmap       mm_interconnect_0                          ./libraries/mm_interconnect_0                         
ensure_lib                                            ./libraries/tristate_conduit_pin_sharer_0             
vmap       tristate_conduit_pin_sharer_0              ./libraries/tristate_conduit_pin_sharer_0             
ensure_lib                                            ./libraries/tristate_conduit_bridge_0                 
vmap       tristate_conduit_bridge_0                  ./libraries/tristate_conduit_bridge_0                 
ensure_lib                                            ./libraries/ssram0                                    
vmap       ssram0                                     ./libraries/ssram0                                    
ensure_lib                                            ./libraries/sgdma                                     
vmap       sgdma                                      ./libraries/sgdma                                     
ensure_lib                                            ./libraries/pcie_ip                                   
vmap       pcie_ip                                    ./libraries/pcie_ip                                   
ensure_lib                                            ./libraries/onchip_memory                             
vmap       onchip_memory                              ./libraries/onchip_memory                             
ensure_lib                                            ./libraries/led                                       
vmap       led                                        ./libraries/led                                       
ensure_lib                                            ./libraries/button                                    
vmap       button                                     ./libraries/button                                    

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"        -work altera_ver            
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                 -work lpm_ver               
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                    -work sgate_ver             
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                -work altera_mf_ver         
  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"            -work altera_lnsim_ver      
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_hssi_atoms.v"     -work cycloneiv_hssi_ver    
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_pcie_hip_atoms.v" -work cycloneiv_pcie_hip_ver
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_atoms.v"          -work cycloneiv_ver         
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_avalon_st_adapter_001_error_adapter_0.sv" -work error_adapter_0                           
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"     -work error_adapter_0                           
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_1_rsp_mux.sv"                               -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_1_rsp_demux.sv"                             -work rsp_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_1_cmd_mux.sv"                               -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_1_cmd_demux.sv"                             -work cmd_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_1_router_001.sv"                            -work router_001                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_1_router.sv"                                -work router                                    
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_avalon_st_adapter_001.v"                  -work avalon_st_adapter_001                     
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_avalon_st_adapter.v"                      -work avalon_st_adapter                         
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_width_adapter.sv"                                           -work pcie_ip_bar1_0_to_led_s1_cmd_width_adapter
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                       -work pcie_ip_bar1_0_to_led_s1_cmd_width_adapter
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                      -work pcie_ip_bar1_0_to_led_s1_cmd_width_adapter
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work rsp_mux_003                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_rsp_mux_003.sv"                           -work rsp_mux_003                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work rsp_mux_001                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_rsp_mux_001.sv"                           -work rsp_mux_001                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_rsp_mux.sv"                               -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_rsp_demux_003.sv"                         -work rsp_demux_003                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_rsp_demux.sv"                             -work rsp_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux_005                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_cmd_mux_005.sv"                           -work cmd_mux_005                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux_003                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_cmd_mux_003.sv"                           -work cmd_mux_003                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux_001                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_cmd_mux_001.sv"                           -work cmd_mux_001                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_cmd_mux.sv"                               -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_cmd_demux_003.sv"                         -work cmd_demux_003                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_cmd_demux_002.sv"                         -work cmd_demux_002                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_cmd_demux_001.sv"                         -work cmd_demux_001                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_cmd_demux.sv"                             -work cmd_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                                           -work onchip_memory_s1_burst_adapter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                    -work onchip_memory_s1_burst_adapter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                                      -work onchip_memory_s1_burst_adapter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                                       -work onchip_memory_s1_burst_adapter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                                           -work onchip_memory_s1_burst_adapter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                                           -work onchip_memory_s1_burst_adapter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                                        -work onchip_memory_s1_burst_adapter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                       -work onchip_memory_s1_burst_adapter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                       -work onchip_memory_s1_burst_adapter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                         -work onchip_memory_s1_burst_adapter            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                         -work pcie_ip_bar1_0_limiter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                                          -work pcie_ip_bar1_0_limiter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                  -work pcie_ip_bar1_0_limiter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                         -work pcie_ip_bar1_0_limiter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_router_010.sv"                            -work router_010                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_router_008.sv"                            -work router_008                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_router_006.sv"                            -work router_006                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_router_005.sv"                            -work router_005                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_router_003.sv"                            -work router_003                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_router_001.sv"                            -work router_001                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0_router.sv"                                -work router                                    
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                  -work onchip_memory_s1_agent_rsp_fifo           
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                             -work onchip_memory_s1_agent                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                      -work onchip_memory_s1_agent                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                            -work pcie_ip_bar1_0_agent                      
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                       -work pcie_ip_bar1_0_translator                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_std_arbitrator_core.sv"                                     -work arbiter                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_tristate_conduit_pin_sharer_0_arbiter.sv"                   -work arbiter                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_tristate_conduit_pin_sharer_0_pin_sharer.sv"                -work pin_sharer                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_tristate_controller_aggregator.sv"                                 -work tda                                       
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                        -work slave_translator                          
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_tristate_controller_translator.sv"                                 -work tdt                                       
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_pipe_interface.v"                                                 -work pipe_interface_internal                   
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_pcie_reconfig_bridge.v"                                           -work pipe_interface_internal                   
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_pcie_hard_ip_reset_controller.v"                                   -work reset_controller_internal                 
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_rs_serdes.v"                                                      -work reset_controller_internal                 
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_pll_100_250.v"                                                    -work reset_controller_internal                 
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_pll_125_250.v"                                                    -work reset_controller_internal                 
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_pcie_ip_altgx_internal.vo"                                  -work altgx_internal                            
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_a2p_addrtrans.v"                       -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_a2p_fixtrans.v"                        -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_a2p_vartrans.v"                        -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_control_register.v"                    -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_cfg_status.v"                          -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_cr_avalon.v"                           -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_cr_interrupt.v"                        -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_cr_mailbox.v"                          -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_p2a_addrtrans.v"                       -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_reg_fifo.v"                            -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_rx.v"                                  -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_rx_cntrl.v"                            -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_rx_resp.v"                             -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_tx.v"                                  -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_tx_cntrl.v"                            -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_txavl_cntrl.v"                         -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_txresp_cntrl.v"                        -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_clksync.v"                                  -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_lite/altpciexpav_lite_app.v"                                 -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpciexpav_stif_app.v"                                                   -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_hip_pipen1b_qsys.v"                                               -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                -work rst_controller                            
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                              -work rst_controller                            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_irq_mapper.sv"                                              -work irq_mapper                                
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_1.v"                                        -work mm_interconnect_1                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_mm_interconnect_0.v"                                        -work mm_interconnect_0                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_tristate_conduit_pin_sharer_0.v"                            -work tristate_conduit_pin_sharer_0             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/de2i_150_qsys_tristate_conduit_bridge_0.sv"                               -work tristate_conduit_bridge_0                 
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_ssram0.v"                                                   -work ssram0                                    
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_sgdma.v"                                                    -work sgdma                                     
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_pcie_ip.v"                                                  -work pcie_ip                                   
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_onchip_memory.v"                                            -work onchip_memory                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_led.v"                                                      -work led                                       
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/de2i_150_qsys_button.v"                                                   -work button                                    
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/de2i_150_qsys.v"                                                                                                                     
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L avalon_st_adapter_001 -L avalon_st_adapter -L pcie_ip_bar1_0_to_led_s1_cmd_width_adapter -L rsp_mux_003 -L rsp_mux_001 -L rsp_demux_003 -L cmd_mux_005 -L cmd_mux_003 -L cmd_mux_001 -L cmd_demux_003 -L cmd_demux_002 -L cmd_demux_001 -L onchip_memory_s1_burst_adapter -L pcie_ip_bar1_0_limiter -L router_010 -L router_008 -L router_006 -L router_005 -L router_003 -L onchip_memory_s1_agent_rsp_fifo -L onchip_memory_s1_agent -L pcie_ip_bar1_0_agent -L pcie_ip_bar1_0_translator -L arbiter -L pin_sharer -L tda -L slave_translator -L tdt -L pipe_interface_internal -L reset_controller_internal -L altgx_internal -L pcie_internal_hip -L rst_controller -L irq_mapper -L mm_interconnect_1 -L mm_interconnect_0 -L tristate_conduit_pin_sharer_0 -L tristate_conduit_bridge_0 -L ssram0 -L sgdma -L pcie_ip -L onchip_memory -L led -L button -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L avalon_st_adapter_001 -L avalon_st_adapter -L pcie_ip_bar1_0_to_led_s1_cmd_width_adapter -L rsp_mux_003 -L rsp_mux_001 -L rsp_demux_003 -L cmd_mux_005 -L cmd_mux_003 -L cmd_mux_001 -L cmd_demux_003 -L cmd_demux_002 -L cmd_demux_001 -L onchip_memory_s1_burst_adapter -L pcie_ip_bar1_0_limiter -L router_010 -L router_008 -L router_006 -L router_005 -L router_003 -L onchip_memory_s1_agent_rsp_fifo -L onchip_memory_s1_agent -L pcie_ip_bar1_0_agent -L pcie_ip_bar1_0_translator -L arbiter -L pin_sharer -L tda -L slave_translator -L tdt -L pipe_interface_internal -L reset_controller_internal -L altgx_internal -L pcie_internal_hip -L rst_controller -L irq_mapper -L mm_interconnect_1 -L mm_interconnect_0 -L tristate_conduit_pin_sharer_0 -L tristate_conduit_bridge_0 -L ssram0 -L sgdma -L pcie_ip -L onchip_memory -L led -L button -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo "                                 For most designs, this should be overridden"
  echo "                                 to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS  -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS     -- User-defined elaboration options, added to elab/elab_debug aliases."
}
file_copy
h
