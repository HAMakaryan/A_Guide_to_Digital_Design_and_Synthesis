// Define the top-level module called ripple carry
// counter. It instantiates 4 T-flipflops. Interconnections are
// shown in Section 2.2, 4-bit Ripple Carry Counter.
module ripple_carry_counter(
  q,
  clk,
  reset
);

output [3:0] q;     //I/O signals and vector declarations
                    //will be explained later.
input clk, reset;   //I/O signals will be explained later.

//Four instances of the module T_FF are created. Each has a unique
//name.Each instance is passed a set of signals. Notice, that
//each instance is a copy of the module T_FF.

    T_FF tff0
    (
      .q    (q[0]),
      .clk  (clk),
      .reset(reset)
    );

    T_FF tff1
    (
      .q    (q[1]),
      .clk  (q[0]),
      .reset(reset)
    );

    T_FF tff2
    (
      .q    (q[2]),
      .clk  (q[1]),
      .reset(reset)
    );

    T_FF tff3
    (
      .q    (q[3]),
      .clk  (q[2]),
      .reset(reset)
    );

endmodule



