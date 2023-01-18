`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 11:41:02
// Design Name: 
// Module Name: test_jesd_loop2
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

module test_jesd_loop2(
    input  usrclk_p_0,
    input  usrclk_n_0,
    input  sysclk_p_0,
    input  sysclk_n_0,
    input  SW,
    output [3:0] LED
);

wire [31:0] rx_tdata_0;
wire rx_tvalid_0;
wire tx_tready_0;
wire sysclk_0;   //200MHz
IBUFDS ibuf_ds_sysclk(
    .O (sysclk_0),
    .I (sysclk_p_0),
    .IB(sysclk_n_0)
);

design_2_wrapper design_2_wrapper(
    .rx_tdata_0(rx_tdata_0),
    .rx_tvalid_0(rx_tvalid_0),
    .trig_in_0(SW),
    .tx_tready_0(tx_tready_0),
    .sysclk_0(sysclk_0),
    .usrclk_n(usrclk_n_0),
    .usrclk_p(usrclk_p_0)
);
assign LED = {SW, SW, SW, SW};

endmodule
