// Define the test-bench module (no ports)
module mux4_to_1_tb;

// Declare variables to be connected
// to inputs
reg IN0;
reg IN1;
reg IN2;
reg IN3;
reg S1 ;
reg S0 ;

// Declare output wire
wire OUTPUT;

// Instantiate the multiplexer
mux4_to_1 mymux (
  .out(OUTPUT),
  .i0 (IN0)   ,
  .i1 (IN1)   ,
  .i2 (IN2)   ,
  .i3 (IN3)   ,
  .s1 (S1)    ,
  .s0 (S0)
);

// Stimulate the inputs
// Define the stimulus module (no ports)
initial
begin
// set input lines
IN0 = 1; IN1 = 0; IN2 = 1; IN3 = 0;
#1 $display("IN0= %b, IN1= %b, IN2= %b, IN3= %b\n",IN0,IN1,IN2,IN3);
// choose IN0
S1 = 0; S0 = 0;
#1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
// choose IN1
S1 = 0; S0 = 1;
#1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
// choose IN2
S1 = 1; S0 = 0;
#1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
// choose IN3
S1 = 1; S0 = 1;
#1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
end
endmodule


