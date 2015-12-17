	component de2i_150_qsys is
		port (
			altpll_sdram_clk                              : out   std_logic;                                        -- clk
			button_external_connection_export             : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			chip_sel_export                               : out   std_logic;                                        -- export
			clk_clk                                       : in    std_logic                     := 'X';             -- clk
			flash_ssram_tri_state_bridge_out_ssram1_cs_n  : out   std_logic_vector(0 downto 0);                     -- ssram1_cs_n
			flash_ssram_tri_state_bridge_out_ssram_adsc_n : out   std_logic_vector(0 downto 0);                     -- ssram_adsc_n
			flash_ssram_tri_state_bridge_out_ssram_we_n   : out   std_logic_vector(0 downto 0);                     -- ssram_we_n
			flash_ssram_tri_state_bridge_out_ssram_oe_n   : out   std_logic_vector(0 downto 0);                     -- ssram_oe_n
			flash_ssram_tri_state_bridge_out_fs_data      : inout std_logic_vector(31 downto 0) := (others => 'X'); -- fs_data
			flash_ssram_tri_state_bridge_out_ssram_be_n   : out   std_logic_vector(3 downto 0);                     -- ssram_be_n
			flash_ssram_tri_state_bridge_out_ssram0_cs_n  : out   std_logic_vector(0 downto 0);                     -- ssram0_cs_n
			flash_ssram_tri_state_bridge_out_fs_addr      : out   std_logic_vector(21 downto 0);                    -- fs_addr
			led_external_connection_export                : out   std_logic_vector(3 downto 0);                     -- export
			mem_master_control_fixed_location             : in    std_logic                     := 'X';             -- fixed_location
			mem_master_control_read_base                  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- read_base
			mem_master_control_read_length                : in    std_logic_vector(31 downto 0) := (others => 'X'); -- read_length
			mem_master_control_go                         : in    std_logic                     := 'X';             -- go
			mem_master_control_done                       : out   std_logic;                                        -- done
			mem_master_control_early_done                 : out   std_logic;                                        -- early_done
			mem_master_user_read_buffer                   : in    std_logic                     := 'X';             -- read_buffer
			mem_master_user_buffer_output_data            : out   std_logic_vector(31 downto 0);                    -- buffer_output_data
			mem_master_user_data_available                : out   std_logic;                                        -- data_available
			pcie_clk_clk                                  : out   std_logic;                                        -- clk
			pcie_ip_clocks_sim_clk250_export              : out   std_logic;                                        -- clk250_export
			pcie_ip_clocks_sim_clk500_export              : out   std_logic;                                        -- clk500_export
			pcie_ip_clocks_sim_clk125_export              : out   std_logic;                                        -- clk125_export
			pcie_ip_pcie_rstn_export                      : in    std_logic                     := 'X';             -- export
			pcie_ip_pipe_ext_pipe_mode                    : in    std_logic                     := 'X';             -- pipe_mode
			pcie_ip_pipe_ext_phystatus_ext                : in    std_logic                     := 'X';             -- phystatus_ext
			pcie_ip_pipe_ext_rate_ext                     : out   std_logic;                                        -- rate_ext
			pcie_ip_pipe_ext_powerdown_ext                : out   std_logic_vector(1 downto 0);                     -- powerdown_ext
			pcie_ip_pipe_ext_txdetectrx_ext               : out   std_logic;                                        -- txdetectrx_ext
			pcie_ip_pipe_ext_rxelecidle0_ext              : in    std_logic                     := 'X';             -- rxelecidle0_ext
			pcie_ip_pipe_ext_rxdata0_ext                  : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- rxdata0_ext
			pcie_ip_pipe_ext_rxstatus0_ext                : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- rxstatus0_ext
			pcie_ip_pipe_ext_rxvalid0_ext                 : in    std_logic                     := 'X';             -- rxvalid0_ext
			pcie_ip_pipe_ext_rxdatak0_ext                 : in    std_logic                     := 'X';             -- rxdatak0_ext
			pcie_ip_pipe_ext_txdata0_ext                  : out   std_logic_vector(7 downto 0);                     -- txdata0_ext
			pcie_ip_pipe_ext_txdatak0_ext                 : out   std_logic;                                        -- txdatak0_ext
			pcie_ip_pipe_ext_rxpolarity0_ext              : out   std_logic;                                        -- rxpolarity0_ext
			pcie_ip_pipe_ext_txcompl0_ext                 : out   std_logic;                                        -- txcompl0_ext
			pcie_ip_pipe_ext_txelecidle0_ext              : out   std_logic;                                        -- txelecidle0_ext
			pcie_ip_reconfig_busy_busy_altgxb_reconfig    : in    std_logic                     := 'X';             -- busy_altgxb_reconfig
			pcie_ip_reconfig_fromgxb_0_data               : out   std_logic_vector(4 downto 0);                     -- data
			pcie_ip_reconfig_togxb_data                   : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- data
			pcie_ip_refclk_export                         : in    std_logic                     := 'X';             -- export
			pcie_ip_rx_in_rx_datain_0                     : in    std_logic                     := 'X';             -- rx_datain_0
			pcie_ip_test_in_test_in                       : in    std_logic_vector(39 downto 0) := (others => 'X'); -- test_in
			pcie_ip_tx_out_tx_dataout_0                   : out   std_logic;                                        -- tx_dataout_0
			pcie_rst_n_reset_n                            : out   std_logic;                                        -- reset_n
			pio_size_external_connection_export           : out   std_logic_vector(31 downto 0);                    -- export
			reset_reset_n                                 : in    std_logic                     := 'X';             -- reset_n
			sdram_addr                                    : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_ba                                      : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n                                   : out   std_logic;                                        -- cas_n
			sdram_cke                                     : out   std_logic;                                        -- cke
			sdram_cs_n                                    : out   std_logic;                                        -- cs_n
			sdram_dq                                      : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_dqm                                     : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_ras_n                                   : out   std_logic;                                        -- ras_n
			sdram_we_n                                    : out   std_logic;                                        -- we_n
			width_external_connection_export              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			height_external_connection_export             : in    std_logic_vector(31 downto 0) := (others => 'X')  -- export
		);
	end component de2i_150_qsys;

	u0 : component de2i_150_qsys
		port map (
			altpll_sdram_clk                              => CONNECTED_TO_altpll_sdram_clk,                              --                     altpll_sdram.clk
			button_external_connection_export             => CONNECTED_TO_button_external_connection_export,             --       button_external_connection.export
			chip_sel_export                               => CONNECTED_TO_chip_sel_export,                               --                         chip_sel.export
			clk_clk                                       => CONNECTED_TO_clk_clk,                                       --                              clk.clk
			flash_ssram_tri_state_bridge_out_ssram1_cs_n  => CONNECTED_TO_flash_ssram_tri_state_bridge_out_ssram1_cs_n,  -- flash_ssram_tri_state_bridge_out.ssram1_cs_n
			flash_ssram_tri_state_bridge_out_ssram_adsc_n => CONNECTED_TO_flash_ssram_tri_state_bridge_out_ssram_adsc_n, --                                 .ssram_adsc_n
			flash_ssram_tri_state_bridge_out_ssram_we_n   => CONNECTED_TO_flash_ssram_tri_state_bridge_out_ssram_we_n,   --                                 .ssram_we_n
			flash_ssram_tri_state_bridge_out_ssram_oe_n   => CONNECTED_TO_flash_ssram_tri_state_bridge_out_ssram_oe_n,   --                                 .ssram_oe_n
			flash_ssram_tri_state_bridge_out_fs_data      => CONNECTED_TO_flash_ssram_tri_state_bridge_out_fs_data,      --                                 .fs_data
			flash_ssram_tri_state_bridge_out_ssram_be_n   => CONNECTED_TO_flash_ssram_tri_state_bridge_out_ssram_be_n,   --                                 .ssram_be_n
			flash_ssram_tri_state_bridge_out_ssram0_cs_n  => CONNECTED_TO_flash_ssram_tri_state_bridge_out_ssram0_cs_n,  --                                 .ssram0_cs_n
			flash_ssram_tri_state_bridge_out_fs_addr      => CONNECTED_TO_flash_ssram_tri_state_bridge_out_fs_addr,      --                                 .fs_addr
			led_external_connection_export                => CONNECTED_TO_led_external_connection_export,                --          led_external_connection.export
			mem_master_control_fixed_location             => CONNECTED_TO_mem_master_control_fixed_location,             --               mem_master_control.fixed_location
			mem_master_control_read_base                  => CONNECTED_TO_mem_master_control_read_base,                  --                                 .read_base
			mem_master_control_read_length                => CONNECTED_TO_mem_master_control_read_length,                --                                 .read_length
			mem_master_control_go                         => CONNECTED_TO_mem_master_control_go,                         --                                 .go
			mem_master_control_done                       => CONNECTED_TO_mem_master_control_done,                       --                                 .done
			mem_master_control_early_done                 => CONNECTED_TO_mem_master_control_early_done,                 --                                 .early_done
			mem_master_user_read_buffer                   => CONNECTED_TO_mem_master_user_read_buffer,                   --                  mem_master_user.read_buffer
			mem_master_user_buffer_output_data            => CONNECTED_TO_mem_master_user_buffer_output_data,            --                                 .buffer_output_data
			mem_master_user_data_available                => CONNECTED_TO_mem_master_user_data_available,                --                                 .data_available
			pcie_clk_clk                                  => CONNECTED_TO_pcie_clk_clk,                                  --                         pcie_clk.clk
			pcie_ip_clocks_sim_clk250_export              => CONNECTED_TO_pcie_ip_clocks_sim_clk250_export,              --               pcie_ip_clocks_sim.clk250_export
			pcie_ip_clocks_sim_clk500_export              => CONNECTED_TO_pcie_ip_clocks_sim_clk500_export,              --                                 .clk500_export
			pcie_ip_clocks_sim_clk125_export              => CONNECTED_TO_pcie_ip_clocks_sim_clk125_export,              --                                 .clk125_export
			pcie_ip_pcie_rstn_export                      => CONNECTED_TO_pcie_ip_pcie_rstn_export,                      --                pcie_ip_pcie_rstn.export
			pcie_ip_pipe_ext_pipe_mode                    => CONNECTED_TO_pcie_ip_pipe_ext_pipe_mode,                    --                 pcie_ip_pipe_ext.pipe_mode
			pcie_ip_pipe_ext_phystatus_ext                => CONNECTED_TO_pcie_ip_pipe_ext_phystatus_ext,                --                                 .phystatus_ext
			pcie_ip_pipe_ext_rate_ext                     => CONNECTED_TO_pcie_ip_pipe_ext_rate_ext,                     --                                 .rate_ext
			pcie_ip_pipe_ext_powerdown_ext                => CONNECTED_TO_pcie_ip_pipe_ext_powerdown_ext,                --                                 .powerdown_ext
			pcie_ip_pipe_ext_txdetectrx_ext               => CONNECTED_TO_pcie_ip_pipe_ext_txdetectrx_ext,               --                                 .txdetectrx_ext
			pcie_ip_pipe_ext_rxelecidle0_ext              => CONNECTED_TO_pcie_ip_pipe_ext_rxelecidle0_ext,              --                                 .rxelecidle0_ext
			pcie_ip_pipe_ext_rxdata0_ext                  => CONNECTED_TO_pcie_ip_pipe_ext_rxdata0_ext,                  --                                 .rxdata0_ext
			pcie_ip_pipe_ext_rxstatus0_ext                => CONNECTED_TO_pcie_ip_pipe_ext_rxstatus0_ext,                --                                 .rxstatus0_ext
			pcie_ip_pipe_ext_rxvalid0_ext                 => CONNECTED_TO_pcie_ip_pipe_ext_rxvalid0_ext,                 --                                 .rxvalid0_ext
			pcie_ip_pipe_ext_rxdatak0_ext                 => CONNECTED_TO_pcie_ip_pipe_ext_rxdatak0_ext,                 --                                 .rxdatak0_ext
			pcie_ip_pipe_ext_txdata0_ext                  => CONNECTED_TO_pcie_ip_pipe_ext_txdata0_ext,                  --                                 .txdata0_ext
			pcie_ip_pipe_ext_txdatak0_ext                 => CONNECTED_TO_pcie_ip_pipe_ext_txdatak0_ext,                 --                                 .txdatak0_ext
			pcie_ip_pipe_ext_rxpolarity0_ext              => CONNECTED_TO_pcie_ip_pipe_ext_rxpolarity0_ext,              --                                 .rxpolarity0_ext
			pcie_ip_pipe_ext_txcompl0_ext                 => CONNECTED_TO_pcie_ip_pipe_ext_txcompl0_ext,                 --                                 .txcompl0_ext
			pcie_ip_pipe_ext_txelecidle0_ext              => CONNECTED_TO_pcie_ip_pipe_ext_txelecidle0_ext,              --                                 .txelecidle0_ext
			pcie_ip_reconfig_busy_busy_altgxb_reconfig    => CONNECTED_TO_pcie_ip_reconfig_busy_busy_altgxb_reconfig,    --            pcie_ip_reconfig_busy.busy_altgxb_reconfig
			pcie_ip_reconfig_fromgxb_0_data               => CONNECTED_TO_pcie_ip_reconfig_fromgxb_0_data,               --       pcie_ip_reconfig_fromgxb_0.data
			pcie_ip_reconfig_togxb_data                   => CONNECTED_TO_pcie_ip_reconfig_togxb_data,                   --           pcie_ip_reconfig_togxb.data
			pcie_ip_refclk_export                         => CONNECTED_TO_pcie_ip_refclk_export,                         --                   pcie_ip_refclk.export
			pcie_ip_rx_in_rx_datain_0                     => CONNECTED_TO_pcie_ip_rx_in_rx_datain_0,                     --                    pcie_ip_rx_in.rx_datain_0
			pcie_ip_test_in_test_in                       => CONNECTED_TO_pcie_ip_test_in_test_in,                       --                  pcie_ip_test_in.test_in
			pcie_ip_tx_out_tx_dataout_0                   => CONNECTED_TO_pcie_ip_tx_out_tx_dataout_0,                   --                   pcie_ip_tx_out.tx_dataout_0
			pcie_rst_n_reset_n                            => CONNECTED_TO_pcie_rst_n_reset_n,                            --                       pcie_rst_n.reset_n
			pio_size_external_connection_export           => CONNECTED_TO_pio_size_external_connection_export,           --     pio_size_external_connection.export
			reset_reset_n                                 => CONNECTED_TO_reset_reset_n,                                 --                            reset.reset_n
			sdram_addr                                    => CONNECTED_TO_sdram_addr,                                    --                            sdram.addr
			sdram_ba                                      => CONNECTED_TO_sdram_ba,                                      --                                 .ba
			sdram_cas_n                                   => CONNECTED_TO_sdram_cas_n,                                   --                                 .cas_n
			sdram_cke                                     => CONNECTED_TO_sdram_cke,                                     --                                 .cke
			sdram_cs_n                                    => CONNECTED_TO_sdram_cs_n,                                    --                                 .cs_n
			sdram_dq                                      => CONNECTED_TO_sdram_dq,                                      --                                 .dq
			sdram_dqm                                     => CONNECTED_TO_sdram_dqm,                                     --                                 .dqm
			sdram_ras_n                                   => CONNECTED_TO_sdram_ras_n,                                   --                                 .ras_n
			sdram_we_n                                    => CONNECTED_TO_sdram_we_n,                                    --                                 .we_n
			width_external_connection_export              => CONNECTED_TO_width_external_connection_export,              --        width_external_connection.export
			height_external_connection_export             => CONNECTED_TO_height_external_connection_export              --       height_external_connection.export
		);

