//  Module 4-to-1 multiplexer.
//  Port list is taken exactly from the I/O diagram.
module mux4_to_1 (
  output  out,
  input   i0 ,
  input   i1 ,
  input   i2 ,
  input   i3 ,
  input   s1 ,
  input   s0
);

// Internal wire declarations
wire  s1n;
wire  s0n;
wire  y0 ;
wire  y1 ;
wire  y2 ;
wire  y3 ;

// Gate instantiations

// Create s1n and s0n signals.
  not (s1n, s1);
  not (s0n, s0);

// 3-input and gates instantiated
  and (y0, i0, s1n, s0n);
  and (y1, i1, s1n, s0 );
  and (y2, i2, s1 , s0n);
  and (y3, i3, s1 , s0 );

// 4-input or gate instantiated
  or (out, y0, y1, y2, y3);

endmodule
