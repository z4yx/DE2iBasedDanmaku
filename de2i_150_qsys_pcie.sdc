#**************************************************************
# This .sdc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period 20 [get_ports CLOCK_50]
create_clock -period 20 [get_ports CLOCK2_50]
create_clock -period 20 [get_ports CLOCK3_50]

create_clock -name {pixel_clock} -period 6.000 -waveform { 0.000 3.000 } [get_ports {GPIO[24]}]
create_clock -name {VGA_CLK} -period 6.000 -waveform { 0.000 3.000 } [get_ports {VGA_CLK}]


create_clock -period "100.0 MHz" -name {refclk} {PCIE_REFCLK_P}
set_clock_groups -exclusive -group [get_clocks { *central_clk_div0* }] -group [get_clocks { *_hssi_pcie_hip* }]
set_clock_groups -exclusive -group [get_clocks { refclk*clkout }] -group [get_clocks { *div0*coreclkout}]


#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty

#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[0]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[1]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[2]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[3]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[4]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[5]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[6]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[7]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[8]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[9]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[10]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[11]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[12]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[13]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[14]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[15]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[16]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[17]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[18]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[19]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[20]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[21]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[22]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[23]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[26]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[27]}]
set_input_delay -add_delay  -clock [get_clocks {pixel_clock}]  1.500 [get_ports {GPIO[28]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_BLANK_N}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_BLANK_N}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_B[0]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_B[0]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_B[1]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_B[1]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_B[2]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_B[2]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_B[3]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_B[3]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_B[4]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_B[4]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_B[5]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_B[5]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_B[6]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_B[6]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_B[7]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_B[7]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_CLK}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_CLK}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_G[0]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_G[0]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_G[1]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_G[1]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_G[2]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_G[2]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_G[3]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_G[3]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_G[4]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_G[4]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_G[5]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_G[5]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_G[6]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_G[6]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_G[7]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_G[7]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_HS}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_HS}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_R[0]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_R[0]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_R[1]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_R[1]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_R[2]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_R[2]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_R[3]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_R[3]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_R[4]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_R[4]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_R[5]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_R[5]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_R[6]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_R[6]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_R[7]}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_R[7]}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_SYNC_N}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_SYNC_N}]
set_output_delay -add_delay -max -clock [get_clocks {VGA_CLK}]  5.500 [get_ports {VGA_VS}]
set_output_delay -add_delay -min -clock [get_clocks {VGA_CLK}]  1.500 [get_ports {VGA_VS}]