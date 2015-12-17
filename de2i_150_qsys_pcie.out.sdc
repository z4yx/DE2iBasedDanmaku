## Generated SDC file "de2i_150_qsys_pcie.out.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus Prime License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

## DATE    "Wed Dec 16 21:31:09 2015"

##
## DEVICE  "EP4CGX150DF31C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]
create_clock -name {CLOCK2_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK2_50}]
create_clock -name {CLOCK3_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK3_50}]
create_clock -name {refclk} -period 10.000 -waveform { 0.000 5.000 } [get_ports {PCIE_REFCLK_P}]
create_clock -name {GPIO[24]} -period 6.000 -waveform { 0.000 3.000 } [get_ports {GPIO[24]}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pcs0|hiptxclkout} -source [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pcs0|localrefclk}] -duty_cycle 50.000 -multiply_by 1 -master_clock {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pma0|clockout} [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pcs0|hiptxclkout}] 
create_generated_clock -name {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|pclkch0} -source [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pcs0|hiptxclkout}] -duty_cycle 50.000 -multiply_by 1 -divide_by 2 -master_clock {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pcs0|hiptxclkout} [get_pins {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|pclkch0}] 
create_generated_clock -name {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout} -source [get_pins {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|pclkch0}] -duty_cycle 50.000 -multiply_by 1 -master_clock {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|pclkch0} [get_pins {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] 
create_generated_clock -name {u0|altpll_0|sd1|pll7|clk[0]} -source [get_pins {u0|altpll_0|sd1|pll7|inclk[0]}] -duty_cycle 50.000 -multiply_by 3 -phase -101.250 -master_clock {CLOCK_50} [get_pins {u0|altpll_0|sd1|pll7|clk[0]}] 
create_generated_clock -name {u0|altpll_0|sd1|pll7|clk[1]} -source [get_pins {u0|altpll_0|sd1|pll7|inclk[0]}] -duty_cycle 50.000 -multiply_by 3 -master_clock {CLOCK_50} [get_pins {u0|altpll_0|sd1|pll7|clk[1]}] 
create_generated_clock -name {sys_pll_1|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {sys_pll_1|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 2 -master_clock {CLOCK3_50} [get_pins {sys_pll_1|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pma0|clockout} -source [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|clk[1]}] -duty_cycle 50.000 -multiply_by 1 -master_clock {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|clk[1]} [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pma0|clockout}] 
create_generated_clock -name {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|icdrclk} -source [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 25 -divide_by 2 -master_clock {refclk} [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|icdrclk}] 
create_generated_clock -name {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|clk[0]} -source [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 25 -divide_by 2 -master_clock {refclk} [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|clk[1]} -source [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 5 -divide_by 2 -master_clock {refclk} [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|clk[2]} -source [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|inclk[0]}] -duty_cycle 20.000 -multiply_by 5 -divide_by 2 -master_clock {refclk} [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|receive_pma0|clockout} -source [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|icdrclk}] -duty_cycle 50.000 -multiply_by 1 -divide_by 5 -master_clock {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|pll0|auto_generated|pll1|icdrclk} [get_pins {u0|pcie_ip|altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|receive_pma0|clockout}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {sys_pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {sys_pll_1|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {sys_pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {sys_pll_1|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {sys_pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {sys_pll_1|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {sys_pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {sys_pll_1|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}] -rise_to [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}] -fall_to [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}] -rise_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}] -fall_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}] -rise_to [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}] -fall_to [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}] -rise_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}] -fall_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|pclkch0}] -rise_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|pclkch0}] -fall_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|pclkch0}] -rise_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|pclkch0}] -fall_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -rise_to [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -fall_to [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -rise_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -fall_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -rise_to [get_clocks {GPIO[24]}] -setup 0.110  
set_clock_uncertainty -rise_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -rise_to [get_clocks {GPIO[24]}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -fall_to [get_clocks {GPIO[24]}] -setup 0.110  
set_clock_uncertainty -rise_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -fall_to [get_clocks {GPIO[24]}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -rise_to [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -fall_to [get_clocks {u0|altpll_0|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -rise_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -fall_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -rise_to [get_clocks {GPIO[24]}] -setup 0.110  
set_clock_uncertainty -fall_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -rise_to [get_clocks {GPIO[24]}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -fall_to [get_clocks {GPIO[24]}] -setup 0.110  
set_clock_uncertainty -fall_from [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -fall_to [get_clocks {GPIO[24]}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {GPIO[24]}] -rise_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {GPIO[24]}] -rise_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -hold 0.110  
set_clock_uncertainty -rise_from [get_clocks {GPIO[24]}] -fall_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {GPIO[24]}] -fall_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -hold 0.110  
set_clock_uncertainty -fall_from [get_clocks {GPIO[24]}] -rise_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {GPIO[24]}] -rise_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -hold 0.110  
set_clock_uncertainty -fall_from [get_clocks {GPIO[24]}] -fall_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {GPIO[24]}] -fall_to [get_clocks {u0|pcie_ip|pcie_internal_hip|cyclone_iii.cycloneiv_hssi_pcie_hip|coreclkout}] -hold 0.110  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|receive_pcs0~OBSERVABLEQUADRESET }] 20.000
set_max_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|receive_pcs0~OBSERVABLE_DIGITAL_RESET }] 20.000
set_max_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|cent_unit0~OBSERVABLERXDIGITALRESET }] 20.000
set_max_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|cent_unit0~OBSERVABLETXDIGITALRESET }] 20.000
set_max_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|cent_unit0~OBSERVABLERXANALOGRESET }] 20.000
set_max_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pcs0~OBSERVABLEQUADRESET }] 20.000
set_max_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pcs0~OBSERVABLE_DIGITAL_RESET }] 20.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|receive_pcs0~OBSERVABLEQUADRESET }] 0.000
set_min_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|receive_pcs0~OBSERVABLE_DIGITAL_RESET }] 0.000
set_min_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|cent_unit0~OBSERVABLERXDIGITALRESET }] 0.000
set_min_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|cent_unit0~OBSERVABLETXDIGITALRESET }] 0.000
set_min_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|cent_unit0~OBSERVABLERXANALOGRESET }] 0.000
set_min_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pcs0~OBSERVABLEQUADRESET }] 0.000
set_min_delay -to [get_ports { de2i_150_qsys:u0|de2i_150_qsys_pcie_ip:pcie_ip|de2i_150_qsys_pcie_ip_altgx_internal:altgx_internal|de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8:de2i_150_qsys_pcie_ip_altgx_internal_alt_c3gxb_u7h8_component|transmit_pcs0~OBSERVABLE_DIGITAL_RESET }] 0.000


#**************************************************************
# Set Input Transition
#**************************************************************

