`timescale 1ns/1ps

module sig_control_tb;

reg clk;
reg rst;
reg x;

wire  [1:0] hwy;
wire  [1:0] cntry;

sig_control  DUT(
  .hwy    (hwy),
  .cntry  (cntry),
  .X      (x),
  .clock  (clk),
  .clear  (rst)
);


always
begin
  clk = 1'b0;
  #5;
  clk = 1'b1;
  #5;
end

initial
begin
  rst = 1'b1;
  #17;
  rst = 1'b0;
end


always
begin
  x = 1'b0;
  #500;
  x = 1'b1;
  #15;
end

endmodule
