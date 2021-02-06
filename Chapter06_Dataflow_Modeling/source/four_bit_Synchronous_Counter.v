//    file four_bit_Synchronous_Counter.v

module four_bit_Synchronous_Counter (
  input         clear,
  input         clock,
  input         cnt_en,
  output  [3:0] q
);

wire  en_1;
wire  en_2;
wire  en_3;

assign  en_1 = cnt_en & q[0];
assign  en_2 = en_1   & q[1];
assign  en_3 = en_2   & q[2];

Master_Slave_JK_flipflop counter_0 (

  .j     (cnt_en),
  .k     (cnt_en),
  .clock (clock),
  .clear (clear),
  .q     (q[0]),
  .qbar  ()
);

Master_Slave_JK_flipflop counter_1 (

  .j     (en_1),
  .k     (en_1),
  .clock (clock),
  .clear (clear),
  .q     (q[1]),
  .qbar  ()
);

Master_Slave_JK_flipflop counter_2 (

  .j     (en_2),
  .k     (en_2),
  .clock (clock),
  .clear (clear),
  .q     (q[2]),
  .qbar  ()
);

Master_Slave_JK_flipflop counter_3 (

  .j     (en_3),
  .k     (en_3),
  .clock (clock),
  .clear (clear),
  .q     (q[3]),
  .qbar  ()
);

//wire  a;
//wire  b;
//wire  y;
//wire  ybar;
//wire  c;
//wire  d;
//wire  cbar;
//
//assign a    = ~(qbar  & j     & clock & clear );
//assign y    = ~(a     & ybar                  );
//assign c    = ~(y     & cbar                  );
//assign q    = ~(c     & qbar                  );
//
//assign b    = ~(clock & k     & q             );
//assign ybar = ~(y     & clear & b             );
//assign d    = ~(clock & cbar  & ybar          );
//assign qbar = ~(q     & clear & d             );


endmodule
