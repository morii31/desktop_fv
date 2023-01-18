`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/28 17:11:04
// Design Name: 
// Module Name: my_gtwizard1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module my_gtwizard1(
    input wire sysclk_in,
    input wire q0_clk1_gtrefclk_pad_n_in,
    input wire q0_clk1_gtrefclk_pad_p_in,
    //input wire soft_reset_tx_in,
    //input wire soft_reset_rx_in,
    output wire gt0_cplllock_out,
    input wire gt0_cpllreset_in,
    input wire gt0_gttxreset_in,
    input wire gt0_gtrxreset_in,
    output wire gt0_rxresetdone_out,
    output wire gt0_txresetdone_out,
    input wire gt0_rxuserrdy_in,
    input wire gt0_txuserrdy_in,
    input wire [3:0] gt0_txcharisk_in,
    input wire [31:0] gt0_txdata_in,
    output wire [3:0] gt0_rxcharisk_out,
    output wire [31:0] gt0_rxdata_out,

    input wire gt0_gtxrxp_in,
    input wire gt0_gtxrxn_in,
    output wire gt0_gtxtxn_out,
    output wire gt0_gtxtxp_out
);
wire dont_reset_on_data_error_in = 1'b1;
wire gt0_data_valid_in = 1'b1;

gtwizard_0  gtwizard_0_i
    (
     .soft_reset_tx_in(soft_reset_tx_in), // input wire soft_reset_tx_in
     .soft_reset_rx_in(soft_reset_rx_in), // input wire soft_reset_rx_in
     .dont_reset_on_data_error_in(dont_reset_on_data_error_in), // input wire dont_reset_on_data_error_in
    .q0_clk1_gtrefclk_pad_n_in(q0_clk1_gtrefclk_pad_n_in), // input wire q0_clk1_gtrefclk_pad_n_in
    .q0_clk1_gtrefclk_pad_p_in(q0_clk1_gtrefclk_pad_p_in), // input wire q0_clk1_gtrefclk_pad_p_in
     .gt0_tx_fsm_reset_done_out(gt0_tx_fsm_reset_done_out), // output wire gt0_tx_fsm_reset_done_out
     .gt0_rx_fsm_reset_done_out(gt0_rx_fsm_reset_done_out), // output wire gt0_rx_fsm_reset_done_out
     .gt0_data_valid_in(gt0_data_valid_in), // input wire gt0_data_valid_in
 
    .gt0_txusrclk_out(gt0_txusrclk_out), // output wire gt0_txusrclk_out
    .gt0_txusrclk2_out(gt0_txusrclk2_out), // output wire gt0_txusrclk2_out
    .gt0_rxusrclk_out(gt0_rxusrclk_out), // output wire gt0_rxusrclk_out
    .gt0_rxusrclk2_out(gt0_rxusrclk2_out), // output wire gt0_rxusrclk2_out
    //_________________________________________________________________________
    //GT0  (X0Y0)
    //____________________________CHANNEL PORTS________________________________
    //------------------------------- CPLL Ports -------------------------------
        .gt0_cpllfbclklost_out          (gt0_cpllfbclklost_out), // output wire gt0_cpllfbclklost_out
        .gt0_cplllock_out               (gt0_cplllock_out), // output wire gt0_cplllock_out
        .gt0_cpllreset_in               (gt0_cpllreset_in), // input wire gt0_cpllreset_in
    //-------------------------- Channel - DRP Ports  --------------------------
        .gt0_drpaddr_in                 (gt0_drpaddr_in), // input wire [8:0] gt0_drpaddr_in
        .gt0_drpdi_in                   (gt0_drpdi_in), // input wire [15:0] gt0_drpdi_in
        .gt0_drpdo_out                  (gt0_drpdo_out), // output wire [15:0] gt0_drpdo_out
        .gt0_drpen_in                   (gt0_drpen_in), // input wire gt0_drpen_in
        .gt0_drprdy_out                 (gt0_drprdy_out), // output wire gt0_drprdy_out
        .gt0_drpwe_in                   (gt0_drpwe_in), // input wire gt0_drpwe_in
    //------------------------- Digital Monitor Ports --------------------------
        .gt0_dmonitorout_out            (gt0_dmonitorout_out), // output wire [7:0] gt0_dmonitorout_out
    //----------------------------- Loopback Ports -----------------------------
        .gt0_loopback_in                (gt0_loopback_in), // input wire [2:0] gt0_loopback_in
    //---------------------------- Power-Down Ports ----------------------------
        .gt0_rxpd_in                    (gt0_rxpd_in), // input wire [1:0] gt0_rxpd_in
        .gt0_txpd_in                    (gt0_txpd_in), // input wire [1:0] gt0_txpd_in
    //------------------- RX Initialization and Reset Ports --------------------
        .gt0_eyescanreset_in            (gt0_eyescanreset_in), // input wire gt0_eyescanreset_in
        .gt0_rxuserrdy_in               (gt0_rxuserrdy_in), // input wire gt0_rxuserrdy_in
    //------------------------ RX Margin Analysis Ports ------------------------
        .gt0_eyescandataerror_out       (gt0_eyescandataerror_out), // output wire gt0_eyescandataerror_out
        .gt0_eyescantrigger_in          (gt0_eyescantrigger_in), // input wire gt0_eyescantrigger_in
    //---------------- Receive Ports - FPGA RX interface Ports -----------------
        .gt0_rxdata_out                 (gt0_rxdata_out), // output wire [31:0] gt0_rxdata_out
    //----------------- Receive Ports - Pattern Checker Ports ------------------
        .gt0_rxprbserr_out              (gt0_rxprbserr_out), // output wire gt0_rxprbserr_out
        .gt0_rxprbssel_in               (gt0_rxprbssel_in), // input wire [2:0] gt0_rxprbssel_in
    //----------------- Receive Ports - Pattern Checker ports ------------------
        .gt0_rxprbscntreset_in          (gt0_rxprbscntreset_in), // input wire gt0_rxprbscntreset_in
    //---------------- Receive Ports - RX 8B/10B Decoder Ports -----------------
        .gt0_rxdisperr_out              (gt0_rxdisperr_out), // output wire [3:0] gt0_rxdisperr_out
        .gt0_rxnotintable_out           (gt0_rxnotintable_out), // output wire [3:0] gt0_rxnotintable_out
    //------------------------- Receive Ports - RX AFE -------------------------
        .gt0_gtxrxp_in                  (gt0_gtxrxp_in), // input wire gt0_gtxrxp_in
    //---------------------- Receive Ports - RX AFE Ports ----------------------
        .gt0_gtxrxn_in                  (gt0_gtxrxn_in), // input wire gt0_gtxrxn_in
    //----------------- Receive Ports - RX Buffer Bypass Ports -----------------
        .gt0_rxstatus_out               (gt0_rxstatus_out), // output wire [2:0] gt0_rxstatus_out
    //------------ Receive Ports - RX Byte and Word Alignment Ports ------------
        .gt0_rxcommadet_out             (gt0_rxcommadet_out), // output wire gt0_rxcommadet_out
    //------------------- Receive Ports - RX Equalizer Ports -------------------
        .gt0_rxdfelpmreset_in           (gt0_rxdfelpmreset_in), // input wire gt0_rxdfelpmreset_in
        .gt0_rxmonitorout_out           (gt0_rxmonitorout_out), // output wire [6:0] gt0_rxmonitorout_out
        .gt0_rxmonitorsel_in            (gt0_rxmonitorsel_in), // input wire [1:0] gt0_rxmonitorsel_in
    //------------- Receive Ports - RX Fabric Output Control Ports -------------
        .gt0_rxoutclkfabric_out         (gt0_rxoutclkfabric_out), // output wire gt0_rxoutclkfabric_out
    //----------- Receive Ports - RX Initialization and Reset Ports ------------
        .gt0_gtrxreset_in               (gt0_gtrxreset_in), // input wire gt0_gtrxreset_in
        .gt0_rxpmareset_in              (gt0_rxpmareset_in), // input wire gt0_rxpmareset_in
    //----------------- Receive Ports - RX8B/10B Decoder Ports -----------------
        .gt0_rxchariscomma_out          (gt0_rxchariscomma_out), // output wire [3:0] gt0_rxchariscomma_out
        .gt0_rxcharisk_out              (gt0_rxcharisk_out), // output wire [3:0] gt0_rxcharisk_out
    //------------ Receive Ports -RX Initialization and Reset Ports ------------
        .gt0_rxresetdone_out            (gt0_rxresetdone_out), // output wire gt0_rxresetdone_out
    //------------------- TX Initialization and Reset Ports --------------------
        .gt0_gttxreset_in               (gt0_gttxreset_in), // input wire gt0_gttxreset_in
        .gt0_txuserrdy_in               (gt0_txuserrdy_in), // input wire gt0_txuserrdy_in
    //---------------- Transmit Ports - Pattern Generator Ports ----------------
        .gt0_txprbsforceerr_in          (gt0_txprbsforceerr_in), // input wire gt0_txprbsforceerr_in
    //---------------- Transmit Ports - TX Data Path interface -----------------
        .gt0_txdata_in                  (gt0_txdata_in), // input wire [31:0] gt0_txdata_in
    //-------------- Transmit Ports - TX Driver and OOB signaling --------------
        .gt0_gtxtxn_out                 (gt0_gtxtxn_out), // output wire gt0_gtxtxn_out
        .gt0_gtxtxp_out                 (gt0_gtxtxp_out), // output wire gt0_gtxtxp_out
    //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
        .gt0_txoutclkfabric_out         (gt0_txoutclkfabric_out), // output wire gt0_txoutclkfabric_out
        .gt0_txoutclkpcs_out            (gt0_txoutclkpcs_out), // output wire gt0_txoutclkpcs_out
    //------------------- Transmit Ports - TX Gearbox Ports --------------------
        .gt0_txcharisk_in               (gt0_txcharisk_in), // input wire [3:0] gt0_txcharisk_in
    //----------- Transmit Ports - TX Initialization and Reset Ports -----------
        .gt0_txresetdone_out            (gt0_txresetdone_out), // output wire gt0_txresetdone_out
    //---------------- Transmit Ports - pattern Generator Ports ----------------
        .gt0_txprbssel_in               (gt0_txprbssel_in), // input wire [2:0] gt0_txprbssel_in

    //____________________________COMMON PORTS________________________________
    .gt0_qplloutclk_out(gt0_qplloutclk_out), // output wire gt0_qplloutclk_out 
    .gt0_qplloutrefclk_out(gt0_qplloutrefclk_out), // output wire gt0_qplloutrefclk_out
     .sysclk_in(sysclk_in) // input wire sysclk_in

);

endmodule

/*---previous---
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/28 17:11:04
// Design Name: 
// Module Name: my_gtwizard1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module my_gtwizard1(
    input wire sysclk_in,
    input wire q0_clk1_gtrefclk_pad_n_in,
    input wire q0_clk1_gtrefclk_pad_p_in,
    input wire soft_reset_tx_in,
    input wire soft_reset_rx_in,
    output wire gt0_qplllock_out,
    input wire gt0_gttxreset_in,
    input wire gt0_gtrxreset_in,
    output wire gt0_rxresetdone_out,
    output wire gt0_txresetdone_out,
    input wire gt0_rxuserrdy_in,
    input wire gt0_txuserrdy_in,
    input wire [3:0] gt0_txcharisk_in,
    input wire [31:0] gt0_txdata_in,
    output wire [3:0] gt0_rxcharisk_out,
    output wire [31:0] gt0_rxdata_out,

    input wire gt0_gtxrxp_in,
    input wire gt0_gtxrxn_in,
    output wire gt0_gtxtxn_out,
    output wire gt0_gtxtxp_out
);
wire dont_reset_on_data_error_in = 1'b1;
wire gt0_data_valid_in = 1'b1;

gtwizard_0  gtwizard_0_i
(
    .soft_reset_tx_in(soft_reset_tx_in),                        // input wire soft_reset_tx_in
    .soft_reset_rx_in(soft_reset_rx_in),                        // input wire soft_reset_rx_in
    .dont_reset_on_data_error_in(dont_reset_on_data_error_in),  // input wire dont_reset_on_data_error_in
    .q0_clk1_gtrefclk_pad_n_in(q0_clk1_gtrefclk_pad_n_in),      // input wire q0_clk1_gtrefclk_pad_n_in
    .q0_clk1_gtrefclk_pad_p_in(q0_clk1_gtrefclk_pad_p_in),      // input wire q0_clk1_gtrefclk_pad_p_in
    .gt0_tx_fsm_reset_done_out(gt0_tx_fsm_reset_done_out),      // output wire gt0_tx_fsm_reset_done_out
    .gt0_rx_fsm_reset_done_out(gt0_rx_fsm_reset_done_out),      // output wire gt0_rx_fsm_reset_done_out
    .gt0_data_valid_in(gt0_data_valid_in),                      // input wire gt0_data_valid_in

    .gt0_txusrclk_out(gt0_txusrclk_out),                        // output wire gt0_txusrclk_out
    .gt0_txusrclk2_out(gt0_txusrclk2_out),                      // output wire gt0_txusrclk2_out
    .gt0_rxusrclk_out(gt0_rxusrclk_out),                        // output wire gt0_rxusrclk_out
    .gt0_rxusrclk2_out(gt0_rxusrclk2_out),                      // output wire gt0_rxusrclk2_out
//_________________________________________________________________________
//GT0  (X0Y0)
//____________________________CHANNEL PORTS________________________________
//-------------------------- Channel - DRP Ports  --------------------------
    .gt0_drpaddr_in                 (gt0_drpaddr_in),           // input wire [8:0] gt0_drpaddr_in
    .gt0_drpdi_in                   (gt0_drpdi_in),             // input wire [15:0] gt0_drpdi_in
    .gt0_drpdo_out                  (gt0_drpdo_out),            // output wire [15:0] gt0_drpdo_out
    .gt0_drpen_in                   (gt0_drpen_in),             // input wire gt0_drpen_in
    .gt0_drprdy_out                 (gt0_drprdy_out),           // output wire gt0_drprdy_out
    .gt0_drpwe_in                   (gt0_drpwe_in),             // input wire gt0_drpwe_in
//------------------------- Digital Monitor Ports --------------------------
    .gt0_dmonitorout_out            (gt0_dmonitorout_out),      // output wire [7:0] gt0_dmonitorout_out
//----------------------------- Loopback Ports -----------------------------
    .gt0_loopback_in                (gt0_loopback_in),          // input wire [2:0] gt0_loopback_in
//---------------------------- Power-Down Ports ----------------------------
    .gt0_rxpd_in                    (gt0_rxpd_in),              // input wire [1:0] gt0_rxpd_in
    .gt0_txpd_in                    (gt0_txpd_in),              // input wire [1:0] gt0_txpd_in
//------------------- RX Initialization and Reset Ports --------------------
    .gt0_eyescanreset_in            (gt0_eyescanreset_in),      // input wire gt0_eyescanreset_in
    .gt0_rxuserrdy_in               (gt0_rxuserrdy_in),         // input wire gt0_rxuserrdy_in
//------------------------ RX Margin Analysis Ports ------------------------
    .gt0_eyescandataerror_out       (gt0_eyescandataerror_out), // output wire gt0_eyescandataerror_out
    .gt0_eyescantrigger_in          (gt0_eyescantrigger_in),    // input wire gt0_eyescantrigger_in
//---------------- Receive Ports - FPGA RX interface Ports -----------------
    .gt0_rxdata_out                 (gt0_rxdata_out),           // output wire [31:0] gt0_rxdata_out
//----------------- Receive Ports - Pattern Checker Ports ------------------
    .gt0_rxprbserr_out              (gt0_rxprbserr_out),        // output wire gt0_rxprbserr_out
    .gt0_rxprbssel_in               (gt0_rxprbssel_in),         // input wire [2:0] gt0_rxprbssel_in
//----------------- Receive Ports - Pattern Checker ports ------------------
    .gt0_rxprbscntreset_in          (gt0_rxprbscntreset_in),    // input wire gt0_rxprbscntreset_in
//---------------- Receive Ports - RX 8B/10B Decoder Ports -----------------
    .gt0_rxdisperr_out              (gt0_rxdisperr_out),        // output wire [3:0] gt0_rxdisperr_out
    .gt0_rxnotintable_out           (gt0_rxnotintable_out),     // output wire [3:0] gt0_rxnotintable_out
//------------------------- Receive Ports - RX AFE -------------------------
    .gt0_gtxrxp_in                  (gt0_gtxrxp_in),            // input wire gt0_gtxrxp_in
//---------------------- Receive Ports - RX AFE Ports ----------------------
    .gt0_gtxrxn_in                  (gt0_gtxrxn_in),            // input wire gt0_gtxrxn_in
//----------------- Receive Ports - RX Buffer Bypass Ports -----------------
    .gt0_rxstatus_out               (gt0_rxstatus_out),         // output wire [2:0] gt0_rxstatus_out
//------------ Receive Ports - RX Byte and Word Alignment Ports ------------
    .gt0_rxcommadet_out             (gt0_rxcommadet_out),       // output wire gt0_rxcommadet_out
//------------------- Receive Ports - RX Equalizer Ports -------------------
    .gt0_rxdfelpmreset_in           (gt0_rxdfelpmreset_in),     // input wire gt0_rxdfelpmreset_in
    .gt0_rxmonitorout_out           (gt0_rxmonitorout_out),     // output wire [6:0] gt0_rxmonitorout_out
    .gt0_rxmonitorsel_in            (gt0_rxmonitorsel_in),      // input wire [1:0] gt0_rxmonitorsel_in
//------------- Receive Ports - RX Fabric Output Control Ports -------------
    .gt0_rxoutclkfabric_out         (gt0_rxoutclkfabric_out),   // output wire gt0_rxoutclkfabric_out
//----------- Receive Ports - RX Initialization and Reset Ports ------------
    .gt0_gtrxreset_in               (gt0_gtrxreset_in),         // input wire gt0_gtrxreset_in
    .gt0_rxpmareset_in              (gt0_rxpmareset_in),        // input wire gt0_rxpmareset_in
//----------------- Receive Ports - RX8B/10B Decoder Ports -----------------
    .gt0_rxchariscomma_out          (gt0_rxchariscomma_out),    // output wire [3:0] gt0_rxchariscomma_out
    .gt0_rxcharisk_out              (gt0_rxcharisk_out),        // output wire [3:0] gt0_rxcharisk_out
//------------ Receive Ports -RX Initialization and Reset Ports ------------
    .gt0_rxresetdone_out            (gt0_rxresetdone_out),      // output wire gt0_rxresetdone_out
//------------------- TX Initialization and Reset Ports --------------------
    .gt0_gttxreset_in               (gt0_gttxreset_in),         // input wire gt0_gttxreset_in
    .gt0_txuserrdy_in               (gt0_txuserrdy_in),         // input wire gt0_txuserrdy_in
//---------------- Transmit Ports - Pattern Generator Ports ----------------
    .gt0_txprbsforceerr_in          (gt0_txprbsforceerr_in),    // input wire gt0_txprbsforceerr_in
//---------------- Transmit Ports - TX Data Path interface -----------------
    .gt0_txdata_in                  (gt0_txdata_in),            // input wire [31:0] gt0_txdata_in
//-------------- Transmit Ports - TX Driver and OOB signaling --------------
    .gt0_gtxtxn_out                 (gt0_gtxtxn_out),           // output wire gt0_gtxtxn_out
    .gt0_gtxtxp_out                 (gt0_gtxtxp_out),           // output wire gt0_gtxtxp_out
//--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    .gt0_txoutclkfabric_out         (gt0_txoutclkfabric_out),   // output wire gt0_txoutclkfabric_out
    .gt0_txoutclkpcs_out            (gt0_txoutclkpcs_out),      // output wire gt0_txoutclkpcs_out
//------------------- Transmit Ports - TX Gearbox Ports --------------------
    .gt0_txcharisk_in               (gt0_txcharisk_in),         // input wire [3:0] gt0_txcharisk_in
//----------- Transmit Ports - TX Initialization and Reset Ports -----------
    .gt0_txresetdone_out            (gt0_txresetdone_out),      // output wire gt0_txresetdone_out
//---------------- Transmit Ports - pattern Generator Ports ----------------
    .gt0_txprbssel_in               (gt0_txprbssel_in),         // input wire [2:0] gt0_txprbssel_in

//____________________________COMMON PORTS________________________________
    .gt0_qplllock_out(gt0_qplllock_out),                        // output wire gt0_qplllock_out
    .gt0_qpllrefclklost_out(gt0_qpllrefclklost_out),            // output wire gt0_qpllrefclklost_out
    .gt0_qplloutclk_out(gt0_qplloutclk_out),                    // output wire gt0_qplloutclk_out 
    .gt0_qplloutrefclk_out(gt0_qplloutrefclk_out),              // output wire gt0_qplloutrefclk_out
    .sysclk_in(sysclk_in)                                       // input wire sysclk_in

);

endmodule
----------*/