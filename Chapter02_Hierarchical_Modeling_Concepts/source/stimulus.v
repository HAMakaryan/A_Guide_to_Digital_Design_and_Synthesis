`timescale 1ns/10ps


module stimulus;

reg clk;
reg reset;
wire[3:0] q;

// instantiate the design block

ripple_carry_counter DUT
(
  .q    (q),
  .clk  (clk),
  .reset(reset)
);


// Control the clk signal that drives the design block. Cycle time = 10

always
begin
  clk = 1'b0;
  #50;
  clk = 1'b1;
  #50;
end

// Control the reset signal that drives the design block
// reset is asserted from 0 to 20 and from 200 to 220.
initial
begin
  reset = 1'b1;
  #15 reset = 1'b0;
  #180 reset = 1'b1;
  #10 reset = 1'b0;
  #20 $finish; //terminate the simulation
end

// Monitor the outputs
initial
begin
  $monitor($time, " Output q = %d", q);
end

endmodule
