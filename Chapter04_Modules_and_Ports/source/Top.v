// Module name and port list
// Stimulus module
`timescale 10ns/10ps
module Top;
// Declarations of wire, reg, and other variables
wire  q;
wire  qbar;
reg   set;
reg   reset;

// Instantiate lower-level modules
// In this case, instantiate SR_latch
// Feed inverted set and reset signals to the SR latch
SR_latch m1(
  .Q   (q),
  .Qbar(qbar),
  .Sbar(~set),
  .Rbar(~reset)
);

// Behavioral block, initial
initial
begin
  $monitor($time, " set = %b, reset= %b, q= %b\n",set,reset,q);
  set       = 0;
  reset     = 0;
  #5 reset  = 1;
  #5 reset  = 0;
  #5 set    = 1;
end

// endmodule statement
endmodule
