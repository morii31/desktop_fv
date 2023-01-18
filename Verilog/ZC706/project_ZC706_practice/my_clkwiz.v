`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/20 20:55:25
// Design Name: 
// Module Name: my_clkwiz
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


module my_clkwiz(
    input wire CLK_p,
    input wire CLK_n,
    output wire CLK,
    output wire clk_200,
    output wire clk_100,
    output wire clk_400,
    output wire clk_160,
    input wire SW,
    output wire locked
);

IBUFDS ibuf_ds_clk(
    .O (CLK_ng),
    .I (CLK_p),
    .IB(CLK_n)
);
BUFG bufg_clk(
    .O(CLK),
    .I(CLK_ng)
);

clk_wiz_0 instance_name(
    // Clock out ports
    .clk_out1(clk_200),     // output clk_out1
    .clk_out2(clk_100),     // output clk_out2
    .clk_out3(clk_400),     // output clk_out3
    .clk_out4(clk_160),     // output clk_out4
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(CLK)
);  
endmodule
