//    file Master_Slave_JK_flipflop.v

module Master_Slave_JK_flipflop(
  input   j,
  input   k,
  input   clock,
  input   clear,
  output  q,
  output  qbar
);

wire  a;
wire  b;
wire  y;
wire  ybar;
wire  c;
wire  d;
wire  cbar;

assign cbar = ~clock;

assign a    = ~(qbar  & j     & clock & clear );
assign y    = ~(a     & ybar                  );
assign c    = ~(y     & cbar                  );
assign q    = ~(c     & qbar                  );

assign b    = ~(clock & k     & q             );
assign ybar = ~(y     & clear & b             );
assign d    = ~(cbar  & ybar                  );
assign qbar = ~(q     & clear & d             );


endmodule
