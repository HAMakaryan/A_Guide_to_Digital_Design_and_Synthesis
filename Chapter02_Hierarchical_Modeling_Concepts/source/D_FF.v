// module D_FF with synchronous reset
module D_FF(
  q,
  d,
  clk,
  reset
);

output  q;

input   d;
input   clk;
input   reset;

reg q;

// Lots of new constructs. Ignore the functionality of the constructs.
// Concentrate on how the design block is built in a top-down fashion.

always @(posedge reset or negedge clk)
begin
  if (reset)
  begin
    q <= 1'b0;
  end else
  begin
    q <= d;
  end
end

endmodule
