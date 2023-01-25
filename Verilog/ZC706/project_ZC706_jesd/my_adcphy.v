`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/17 20:58:48
// Design Name: 
// Module Name: my_adcphy
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: my ADC I/O pin Phy. 
//      ・be differential <-> single
//      ・DA,DB,DC,DD -> D
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module my_adcphy(
    input wire refclk_p_i,
    input wire refclk_n_i,
    input wire subclk_p_i,
    input wire subclk_n_i,
    input wire DAP_i,
    input wire DAM_i,
    input wire DBP_i,
    input wire DBM_i,
    input wire DCP_i,
    input wire DCM_i,
    input wire DDP_i,
    input wire DDM_i,
    input wire SYSREFP_i,
    input wire SYSREFM_i,
    input wire SYNC_i,
    output wire refclk_p_o,
    output wire refclk_n_o,
    output wire subclk_p_o,
    output wire subclk_n_o,
    output wire [3:0] DP_o,
    output wire [3:0] DM_o,
    output wire SYSREF_o,
    output wire SYNCP_o,
    output wire SYNCM_o
    );
    
assign refclk_p_o = refclk_p_i;
assign refclk_n_o = refclk_n_i;
assign subclk_p_o = subclk_p_i;
assign subclk_n_o = subclk_n_i;
assign DP_o = {DAP_i, DBP_i, DCP_i, DDP_i};
assign DM_o = {DAM_i, DBM_i, DCM_i, DDM_i};

IBUFDS ibufds_sysref(
    .O (SYSREF_o),
    .I (SYSREFP_i),
    .IB(SYSREFM_i)
);
OBUFDS obufds_sync(
    .O (SYNCP_o),
    .OB(SYNCM_o),
    .I (SYNC_i)
);
endmodule
