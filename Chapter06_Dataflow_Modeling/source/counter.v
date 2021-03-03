// Ripple counter
module counter(
  output  [3:0] Q ,
  input         clock,
  input         clear
);

// Instantiate the T flipflops
T_FF  tff0(
  .q      (Q[0]),
  .clk    (clock),
  .clear  (clear)
);

T_FF  tff1(
  .q      (Q[1]),
  .clk    (Q[0]),
  .clear  (clear)
);

T_FF  tff2(
  .q      (Q[2]),
  .clk    (Q[1]),
  .clear  (clear)
);

T_FF  tff3(
  .q      (Q[3]),
  .clk    (Q[2]),
  .clear  (clear)
);

endmodule

