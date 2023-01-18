module test_ILAIP(
    input CLK,
    input SW0,
    output LED0,
    output LED2,
    output LED3
);
    
parameter test_input1 = 4'b1001;
parameter test_input2 = 4'b1110;
parameter CNT_1SEC = 27'd124999999;
reg sw0_trigger = 1'b0;
reg [27:0] cnt = 27'd0;

wire CLK;
reg [3:0] din_0;
reg wr_en_0;
reg rd_en_0;
wire [3:0] dout_0;

design_1_wrapper design_1_wrapper(
    .clk_0(CLK),
    .din_0(din_0),
    .dout_0(dout_0),
    .rd_en_0(rd_en_0),
    .trig_in_0(sw0_trigger),
    .wr_en_0(wr_en_0)
);
        
always @(posedge CLK) begin
    sw0_trigger <= SW0;
    if ((sw0_trigger == 1'd1) & (cnt != CNT_1SEC)) begin
        cnt <= cnt +27'd1;
    end
    else begin
        cnt <= 27'd0;
    end

    case (cnt)
        27'd1:begin
            din_0 <= test_input1;
            wr_en_0 <= 1'd1;
            rd_en_0 <= 1'd0;
        end
        27'd2:begin
            din_0 <= test_input2;
            wr_en_0 <= 1'd1;
            rd_en_0 <= 1'd0;
        end        
        27'd8:begin
            din_0 <= 4'd0;
            wr_en_0 <= 1'd0;
            rd_en_0 <= 1'd1;
        end
        27'd9:begin
            din_0 <= 4'd0;
            wr_en_0 <= 1'd0;
            rd_en_0 <= 1'd1;
        end
        default:begin
            din_0 <= 4'd0;
            wr_en_0 <= 1'd0;
            rd_en_0 <= 1'd0;
        end
    endcase

end
    
assign LED0 = sw0_trigger;
assign LED2 = wr_en_0;
assign LED3 = rd_en_0;
        
endmodule