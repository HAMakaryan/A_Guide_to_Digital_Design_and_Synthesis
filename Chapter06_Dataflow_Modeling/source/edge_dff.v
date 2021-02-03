// file D_flipflop

module edge_dff(
  output  q,
  output  qbar,
  input   d,
  input   clk,
  input   clear
);

    // Internal variables
wire s, sbar, r, rbar,cbar;

// dataflow statements
//Create a complement of signal clear
assign cbar = ~clear;

  // Input latches; A latch is level sensitive. An edge-sensitive
  // flip-flop is implemented by using 3 SR latches.

assign sbar = ~(rbar & s);
assign s    = ~(sbar & cbar & ~clk);
assign r    = ~(rbar & ~clk & s);
assign rbar = ~(r & cbar & d);

// Output latch
assign q    = ~(s & qbar);
assign qbar = ~(q & r & cbar);


endmodule



