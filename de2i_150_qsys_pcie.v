// ============================================================================
// Copyright (c) 2012 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Wed Jun 27 19:19:53 2012
// ============================================================================

`define ENABLE_PCIE

module de2i_150_qsys_pcie(

							///////////CLOCK2/////////////
							CLOCK2_50,

							/////////CLOCK3/////////
							CLOCK3_50,

							/////////CLOCK/////////
							CLOCK_50,

							/////////DRAM/////////
							DRAM_ADDR,
							DRAM_BA,
							DRAM_CAS_N,
							DRAM_CKE,
							DRAM_CLK,
							DRAM_CS_N,
							DRAM_DQ,
							DRAM_DQM,
							DRAM_RAS_N,
							DRAM_WE_N,

							/////////EEP/////////
							EEP_I2C_SCLK,
							EEP_I2C_SDAT,

							/////////ENET/////////
							ENET_GTX_CLK,
							ENET_INT_N,
							ENET_LINK100,
							ENET_MDC,
							ENET_MDIO,
							ENET_RST_N,
							ENET_RX_CLK,
							ENET_RX_COL,
							ENET_RX_CRS,
							ENET_RX_DATA,
							ENET_RX_DV,
							ENET_RX_ER,
							ENET_TX_CLK,
							ENET_TX_DATA,
							ENET_TX_EN,
							ENET_TX_ER,

							/////////FAN/////////
							FAN_CTRL,

							/////////FL/////////
							FL_CE_N,
							FL_OE_N,
							FL_RY,
							FL_WE_N,
							FL_WP_N,
							FL_RESET_N,
							/////////FS/////////
							FS_DQ,
							FS_ADDR,
							/////////GPIO/////////
							GPIO,

							/////////G/////////
							G_SENSOR_INT1,
							G_SENSOR_SCLK,
							G_SENSOR_SDAT,

							/////////HEX/////////
							HEX0,
							HEX1,
							HEX2,
							HEX3,
							HEX4,
							HEX5,
							HEX6,
							HEX7,

							/////////HSMC/////////
							HSMC_CLKIN0,
							HSMC_CLKIN_N1,
							HSMC_CLKIN_N2,
							HSMC_CLKIN_P1,
							HSMC_CLKIN_P2,
							HSMC_CLKOUT0,
							HSMC_CLKOUT_N1,
							HSMC_CLKOUT_N2,
							HSMC_CLKOUT_P1,
							HSMC_CLKOUT_P2,
							HSMC_D,
							HSMC_I2C_SCLK,
							HSMC_I2C_SDAT,
							HSMC_RX_D_N,
							HSMC_RX_D_P,
							HSMC_TX_D_N,
							HSMC_TX_D_P,

							/////////I2C/////////
							I2C_SCLK,
							I2C_SDAT,

							/////////IRDA/////////
							IRDA_RXD,

							/////////KEY/////////
							KEY,

							/////////LCD/////////
							LCD_DATA,
							LCD_EN,
							LCD_ON,
							LCD_RS,
							LCD_RW,

							/////////LEDG/////////
							LEDG,

							/////////LEDR/////////
							LEDR,

							/////////PCIE/////////
`ifdef ENABLE_PCIE

							PCIE_PERST_N,
							PCIE_REFCLK_P,
							PCIE_RX_P,
							PCIE_TX_P,
							PCIE_WAKE_N,
