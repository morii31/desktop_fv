module test_native_fifo(
    input CLK_P,
    input CLK_N,
    input SW0,
    output LED0,
    output LED2,
    output LED3
);
    
parameter test_input1 = 4'b1001;
parameter test_input2 = 4'b1110;
parameter CNT_1SEC = 27'd124999999;
(* mark_debug = "true" *) reg sw0_trigger = 1'b0;
(* mark_debug = "true" *) reg [27:0] cnt = 27'd0;

wire CLK;
IBUFDS ibuf_ds_clk(
    .O ( CLK ),
    .I ( CLK_P ),
    .IB( CLK_N) 
);

wire fifo_clk = CLK;
wire fifo_srst = 0;
(* mark_debug = "true" *) reg [3:0] fifo_din;
(* mark_debug = "true" *) reg fifo_wr_en;
(* mark_debug = "true" *) reg fifo_rd_en;
(* mark_debug = "true" *) wire [3:0] fifo_dout;

//FIFO IP     
native_fifo your_instance_name (
  .clk(fifo_clk),      // input wire clk
  .srst(fifo_srst),    // input wire srst
  .din(fifo_din),      // input wire [3 : 0] din
  .wr_en(fifo_wr_en),  // input wire wr_en
  .rd_en(fifo_rd_en),  // input wire rd_en
  .dout(fifo_dout),    // output wire [3 : 0] dout
  .full(fifo_full),    // output wire full
  .empty(fifo_empty)   // output wire empty
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
            fifo_din <= test_input1;
            fifo_wr_en <= 1'd1;
            fifo_rd_en <= 1'd0;
        end
        27'd2:begin
            fifo_din <= test_input2;
            fifo_wr_en <= 1'd1;
            fifo_rd_en <= 1'd0;
        end        
        27'd8:begin
            fifo_din <= 4'd0;
            fifo_wr_en <= 1'd0;
            fifo_rd_en <= 1'd1;
        end
        27'd9:begin
            fifo_din <= 4'd0;
            fifo_wr_en <= 1'd0;
            fifo_rd_en <= 1'd1;
        end
        default:begin
            fifo_din <= 4'd0;
            fifo_wr_en <= 1'd0;
            fifo_rd_en <= 1'd0;
        end
    endcase

end
    
assign LED0 = sw0_trigger;
assign LED2 = fifo_wr_en;
assign LED3 = fifo_rd_en;
        
endmodule