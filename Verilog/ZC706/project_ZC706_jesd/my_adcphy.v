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
// Description: 
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
    input wire SYNCP_i,
    input wire SYNCM_i,
    output wire refclk_p_o,
    output wire refclk_n_o,
    output wire subclk_p_o,
    output wire subclk_n_o,
    output wire DAP_o,
    output wire DAM_o,
    output wire DBP_o,
    output wire DBM_o,
    output wire DCP_o,
    output wire DCM_o,
    output wire DDP_o,
    output wire DDM_o,
    output wire SYSREFP_o,
    output wire SYSREFM_o,
    output wire SYNCP_o,
    output wire SYNCM_o
    );
assign refclk_p_o = refclk_p_i;
assign refclk_n_o = refclk_n_i;
assign subclk_p_o = subclk_p_i;
assign subclk_n_o = subclk_n_i;
assign DAP_o = DAP_i;
assign DAM_o = DAM_i;
assign DBP_o = DBP_i;
assign DBM_o = DBM_i;
assign DCP_o = DCP_i;
assign DCM_o = DCM_i;
assign DDP_o = DDP_i;
assign DDM_o = DDM_i;
assign SYSREFP_o = SYSREFP_i;
assign SYSREFM_o = SYSREFM_i;
assign SYNCP_o = SYNCP_i;
assign SYNCM_o = SYNCM_i;

endmodule