`endif 
							/////////SD/////////
							SD_CLK,
							SD_CMD,
							SD_DAT,
							SD_WP_N,

							/////////SMA/////////
							SMA_CLKIN,
							SMA_CLKOUT,

							/////////SSRAM/////////
							SSRAM_ADSC_N,
							SSRAM_ADSP_N,
							SSRAM_ADV_N,
							SSRAM_BE,
							SSRAM_CLK,
							SSRAM_GW_N,
							SSRAM_OE_N,
							SSRAM_WE_N,
							SSRAM0_CE_N,
							SSRAM1_CE_N,							
							/////////SW/////////
							SW,

							/////////TD/////////
							TD_CLK27,
							TD_DATA,
							TD_HS,
							TD_RESET_N,
							TD_VS,

							/////////UART/////////
							UART_CTS,
							UART_RTS,
							UART_RXD,
							UART_TXD,

							/////////VGA/////////
							VGA_B,
							VGA_BLANK_N,
							VGA_CLK,
							VGA_G,
							VGA_HS,
							VGA_R,
							VGA_SYNC_N,
							VGA_VS,
);

//=======================================================
//  PORT declarations
//=======================================================

							///////////CLOCK2/////////////

input                                              CLOCK2_50;

///////// CLOCK3 /////////
input                                              CLOCK3_50;

///////// CLOCK /////////
input                                              CLOCK_50;

///////// DRAM /////////
output                        [12:0]               DRAM_ADDR;
output                        [1:0]                DRAM_BA;
output                                             DRAM_CAS_N;
output                                             DRAM_CKE;
output                                             DRAM_CLK;
output                                             DRAM_CS_N;
inout                         [31:0]               DRAM_DQ;
output                        [3:0]                DRAM_DQM;
output                                             DRAM_RAS_N;
output                                             DRAM_WE_N;

///////// EEP /////////
output                                             EEP_I2C_SCLK;
inout                                              EEP_I2C_SDAT;

///////// ENET /////////
output                                             ENET_GTX_CLK;
input                                              ENET_INT_N;
input                                              ENET_LINK100;
output                                             ENET_MDC;
inout                                              ENET_MDIO;
output                                             ENET_RST_N;
input                                              ENET_RX_CLK;
input                                              ENET_RX_COL;
input                                              ENET_RX_CRS;
input                         [3:0]                ENET_RX_DATA;
input                                              ENET_RX_DV;
input                                              ENET_RX_ER;
input                                              ENET_TX_CLK;
output                        [3:0]                ENET_TX_DATA;
output                                             ENET_TX_EN;
output                                             ENET_TX_ER;

///////// FAN /////////
inout                                              FAN_CTRL;

///////// FL /////////
output                                             FL_CE_N;
output                                             FL_OE_N;
input                                              FL_RY;
output                                             FL_WE_N;
output                                             FL_WP_N;
output                                             FL_RESET_N;
///////// FS /////////
inout                         [31:0]               FS_DQ;
output                        [26:0]               FS_ADDR;
///////// GPIO /////////
inout                         [35:0]               GPIO;

///////// G /////////
input                                              G_SENSOR_INT1;
output                                             G_SENSOR_SCLK;
inout                                              G_SENSOR_SDAT;

///////// HEX /////////
output                        [6:0]                HEX0;
output                        [6:0]                HEX1;
output                        [6:0]                HEX2;
output                        [6:0]                HEX3;
output                        [6:0]                HEX4;
output                        [6:0]                HEX5;
output                        [6:0]                HEX6;
output                        [6:0]                HEX7;

///////// HSMC /////////
input                                              HSMC_CLKIN0;
input                                              HSMC_CLKIN_N1;
input                                              HSMC_CLKIN_N2;
input                                              HSMC_CLKIN_P1;
input                                              HSMC_CLKIN_P2;
output                                             HSMC_CLKOUT0;
inout                                              HSMC_CLKOUT_N1;
inout                                              HSMC_CLKOUT_N2;
inout                                              HSMC_CLKOUT_P1;
inout                                              HSMC_CLKOUT_P2;
inout                         [3:0]                HSMC_D;
output                                             HSMC_I2C_SCLK;
inout                                              HSMC_I2C_SDAT;
inout                         [16:0]               HSMC_RX_D_N;
inout                         [16:0]               HSMC_RX_D_P;
inout                         [16:0]               HSMC_TX_D_N;
inout                         [16:0]               HSMC_TX_D_P;

///////// I2C /////////
output                                             I2C_SCLK;
inout                                              I2C_SDAT;

///////// IRDA /////////
input                                              IRDA_RXD;

///////// KEY /////////
input                         [3:0]                KEY;

///////// LCD /////////
inout                         [7:0]                LCD_DATA;
output                                             LCD_EN;
output                                             LCD_ON;
output                                             LCD_RS;
output                                             LCD_RW;

///////// LEDG /////////
output                        [8:0]                LEDG;

///////// LEDR /////////
output                        [17:0]               LEDR;

///////// PCIE /////////
`ifdef ENABLE_PCIE
input                                              PCIE_PERST_N;
input                                              PCIE_REFCLK_P;
input                         [0:0]                PCIE_RX_P;
output                        [0:0]                PCIE_TX_P;
output                                             PCIE_WAKE_N;
`endif 
///////// SD /////////
output                                             SD_CLK;
inout                                              SD_CMD;
inout                         [3:0]                SD_DAT;
input                                              SD_WP_N;

///////// SMA /////////
input                                              SMA_CLKIN;
output                                             SMA_CLKOUT;

///////// SSRAM /////////
output                                             SSRAM_ADSC_N;
output                                             SSRAM_ADSP_N;             //
output                                             SSRAM_ADV_N;              //
output                         [3:0]                SSRAM_BE;
output                                             SSRAM_CLK;                //
output                                             SSRAM_GW_N;
output                                             SSRAM_OE_N;
output                                             SSRAM_WE_N;
output                                             SSRAM0_CE_N;
output                                             SSRAM1_CE_N;

///////// SW /////////
input                         [17:0]               SW;

///////// TD /////////
input                                              TD_CLK27;
input                         [7:0]                TD_DATA;
input                                              TD_HS;
output                                             TD_RESET_N;
input                                              TD_VS;

///////// UART /////////
input                                             UART_CTS;
output                                              UART_RTS;
input                                              UART_RXD;
output                                             UART_TXD;

///////// VGA /////////
output                        [7:0]                VGA_B;
output                                             VGA_BLANK_N;
output                                             VGA_CLK;
output                        [7:0]                VGA_G;
output                                             VGA_HS;
output                        [7:0]                VGA_R;
output                                             VGA_SYNC_N;
output                                             VGA_VS;

//=======================================================
//  REG/WIRE declarations
//=======================================================



wire reset_n;

wire pcie_rst_n;
wire pcie_clk;
wire[31:0] image_size;

wire		mem_master_control_fixed_location;
wire	[31:0]	mem_master_control_read_base;
wire	[31:0]	mem_master_control_read_length;
wire		mem_master_control_go;
wire		mem_master_control_done;
wire		mem_master_control_early_done;
wire  mem_master_user_read_buffer;
wire	[31:0]	mem_master_user_buffer_output_data;
wire		mem_master_user_data_available;
wire  [31:0] reader_length_left;
wire [35:0] GPIO;

wire [31:0] pxl_width;
wire [31:0] pxl_height;
wire chip_sel;




//=======================================================
//  Structural coding
//=======================================================

assign reset_n = 1'b1;


    de2i_150_qsys u0 (
        .clk_clk                                    (CLOCK_50),                                    //                        clk.clk
        .reset_reset_n                              (reset_n),                              //                      reset.reset_n
        .pcie_ip_refclk_export                      (PCIE_REFCLK_P),                      //             pcie_ip_refclk.export
        .pcie_ip_pcie_rstn_export                   (PCIE_PERST_N),                   //          pcie_ip_pcie_rstn.export
        .pcie_ip_rx_in_rx_datain_0                  (PCIE_RX_P[0]),                  //              pcie_ip_rx_in.rx_datain_0
        .pcie_ip_tx_out_tx_dataout_0                (PCIE_TX_P[0]),                //             pcie_ip_tx_out.tx_dataout_0
        .led_external_connection_export             (LEDG[3:0]),             //    led_external_connection.export
        .button_external_connection_export          (KEY),           // button_external_connection.export
		  .flash_ssram_tri_state_bridge_out_ssram_adsc_n              (SSRAM_ADSC_N), //                           .ssram_adsc_n
		  .flash_ssram_tri_state_bridge_out_ssram_be_n                (SSRAM_BE),                  // flash_ssram_tri_state_bridge_out.ssram_be
		  .flash_ssram_tri_state_bridge_out_ssram_we_n                (SSRAM_WE_N),                //                                 .ssram_we_n
		  .flash_ssram_tri_state_bridge_out_ssram_oe_n                (SSRAM_OE_N),                //                                 .ssram_oe_n
		  .flash_ssram_tri_state_bridge_out_fs_data                   (FS_DQ),                   //                                 .fs_data
		  .flash_ssram_tri_state_bridge_out_fs_addr                   (FS_ADDR),                    //                                 .fs_addr
		  .flash_ssram_tri_state_bridge_out_ssram0_cs_n               (SSRAM0_CE_N),
		  .flash_ssram_tri_state_bridge_out_ssram1_cs_n               (SSRAM1_CE_N),
		  
		  .pcie_clk_clk                                               (pcie_clk),
		  .pcie_rst_n_reset_n                                         (pcie_rst_n),
		  .pio_size_external_connection_export                        (image_size),
		  .mem_master_control_fixed_location                          (mem_master_control_fixed_location),
      .mem_master_control_read_base                               (mem_master_control_read_base),
      .mem_master_control_read_length                             (mem_master_control_read_length),
      .mem_master_control_go                                      (mem_master_control_go),
      .mem_master_control_done                                    (mem_master_control_done),
      .mem_master_control_early_done                              (mem_master_control_early_done),
      .mem_master_user_read_buffer                                (mem_master_user_read_buffer),
      .mem_master_user_buffer_output_data                         (mem_master_user_buffer_output_data),
      .mem_master_user_data_available                             (mem_master_user_data_available),
      
      .altpll_sdram_clk                           (DRAM_CLK),
      .sdram_addr                                 (DRAM_ADDR),                                 //                       sdram.addr
      .sdram_ba                                   (DRAM_BA),                                   //                            .ba
      .sdram_cas_n                                (DRAM_CAS_N),                                //                            .cas_n
      .sdram_cke                                  (DRAM_CKE),                                  //                            .cke
      .sdram_cs_n                                 (DRAM_CS_N),                                 //                            .cs_n
      .sdram_dq                                   (DRAM_DQ),                                   //                            .dq
      .sdram_dqm                                  (DRAM_DQM),                                  //                            .dqm
      .sdram_ras_n                                (DRAM_RAS_N),                                //                            .ras_n
      .sdram_we_n                                 (DRAM_WE_N),                                  //                            .we_n
  
      .chip_sel_export                            (chip_sel),
      .width_external_connection_export           (pxl_width),
      .height_external_connection_export          (pxl_height)
    );

assign PCIE_WAKE_N = 1'b0;	




wire hb_50;
heart_beat	heart_beat_clk50(
	.clk(CLOCK_50),
	.led(hb_50)
);

//assign LEDR[0] = hb_50;

endless_reader reader(

  .clk(pcie_clk),
  .rst_n(pcie_rst_n),

	.image_size(image_size),
	.mem_master_control_fixed_location(mem_master_control_fixed_location),
	.mem_master_control_read_base(mem_master_control_read_base),
	.mem_master_control_read_length(mem_master_control_read_length),
	.mem_master_control_go(mem_master_control_go),
	.mem_master_control_done(mem_master_control_done),
	.mem_master_control_early_done(mem_master_control_early_done),
	.mem_master_user_read_buffer(mem_master_user_read_buffer),
	.mem_master_user_buffer_output_data(mem_master_user_buffer_output_data),
	.mem_master_user_data_available(mem_master_user_data_available),
  .length_left(reader_length_left),
  .chip_sel(chip_sel),
//  .force_read(SW[4]),
  .rdclk(pixel_fifo_clk),
  .out_pix_data(pixel_fifo_data_ext),
  .rdempty(pixel_fifo_empty_ext),
  .rdreq(pixel_fifo_req)
  
);

assign FAN_CTRL = 1'b0;


//assign LEDR[17:0] = reader_length_left[17:0];

SEG7_LUT_8 segs(HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7, {pxl_width[15:0],pxl_height[15:0]});
assign LEDG[7] = mem_master_user_data_available;


//===========================

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire sys_clk;
wire feeder_clk;
wire sys_rst_n;
wire locked;

wire scdt_to_overlay;
wire odck_to_overlay;
wire vsync_to_overlay;
wire hsync_to_overlay;
wire de_to_overlay;
wire[7:0] pixel_r_to_overlay;
wire[7:0] pixel_g_to_overlay;
wire[7:0] pixel_b_to_overlay;

wire[31:0] pixel_fifo_data;
wire pixel_fifo_req;
wire pixel_fifo_clk;
wire pixel_fifo_empty;

wire[31:0] pixel_fifo_data_ext;
wire[31:0] pixel_fifo_data_int;

wire pixel_fifo_empty_ext;
wire pixel_fifo_empty_int;

wire pixel_clk_o;

assign pixel_fifo_data = SW[4] ? pixel_fifo_data_int : pixel_fifo_data_ext;
assign pixel_fifo_empty = SW[4] ? pixel_fifo_empty_int : pixel_fifo_empty_ext;

wire[3:0] i2c_drive_low;
wire[2:0] unused;

assign GPIO[34] = i2c_drive_low[2] ? 1'b0 : 1'bz; //I2C master
assign GPIO[35] = i2c_drive_low[3] ? 1'b0 : 1'bz; //I2C master
//=======================================================
//  Structural coding
//=======================================================

sys_pll sys_pll_1(
    !KEY[0],//areset
    CLOCK3_50,
    sys_clk,
    feeder_clk,
    locked
);

i2c_nios i2c_nios0 (
        .clk_clk       (sys_clk),       //   clk.clk
        .reset_reset_n (sys_rst_n), // reset.reset_n
		  .p_output_export({unused,GPIO[25],i2c_drive_low}),
        .p_input_export({4'bzzzz,GPIO[35:32]}),    //  gpio.export
        .edid_scl      (GPIO[32]),
        .edid_sda       (GPIO[33])
    );


tfp401a dvi_in_1(
    .rst(sys_rst_n),

    .odck_in(GPIO[24]),
    .vsync_in(GPIO[28]),
    .hsync_in(GPIO[27]),
    .de_in(GPIO[26]),
    .pixel_r_in(GPIO[23:16]),
    .pixel_g_in(GPIO[15:8]),
    .pixel_b_in(GPIO[7:0]),

    .scdt_o(/*scdt_to_overlay*/),
    .odck_o(odck_to_overlay),
    .vsync_o(vsync_to_overlay),
    .hsync_o(hsync_to_overlay),
    .de_o(de_to_overlay),
    .pixel_r_o(pixel_r_to_overlay),
    .pixel_g_o(pixel_g_to_overlay),
    .pixel_b_o(pixel_b_to_overlay)
);

assign scdt_to_overlay = GPIO[29];

danmaku_overlay overlay_logic_1(
   .rst(sys_rst_n),

   .scdt_in(scdt_to_overlay),
   .odck_in(odck_to_overlay),
   .vsync_in(vsync_to_overlay),
   .hsync_in(hsync_to_overlay),
   .de_in(de_to_overlay),
   .pixel_r_in(pixel_r_to_overlay),
   .pixel_g_in(pixel_g_to_overlay),
   .pixel_b_in(pixel_b_to_overlay),
   .fifoData_in(pixel_fifo_data),
   .fifoRdEmpty(pixel_fifo_empty),
   .noDebug(SW[0]), 

   .pixel_clk_o(pixel_clk_o),
   .vsync_o(VGA_VS),
   .hsync_o(VGA_HS),
   .de_o(VGA_BLANK_N),
   .pixel_r_o(VGA_R),
   .pixel_g_o(VGA_G),
   .pixel_b_o(VGA_B),
   .fifoRdclk(pixel_fifo_clk),
   .fifoRdreq(pixel_fifo_req),

   .screenX(pxl_width[15:0]),
   .screenY(pxl_height[15:0]),
   .screenPxl(),
  
   .nowX(),
   .nowY(LEDR[15:0]),
   .nowPxl(),
  
   .ovf(),
   .syncWaitV(),
   
   .overlay_en(SW[2])

);

assign pxl_width[31:16] = 16'd0;
assign pxl_height[31:16] = 16'd0;

test_img_feeder feeder1(
  .rst(sys_rst_n),
  .clk(sys_clk),
  .clk_feeder(feeder_clk),

  .fifoData_out(pixel_fifo_data_int),
  .fifoRdclk(pixel_fifo_clk),
  .fifoRdreq(pixel_fifo_req),
  .fifoRdempty(pixel_fifo_empty_int),
  
  .pause(SW[1])
);

led led_sysclk(
    .clk(sys_clk),
    .rst(sys_rst_n),
    .status_led(LEDG[5])
);
led led_pixclk(
    .clk(odck_to_overlay),
    .rst(sys_rst_n),
    .status_led(LEDG[4])
);

assign sys_rst_n = locked;

//assign GPIO[25] = 1'b1; //hpd

assign LEDG[6] = scdt_to_overlay;

// assign VGA_VS = vsync_to_overlay;
// assign VGA_HS = hsync_to_overlay;
// assign VGA_BLANK_N = de_to_overlay;
assign VGA_SYNC_N = 1'b1;
assign VGA_CLK = ~pixel_clk_o;
// assign VGA_R = pixel_r_to_overlay;
// assign VGA_G = pixel_g_to_overlay;
// assign VGA_B = pixel_b_to_overlay;


//===========================

endmodule
