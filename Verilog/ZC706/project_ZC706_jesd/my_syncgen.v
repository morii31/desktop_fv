`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/25 19:41:25
// Design Name: 
// Module Name: my_syncgen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: generate 1pulse SYNC output at 160MHz
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module my_syncgen(
    input wire CLK,
    input wire SW,
    output wire SYNC
    );

parameter CNT_1SEC = 28'd199999999;
reg [27:0] cnt = 28'b0;
reg r_sync = 1'b0;
always @(posedge CLK) begin
    if (SW == 1'b1) begin
        if (cnt == CNT_1SEC) begin
            cnt <= 28'b0;
        end
        else begin
            cnt <= cnt + 1'b1;
            if (cnt == 28'b1) begin
                r_sync <= 1'b1;
            end
            else begin
                r_sync <= 1'b0;
            end
        end
    end
    else begin
        cnt <= 1'b0;
        r_sync <= 1'b0;
    end
end

assign SYNC = r_sync;

endmodule
