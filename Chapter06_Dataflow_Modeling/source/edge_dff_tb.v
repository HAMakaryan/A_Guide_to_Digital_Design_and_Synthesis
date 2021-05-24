// file edge_dff_tb.v

`timescale 10ns/10ps

module edge_dff_tb();

wire  q_w;
wire  qbar_w;
reg   d_r;
reg   clk_r;
reg   clear_r;
integer scenario;
reg   [8*40:1]comment;


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
  #11;

  // Scenario 10 reset
  scenario= 10;
  comment = "reset";
  clear_r = 1'b1;
  #11;
  clear_r = 1'b0;

  // Scenario 20 d = 0
  scenario= 20;
  comment = "d = 0";
  repeat(2) @(posedge clk_r);

  // Scenario 30 d = 1
  scenario= 30;
  comment = "d = 1";
  #0.5;
  d_r     = 1'b1;
  repeat(2) @(posedge clk_r);

  // Scenario 40 d = 0
  scenario= 40;
  comment = "d = 0";
  #0.5;
  d_r     = 1'b0;
  repeat(2) @(posedge clk_r);

  // Scenario 50; d=0, clk=1, d=pulse, d=0
  scenario= 50;
  comment = "d=0, clk=1, d=pulse, d=0";
  @(negedge clk_r);
  #1;
  d_r     = 1'b0;
  @(posedge clk_r);
  #1;
  repeat(20) #0.1 d_r = !d_r;
  @(posedge clk_r);
  #1;
  repeat(20) #0.1 d_r = !d_r;
  @(posedge clk_r);

  // Scenario 60; d=1, clk=1, d=pulse, 1=0
  scenario= 60;
  comment = "d=1, clk=1, d=pulse, 1=0";
  @(negedge clk_r);
  #1;
  d_r     = 1'b1;
  @(posedge clk_r);
  #1;
  repeat(20) #0.1 d_r = !d_r;
  @(posedge clk_r);
  #1;
  repeat(20) #0.1 d_r = !d_r;
  @(posedge clk_r);

////////////////////

  // Scenario 70; d=0, clk=0, d=pulse, d=0
  scenario= 70;
  comment = "d=0, clk=0, d=pulse, d=0";
  @(posedge clk_r);
  #1;
  d_r     = 1'b0;
  @(negedge clk_r);
  #1;
  repeat(20) #0.1 d_r = !d_r;
  @(negedge clk_r);
  #1;
  repeat(20) #0.1 d_r = !d_r;
  @(posedge clk_r);

  // Scenario 80; d=1, clk=1, d=pulse, 1=0
  scenario= 80;
  comment = "d=1, clk=1, d=pulse, 1=0";
  @(posedge clk_r);
  #1;
  d_r     = 1'b1;
  @(negedge clk_r);
  #1;
  repeat(20) #0.1 d_r = !d_r;
  @(negedge clk_r);
  #1;
  repeat(20) #0.1 d_r = !d_r;




  repeat(20) @(posedge clk_r);


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



