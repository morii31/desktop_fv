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
assign refclk_p_i = refclk_p_o;
assign refclk_n_i = refclk_n_o;
assign subclk_p_i = subclk_p_o;
assign subclk_n_i = subclk_n_o;
assign DAP_i = DAP_o;
assign DAM_i = DAM_o;
assign DBP_i = DBP_o;
assign DBM_i = DBM_o;
assign DCP_i = DCP_o;
assign DCM_i = DCM_o;
assign DDP_i = DDP_o;
assign DDM_i = DDM_o;
assign SYSREFP_i = SYSREFP_o;
assign SYSREFM_i = SYSREFM_o;
assign SYNCP_i = SYNCP_o;
assign SYNCM_i = SYNCM_o;

endmodule
