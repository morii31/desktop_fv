`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/28 17:09:47
// Design Name: 
// Module Name: data_gen
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


module data_gen(
    input wire CLK,
    input wire SW,
    //output reg gt0_rxuserrdy,
    output reg [3:0] gt0_txcharisk,
    output reg [31:0] gt0_txdata
);
reg ready = 1;
reg sw_i;
parameter [7:0] comma = 8'hbc;      //10111100
reg [13:0] cnt = 14'b0;
parameter DATAH = 1'b0;
parameter DATAF = 1'b1; 
reg TX_STATE = DATAH;


always @(posedge CLK) begin
    if (cnt == 14'b11_1111_1111_1111)begin
        cnt <= 14'b0;
    end
    else begin
        cnt <= cnt + 14'b1;
    end

    case(TX_STATE)
    DATAH : begin
        gt0_txdata <= {cnt[13:6], cnt[5:0], 2'b00, comma, comma};
        gt0_txcharisk <= 4'b0011;
        TX_STATE <= DATAF;
    end
    DATAF : begin
        gt0_txdata <= {8'h0e, 8'h0d, cnt[13:6], cnt[5:0], 2'b00};
        gt0_txcharisk <= 4'b0000;
        TX_STATE <= DATAH;
    end
    endcase
end
endmodule
