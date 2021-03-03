// Edge-triggered T-flipflop. Toggles every clock
// cycle.
module T_FF(
  output  q,
  input   clk,
  input   clear
);
// Instantiate the edge-triggered DFF
// Complement of output q is fed back.
// Notice qbar not needed. Unconnected port.

edge_dff  ff1(
  .q      (q),
  .qbar   (),
  .d      (~q),
  .clk    (clk),
  .clear  (clear)
);


endmodule



