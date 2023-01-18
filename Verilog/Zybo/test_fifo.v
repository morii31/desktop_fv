module test_fifo(
    input CLK,
    input SW0,
    output LED0,
    output LED2,
    output LED3
);
    
parameter test_input = 8'b1001_0101;
parameter CNT_1SEC = 27'd124999999;
(* mark_debug = "true" *) reg sw0_trigger = 1'b0;
(* mark_debug = "true" *) reg [27:0] cnt = 27'd0;
     
//FIFO IP     
char_fifo your_instance_name (  
  .rst(rst_i),                      // input wire rst
  .wr_clk(clk_rx),                  // input wire wr_clk
  .rd_clk(clk_tx),                  // input wire rd_clk
  .din(char_fifo_din),              // input wire [7 : 0] din
  .wr_en(char_fifo_wr_en),          // input wire wr_en
  .rd_en(char_fifo_rd_en),          // input wire rd_en
  .dout(char_fifo_dout),            // output wire [7 : 0] dout
  .full(char_fifo_full),            // output wire full
  .empty(char_fifo_empty),          // output wire empty
  .wr_rst_busy(wr_rst_busy),        // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)         // output wire rd_rst_busy
);

parameter reset = 0;
(* mark_debug = "true" *) reg [7:0] datain;
(* mark_debug = "true" *) reg write_en;
(* mark_debug = "true" *) reg read_en;
(* mark_debug = "true" *) wire [7:0] dataout;

assign rst_i = reset;
assign clk_rx = CLK;
assign clk_tx = CLK;
assign char_fifo_din = datain;
assign char_fifo_wr_en = write_en;
assign char_fifo_rd_en = read_en;
assign char_fifo_dout = dataout;

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
            datain <= test_input;
            write_en <= 1'd1;
            read_en <= 1'd0;
        end
        27'd17:begin
            datain <= 7'd0;
            write_en <= 1'd0;
            read_en <= 1'd1;
        end
        default:begin
            datain <= 7'd0;
            write_en <= 1'd0;
            read_en <= 1'd0;
        end
    endcase
end
    
assign LED0 = sw0_trigger;
assign LED2 = write_en;
assign LED3 = read_en;
        
endmodule