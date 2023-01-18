`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/14 23:19:11
// Design Name: 
// Module Name: my_gtconfig
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


module my_gtconfig(
    input CLK,
    input SW,
    output wire C_RST,
    //output wire soft_reset_tx_out,
    //output wire soft_reset_rx_out,
    input wire gt0_cplllock_in,
    output wire gt0_cpllreset_out,
    output wire gt0_gttxreset_out,
    output wire gt0_gtrxreset_out,
    input wire gt0_rxresetdone_in,
    input wire gt0_txresetdone_in,
    output wire gt0_rxuserrdy_out,
    output wire gt0_txuserrdy_out
);

//jitter attenuated clock reset//
reg clk_rst = 1'b0;
always @(posedge CLK) begin
    if (SW == 1'b1) begin
        clk_rst <= 1'b1;
    end
end
assign C_RST = clk_rst;
//----------//

//soft_reset//
reg is_reset = 1'b0;
reg [3:0] cnt = 4'b0;
always @(posedge CLK) begin
    if (SW == 1'b1) begin
        if (cnt != 4'b1111) begin
            cnt <= cnt + 1'b1;
            is_reset <= 1'b1;
        end
        else begin
            is_reset <= 1'b0;
        end
    end
end
assign gt0_cpllreset_out = is_reset;

//----------//


assign gt0_gttxreset_out = gt0_cplllock_in;
assign gt0_gtrxreset_out = gt0_cplllock_in;

assign gt0_rxuserrdy_out = gt0_rxresetdone_in;
assign gt0_txuserrdy_out = gt0_txresetdone_in;

endmodule

/*---previous---
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/14 23:19:11
// Design Name: 
// Module Name: my_gtconfig
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


module my_gtconfig(
    input CLK,
    input SW,
    output wire soft_reset_tx_out,
    output wire soft_reset_rx_out,
    input wire gt0_qplllock_in,
    output wire gt0_gttxreset_out,
    output wire gt0_gtrxreset_out,
    input wire gt0_rxresetdone_in,
    input wire gt0_txresetdone_in,
    output wire gt0_rxuserrdy_out,
    output wire gt0_txuserrdy_out
);

//soft_reset//
reg is_reset = 1'b0;
reg [3:0] cnt = 4'b0;
always @(posedge CLK) begin
    if (SW == 1'b1) begin
        if (cnt != 4'b1111) begin
            cnt <= cnt + 1'b1;
            is_reset <= 1'b1;
        end
        else begin
            is_reset <= 1'b0;
        end
    end
end
assign soft_reset_rx_out = is_reset;
assign soft_reset_tx_out = is_reset;
//----------//


assign gt0_gttxreset_out = gt0_qplllock_in;
assign gt0_gtrxreset_out = gt0_qplllock_in;

assign gt0_rxuserrdy_out = gt0_rxresetdone_in;
assign gt0_txuserrdy_out = gt0_txresetdone_in;

endmodule
------*/