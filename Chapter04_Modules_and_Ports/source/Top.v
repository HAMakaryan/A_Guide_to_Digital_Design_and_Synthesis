// Module name and port list
// Stimulus module
`timescale 10ns/10ps
module Top;
// Declarations of wire, reg, and other variables
wire  q;
wire  qbar;
reg   set_n;
reg   reset_n;

// Instantiate lower-level modules
// In this case, instantiate SR_latch
// Feed inverted set and reset signals to the SR latch
SR_latch m1(
  .Q   (q),
  .Qbar(qbar),
  .Sbar(set_n),
  .Rbar(reset_n)
);

// Behavioral block, initial
initial
begin
  $monitor($time, " set_n = %b, reset_n= %b, q= %b\n",set_n,reset_n,q);
  set_n       = 0;
  reset_n     = 1;
  #5 ;
  set_n       = 1;
  reset_n     = 1;
  #5 ;

  set_n       = 1;
  reset_n     = 0;
  #5 ;
  set_n       = 1;
  reset_n     = 1;
  #5 ;

  set_n       = 0;
  reset_n     = 0;
  #5 ;
  set_n       = 1;
  reset_n     = 1;
  #5 ;


  set_n       = 0;
  reset_n     = 0;
  #5 ;
  set_n       = 1;
  reset_n     = 1;
  #5 ;


  set_n       = 0;
  reset_n     = 0;
  #5 ;
  set_n       = 1;
  reset_n     = 1;
  #5 ;


  reset_n     = 0;
  set_n       = 0;
  #5 ;
  set_n       = 1;
  reset_n     = 1;
  #5 ;


  set_n       = 0;
  reset_n     = 0;
  #5 ;
  set_n       = 1;
  reset_n     = 1;
  #5 ;



  #5 ;
  $stop;
end

// endmodule statement
endmodule
