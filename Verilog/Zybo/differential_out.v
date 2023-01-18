//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 09:06:50
// Design Name: 
// Module Name: differential_out
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


module differential_out(
    input clk_in,
    input SW,
    output clk_320MHz,
    output clk_160MHz_p,
    output clk_160MHz_n,
    output clk_80MHz_p,
    output clk_80MHz_n
);



clk_wiz_0 instance_name(
    .clk_out_320MHz(clk_320MHz),    // output clk_out_320MHz
    .clk_out_160MHz(clk_160MHz),    // output clk_out_160MHz
    .clk_out_80MHz(clk_80MHz),      // output clk_out_80MHz
    .clk_in1(clk_in1)                   // input clk_in1
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

reg sw_trigger = 1'd0;
always @(posedge clk_320MHz)begin
    sw_trigger <= SW;
end

endmodule