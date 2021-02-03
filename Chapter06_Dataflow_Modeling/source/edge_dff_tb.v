// file edge_dff_tb.v

`timescale 1ns/10ps

module edge_dff_tb();

wire  q_w;
wire  qbar_w;
reg   d_r;
reg   clk_r;
reg   clear_r;


always
begin
  clk_r = 1'b0;
  # 5;
  clk_r = 1'b1;
  # 5;
end



initial
begin
  d_r     = 1'b0;
  clear_r = 1'b0;
  #21;
  clear_r = 1'b1;
  #23;
  clear_r = 1'b0;
  #30;
  d_r     = 1'b1;
  #3;
  d_r     = 1'b0;
  #13;
  d_r     = 1'b1;
  #13;
  d_r     = 1'b0;
  #13;
  d_r     = 1'b1;
  #13;
  d_r     = 1'b0;
  #13;
  d_r     = 1'b1;
  #13;
  d_r     = 1'b0;
  #13;
  d_r     = 1'b1;
  #30;
  $stop;
end


edge_dff DUT (
  .q     (q_w),
  .qbar  (qbar_w),
  .d     (d_r),
  .clk   (clk_r),
  .clear (clear_r)
);


endmodule



