//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 02:50:33
// Design Name: 
// Module Name: differential_out
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: single -> differential clock
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module differential_out(
    input clk_in_p,
    input clk_in_n,
    output clk_160MHz,
    output clk_160MHz_p,
    output clk_160MHz_n,
    output clk_80MHz,
    output clk_80MHz_p,
    output clk_80MHz_n
);

wire clk_in;
IBUFDS ibuf_ds_clk_200(
    .O (clk_in),
    .I (clk_in_p),
    .IB(clk_in_n)
);

clk_wiz_0 instance_name(
    .clk_out_160MHz(clk_160MHz),    // output clk_160MHz
    .clk_out_80MHz(clk_80MHz),      // output clk_80MHz
    .clk_in1(clk_in)
);

OBUFDS obuf_ds_clk_160(
    .O (clk_160MHz_p),
    .OB(clk_160MHz_n),
    .I (clk_160MHz)
);

OBUFDS obuf_ds_clk_80(
    .O (clk_80MHz_p),
    .OB(clk_80MHz_n),
    .I (clk_80MHz)
);

endmodule
