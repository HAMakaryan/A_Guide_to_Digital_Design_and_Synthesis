// Define the module T_FF. It instantiates a D-flipflop. We assumed
// that module D-flipflop is defined elsewhere in the design. Refer
// to Figure 2-4 for interconnections.
module T_FF(q, clk, reset);     //Declarations to be explained later
    output q;
    input clk, reset;

    wire d;

    D_FF dff0  // Instantiate D_FF. Call it dff0.
    (
      .q    (q    ),
      .d    (d    ),
      .clk  (clk  ),
      .reset(reset)
    );

    not n1(d, q); // not gate is a Verilog primitive. Explained later.

endmodule






