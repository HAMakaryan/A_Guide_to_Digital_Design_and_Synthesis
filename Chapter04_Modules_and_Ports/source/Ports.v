

  //  Example 4-2 List of Ports
  module fulladd4(sum, c_out, a, b, c_in); //Module with a list of ports
  module Top; // No list of ports, top-level module in simulation

  //  Example 4-3 Port Declarations
  module fulladd4(sum, c_out, a, b, c_in);
  //Begin port declarations section
  output[3:0] sum;
  output c_cout;
  input [3:0] a, b;
  input c_in;
  //End port declarations section
  ...
  <module internals>
  ...
  endmodule
// or
  module fulladd4(
    output  [3:0] sum,
    output        c_out,
    input   [3:0] a,
    input   [3:0] b,
    input         c_in
  );
  ...
  <module internals>
  ...
  endmodule

  //  Example 4-4 Port Declarations for DFF
  module DFF(
    output  reg   q_o,
    input   wire  d_i,
    input   wire  clk_i,
    input   wire  reset_i
  );
  ...
  ...
  endmodule

    //  Unconnected ports
  fulladd4 fa0(SUM, , A, B, C_IN); // Output port c_out is unconnected

  //  Example 4-6 Illegal Port Connection
  module Top;
  //Declare connection variables
  reg [3:0]A,B;
  reg C_IN;
  reg [3:0] SUM;
  wire C_OUT;
  //Instantiate fulladd4, call it fa0
  fulladd4 fa0(SUM, C_OUT, A, B, C_IN);
  //Illegal connection because output port sum in module fulladd4
  //is connected to a register variable SUM in module Top.
  ...
  ...
  (*stimulus*)
  ...
  ...
  endmodule

  //  4.2.4 Connecting Ports to External Signals
    //  Connecting by ordered list
  module Top;
  //Declare connection variables
  reg [3:0]A,B;
  reg C_IN;
  wire [3:0] SUM;
  wire C_OUT;
  //Instantiate fulladd4, call it fa_ordered.
  //Signals are connected to ports in order (by position)
  fulladd4 fa_ordered(SUM, C_OUT, A, B, C_IN);
  ...
  (*stimulus*)
  ...
  endmodule

  module fulladd4(sum, c_out, a, b, c_in);
  output[3:0] sum;
  output c_cout;
  input [3:0] a, b;
  input c_in;
  ...
  (*module internals*)
  ...
  endmodule

    //  Connecting ports by name
  // Instantiate module fa_byname and connect signals to ports by name
  fulladd4 fa_byname(
    .c_out(C_OUT),
    .sum  (SUM)  ,
    .b    (B)    ,
    .c_in (C_IN) ,
    .a    (A)
  );
  // Instantiate module fa_byname and connect signals to ports by name
  fulladd4 fa_byname(
    .c_out(C_OUT),
    .sum  (SUM)  ,
    .b    (B)    ,
    .a    (A)
  );

  //  Example 4-8 Hierarchical Names
  stimulus                  stimulus.q
  stimulus.qbar             stimulus.set
  stimulus.reset            stimulus.m1
  stimulus.m1.Q             stimulus.m1.Qbar
  stimulus.m1.S             stimulus.m1.R
  stimulus.m1.n1            stimulus.m1.n2





