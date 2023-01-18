//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 01:54:10
// Design Name: 
// Module Name: test_jesd_loop
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


module test_jesd_loop(
    input  SYSCLK_P,
    input  SYSCLK_N,
    input  SW,
    output [3:0] LED
);

wire [31:0] rx_tdata_0;
wire rx_tvalid_0;
wire tx_tready_0;

design_1_wrapper design_1_wrapper(
    .clk_in_n_0(SYSCLK_P),
    .clk_in_p_0(SYSCLK_N),
    .rx_tdata_0(rx_tdata_0),
    .rx_tvalid_0(rx_tvalid_0),
    .trig_in_0(SW),
    .tx_tready_0(tx_tready_0)
);

assign LED = {SW, SW, SW, SW};

endmodule