//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/22 20:21:14
// Design Name: 
// Module Name: data_generator
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

//testpattern = xxxxxxxxxxxxxxxxxxxxxxxxxxxx1010
//count = xxxxxxxxxxxxxxxxxxxxxxxxxxxx

module data_generator(
    input CLK,
    input TRIG,
    output [31:0] testpattern_out
);

wire CLK;
wire TRIG;
wire [31:0] testpattern_out;

reg [9:0] count = 10'd0;
reg trig_r;
reg [31:0] testpattern_o_r = 32'b0;
reg [3:0] final4bits = 4'b1010; 

always @(posedge CLK) begin
    trig_r <= TRIG;
    if (trig_r == 1'b0) begin
        if (count == 10'b1111111111111111111111111111) begin
            count <= 10'd0;
        end
        else begin
            count <= count + 10'd1;
        end
        testpattern_o_r <= {count , final4bits};
    end
    else begin
        testpattern_o_r <= 14'b0;
    end
end

assign testpattern_out = testpattern_o_r;

endmodule