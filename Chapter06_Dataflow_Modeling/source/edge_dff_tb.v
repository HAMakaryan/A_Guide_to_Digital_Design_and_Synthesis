// file edge_dff_tb.v

`timescale 10ns/10ps

module edge_dff_tb();

wire  q_w;
wire  qbar_w;
reg   d_r;
reg   clk_r;
reg   clear_r;
integer scenario;


always
begin
  clk_r = 1'b0;
  # 5;
  clk_r = 1'b1;
  # 5;
end



initial
begin
  scenario= 0;
  d_r     = 1'b0;
  clear_r = 1'b0;
  #11;
  clear_r = 1'b1;
  #11;
  clear_r = 1'b0;
  repeat(2) @(posedge clk_r);
  d_r     = 1'b1;
  repeat(2) @(posedge clk_r);
  // Scenario 1
  scenario= 1;
  @(posedge clk_r);
  #0.5;
  d_r     = 1'b1;
  @(negedge clk_r);
  #0.5;
  repeat (20) #0.1 d_r = !d_r;
  // Scenario 2
  scenario= 2;
  @(posedge clk_r);
  #0.5;
  d_r     = 1'b0;
  @(negedge clk_r);
  #0.5;
  repeat (20) #0.1 d_r = !d_r;

  // Scenario 3
  scenario= 3;
  @(negedge clk_r);
  #0.5;
  d_r     = 1'b1;
  @(posedge clk_r);
  #0.5;
  repeat (20) #0.1 d_r = !d_r;
  // Scenario 4
  scenario= 4;
  @(negedge clk_r);
  #0.5;
  d_r     = 1'b0;
  @(posedge clk_r);
  #0.5;
  repeat (20) #0.1 d_r = !d_r;

  repeat(2) @(posedge clk_r);
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



