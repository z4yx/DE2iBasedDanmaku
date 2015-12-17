
module de2i_150_qsys (
	altpll_sdram_clk,
	button_external_connection_export,
	chip_sel_export,
	clk_clk,
	flash_ssram_tri_state_bridge_out_ssram1_cs_n,
	flash_ssram_tri_state_bridge_out_ssram_adsc_n,
	flash_ssram_tri_state_bridge_out_ssram_we_n,
	flash_ssram_tri_state_bridge_out_ssram_oe_n,
	flash_ssram_tri_state_bridge_out_fs_data,
	flash_ssram_tri_state_bridge_out_ssram_be_n,
	flash_ssram_tri_state_bridge_out_ssram0_cs_n,
	flash_ssram_tri_state_bridge_out_fs_addr,
	led_external_connection_export,
	mem_master_control_fixed_location,
	mem_master_control_read_base,
	mem_master_control_read_length,
	mem_master_control_go,
	mem_master_control_done,
	mem_master_control_early_done,
	mem_master_user_read_buffer,
	mem_master_user_buffer_output_data,
	mem_master_user_data_available,
	pcie_clk_clk,
	pcie_ip_clocks_sim_clk250_export,
	pcie_ip_clocks_sim_clk500_export,
	pcie_ip_clocks_sim_clk125_export,
	pcie_ip_pcie_rstn_export,
	pcie_ip_pipe_ext_pipe_mode,
	pcie_ip_pipe_ext_phystatus_ext,
	pcie_ip_pipe_ext_rate_ext,
	pcie_ip_pipe_ext_powerdown_ext,
	pcie_ip_pipe_ext_txdetectrx_ext,
	pcie_ip_pipe_ext_rxelecidle0_ext,
	pcie_ip_pipe_ext_rxdata0_ext,
	pcie_ip_pipe_ext_rxstatus0_ext,
	pcie_ip_pipe_ext_rxvalid0_ext,
	pcie_ip_pipe_ext_rxdatak0_ext,
	pcie_ip_pipe_ext_txdata0_ext,
	pcie_ip_pipe_ext_txdatak0_ext,
	pcie_ip_pipe_ext_rxpolarity0_ext,
	pcie_ip_pipe_ext_txcompl0_ext,
	pcie_ip_pipe_ext_txelecidle0_ext,
	pcie_ip_reconfig_busy_busy_altgxb_reconfig,
	pcie_ip_reconfig_fromgxb_0_data,
	pcie_ip_reconfig_togxb_data,
	pcie_ip_refclk_export,
	pcie_ip_rx_in_rx_datain_0,
	pcie_ip_test_in_test_in,
	pcie_ip_tx_out_tx_dataout_0,
	pcie_rst_n_reset_n,
	pio_size_external_connection_export,
	reset_reset_n,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	width_external_connection_export,
	height_external_connection_export);	

	output		altpll_sdram_clk;
	input	[3:0]	button_external_connection_export;
	output		chip_sel_export;
	input		clk_clk;
	output	[0:0]	flash_ssram_tri_state_bridge_out_ssram1_cs_n;
	output	[0:0]	flash_ssram_tri_state_bridge_out_ssram_adsc_n;
	output	[0:0]	flash_ssram_tri_state_bridge_out_ssram_we_n;
	output	[0:0]	flash_ssram_tri_state_bridge_out_ssram_oe_n;
	inout	[31:0]	flash_ssram_tri_state_bridge_out_fs_data;
	output	[3:0]	flash_ssram_tri_state_bridge_out_ssram_be_n;
	output	[0:0]	flash_ssram_tri_state_bridge_out_ssram0_cs_n;
	output	[21:0]	flash_ssram_tri_state_bridge_out_fs_addr;
	output	[3:0]	led_external_connection_export;
	input		mem_master_control_fixed_location;
	input	[31:0]	mem_master_control_read_base;
	input	[31:0]	mem_master_control_read_length;
	input		mem_master_control_go;
	output		mem_master_control_done;
	output		mem_master_control_early_done;
	input		mem_master_user_read_buffer;
	output	[31:0]	mem_master_user_buffer_output_data;
	output		mem_master_user_data_available;
	output		pcie_clk_clk;
	output		pcie_ip_clocks_sim_clk250_export;
	output		pcie_ip_clocks_sim_clk500_export;
	output		pcie_ip_clocks_sim_clk125_export;
	input		pcie_ip_pcie_rstn_export;
	input		pcie_ip_pipe_ext_pipe_mode;
	input		pcie_ip_pipe_ext_phystatus_ext;
	output		pcie_ip_pipe_ext_rate_ext;
	output	[1:0]	pcie_ip_pipe_ext_powerdown_ext;
	output		pcie_ip_pipe_ext_txdetectrx_ext;
	input		pcie_ip_pipe_ext_rxelecidle0_ext;
	input	[7:0]	pcie_ip_pipe_ext_rxdata0_ext;
	input	[2:0]	pcie_ip_pipe_ext_rxstatus0_ext;
	input		pcie_ip_pipe_ext_rxvalid0_ext;
	input		pcie_ip_pipe_ext_rxdatak0_ext;
	output	[7:0]	pcie_ip_pipe_ext_txdata0_ext;
	output		pcie_ip_pipe_ext_txdatak0_ext;
	output		pcie_ip_pipe_ext_rxpolarity0_ext;
	output		pcie_ip_pipe_ext_txcompl0_ext;
	output		pcie_ip_pipe_ext_txelecidle0_ext;
	input		pcie_ip_reconfig_busy_busy_altgxb_reconfig;
	output	[4:0]	pcie_ip_reconfig_fromgxb_0_data;
	input	[3:0]	pcie_ip_reconfig_togxb_data;
	input		pcie_ip_refclk_export;
	input		pcie_ip_rx_in_rx_datain_0;
	input	[39:0]	pcie_ip_test_in_test_in;
	output		pcie_ip_tx_out_tx_dataout_0;
	output		pcie_rst_n_reset_n;
	output	[31:0]	pio_size_external_connection_export;
	input		reset_reset_n;
	output	[12:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[31:0]	sdram_dq;
	output	[3:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	input	[31:0]	width_external_connection_export;
	input	[31:0]	height_external_connection_export;
endmodule
