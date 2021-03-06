	de2i_150_qsys u0 (
		.altpll_sdram_clk                              (<connected-to-altpll_sdram_clk>),                              //                     altpll_sdram.clk
		.button_external_connection_export             (<connected-to-button_external_connection_export>),             //       button_external_connection.export
		.chip_sel_export                               (<connected-to-chip_sel_export>),                               //                         chip_sel.export
		.clk_clk                                       (<connected-to-clk_clk>),                                       //                              clk.clk
		.flash_ssram_tri_state_bridge_out_ssram1_cs_n  (<connected-to-flash_ssram_tri_state_bridge_out_ssram1_cs_n>),  // flash_ssram_tri_state_bridge_out.ssram1_cs_n
		.flash_ssram_tri_state_bridge_out_ssram_adsc_n (<connected-to-flash_ssram_tri_state_bridge_out_ssram_adsc_n>), //                                 .ssram_adsc_n
		.flash_ssram_tri_state_bridge_out_ssram_we_n   (<connected-to-flash_ssram_tri_state_bridge_out_ssram_we_n>),   //                                 .ssram_we_n
		.flash_ssram_tri_state_bridge_out_ssram_oe_n   (<connected-to-flash_ssram_tri_state_bridge_out_ssram_oe_n>),   //                                 .ssram_oe_n
		.flash_ssram_tri_state_bridge_out_fs_data      (<connected-to-flash_ssram_tri_state_bridge_out_fs_data>),      //                                 .fs_data
		.flash_ssram_tri_state_bridge_out_ssram_be_n   (<connected-to-flash_ssram_tri_state_bridge_out_ssram_be_n>),   //                                 .ssram_be_n
		.flash_ssram_tri_state_bridge_out_ssram0_cs_n  (<connected-to-flash_ssram_tri_state_bridge_out_ssram0_cs_n>),  //                                 .ssram0_cs_n
		.flash_ssram_tri_state_bridge_out_fs_addr      (<connected-to-flash_ssram_tri_state_bridge_out_fs_addr>),      //                                 .fs_addr
		.led_external_connection_export                (<connected-to-led_external_connection_export>),                //          led_external_connection.export
		.mem_master_control_fixed_location             (<connected-to-mem_master_control_fixed_location>),             //               mem_master_control.fixed_location
		.mem_master_control_read_base                  (<connected-to-mem_master_control_read_base>),                  //                                 .read_base
		.mem_master_control_read_length                (<connected-to-mem_master_control_read_length>),                //                                 .read_length
		.mem_master_control_go                         (<connected-to-mem_master_control_go>),                         //                                 .go
		.mem_master_control_done                       (<connected-to-mem_master_control_done>),                       //                                 .done
		.mem_master_control_early_done                 (<connected-to-mem_master_control_early_done>),                 //                                 .early_done
		.mem_master_user_read_buffer                   (<connected-to-mem_master_user_read_buffer>),                   //                  mem_master_user.read_buffer
		.mem_master_user_buffer_output_data            (<connected-to-mem_master_user_buffer_output_data>),            //                                 .buffer_output_data
		.mem_master_user_data_available                (<connected-to-mem_master_user_data_available>),                //                                 .data_available
		.pcie_clk_clk                                  (<connected-to-pcie_clk_clk>),                                  //                         pcie_clk.clk
		.pcie_ip_clocks_sim_clk250_export              (<connected-to-pcie_ip_clocks_sim_clk250_export>),              //               pcie_ip_clocks_sim.clk250_export
		.pcie_ip_clocks_sim_clk500_export              (<connected-to-pcie_ip_clocks_sim_clk500_export>),              //                                 .clk500_export
		.pcie_ip_clocks_sim_clk125_export              (<connected-to-pcie_ip_clocks_sim_clk125_export>),              //                                 .clk125_export
		.pcie_ip_pcie_rstn_export                      (<connected-to-pcie_ip_pcie_rstn_export>),                      //                pcie_ip_pcie_rstn.export
		.pcie_ip_pipe_ext_pipe_mode                    (<connected-to-pcie_ip_pipe_ext_pipe_mode>),                    //                 pcie_ip_pipe_ext.pipe_mode
		.pcie_ip_pipe_ext_phystatus_ext                (<connected-to-pcie_ip_pipe_ext_phystatus_ext>),                //                                 .phystatus_ext
		.pcie_ip_pipe_ext_rate_ext                     (<connected-to-pcie_ip_pipe_ext_rate_ext>),                     //                                 .rate_ext
		.pcie_ip_pipe_ext_powerdown_ext                (<connected-to-pcie_ip_pipe_ext_powerdown_ext>),                //                                 .powerdown_ext
		.pcie_ip_pipe_ext_txdetectrx_ext               (<connected-to-pcie_ip_pipe_ext_txdetectrx_ext>),               //                                 .txdetectrx_ext
		.pcie_ip_pipe_ext_rxelecidle0_ext              (<connected-to-pcie_ip_pipe_ext_rxelecidle0_ext>),              //                                 .rxelecidle0_ext
		.pcie_ip_pipe_ext_rxdata0_ext                  (<connected-to-pcie_ip_pipe_ext_rxdata0_ext>),                  //                                 .rxdata0_ext
		.pcie_ip_pipe_ext_rxstatus0_ext                (<connected-to-pcie_ip_pipe_ext_rxstatus0_ext>),                //                                 .rxstatus0_ext
		.pcie_ip_pipe_ext_rxvalid0_ext                 (<connected-to-pcie_ip_pipe_ext_rxvalid0_ext>),                 //                                 .rxvalid0_ext
		.pcie_ip_pipe_ext_rxdatak0_ext                 (<connected-to-pcie_ip_pipe_ext_rxdatak0_ext>),                 //                                 .rxdatak0_ext
		.pcie_ip_pipe_ext_txdata0_ext                  (<connected-to-pcie_ip_pipe_ext_txdata0_ext>),                  //                                 .txdata0_ext
		.pcie_ip_pipe_ext_txdatak0_ext                 (<connected-to-pcie_ip_pipe_ext_txdatak0_ext>),                 //                                 .txdatak0_ext
		.pcie_ip_pipe_ext_rxpolarity0_ext              (<connected-to-pcie_ip_pipe_ext_rxpolarity0_ext>),              //                                 .rxpolarity0_ext
		.pcie_ip_pipe_ext_txcompl0_ext                 (<connected-to-pcie_ip_pipe_ext_txcompl0_ext>),                 //                                 .txcompl0_ext
		.pcie_ip_pipe_ext_txelecidle0_ext              (<connected-to-pcie_ip_pipe_ext_txelecidle0_ext>),              //                                 .txelecidle0_ext
		.pcie_ip_reconfig_busy_busy_altgxb_reconfig    (<connected-to-pcie_ip_reconfig_busy_busy_altgxb_reconfig>),    //            pcie_ip_reconfig_busy.busy_altgxb_reconfig
		.pcie_ip_reconfig_fromgxb_0_data               (<connected-to-pcie_ip_reconfig_fromgxb_0_data>),               //       pcie_ip_reconfig_fromgxb_0.data
		.pcie_ip_reconfig_togxb_data                   (<connected-to-pcie_ip_reconfig_togxb_data>),                   //           pcie_ip_reconfig_togxb.data
		.pcie_ip_refclk_export                         (<connected-to-pcie_ip_refclk_export>),                         //                   pcie_ip_refclk.export
		.pcie_ip_rx_in_rx_datain_0                     (<connected-to-pcie_ip_rx_in_rx_datain_0>),                     //                    pcie_ip_rx_in.rx_datain_0
		.pcie_ip_test_in_test_in                       (<connected-to-pcie_ip_test_in_test_in>),                       //                  pcie_ip_test_in.test_in
		.pcie_ip_tx_out_tx_dataout_0                   (<connected-to-pcie_ip_tx_out_tx_dataout_0>),                   //                   pcie_ip_tx_out.tx_dataout_0
		.pcie_rst_n_reset_n                            (<connected-to-pcie_rst_n_reset_n>),                            //                       pcie_rst_n.reset_n
		.pio_size_external_connection_export           (<connected-to-pio_size_external_connection_export>),           //     pio_size_external_connection.export
		.reset_reset_n                                 (<connected-to-reset_reset_n>),                                 //                            reset.reset_n
		.sdram_addr                                    (<connected-to-sdram_addr>),                                    //                            sdram.addr
		.sdram_ba                                      (<connected-to-sdram_ba>),                                      //                                 .ba
		.sdram_cas_n                                   (<connected-to-sdram_cas_n>),                                   //                                 .cas_n
		.sdram_cke                                     (<connected-to-sdram_cke>),                                     //                                 .cke
		.sdram_cs_n                                    (<connected-to-sdram_cs_n>),                                    //                                 .cs_n
		.sdram_dq                                      (<connected-to-sdram_dq>),                                      //                                 .dq
		.sdram_dqm                                     (<connected-to-sdram_dqm>),                                     //                                 .dqm
		.sdram_ras_n                                   (<connected-to-sdram_ras_n>),                                   //                                 .ras_n
		.sdram_we_n                                    (<connected-to-sdram_we_n>),                                    //                                 .we_n
		.width_external_connection_export              (<connected-to-width_external_connection_export>),              //        width_external_connection.export
		.height_external_connection_export             (<connected-to-height_external_connection_export>)              //       height_external_connection.export
	);

