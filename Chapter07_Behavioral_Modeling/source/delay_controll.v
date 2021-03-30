`timescale 1ns/1ps

`define INTRA_ASSIGNMENT_DELAY // REGULAR_DELAY INTRA_ASSIGNMENT_DELAY

module delay_control;

/*
delay3 ::= # delay_value | # ( delay_value [ , delay_value [ ,delay_value ] ] )

delay2 ::= # delay_value | # ( delay_value [ , delay_value ] )
delay_value ::= 	unsigned_number
								| parameter_identifier
								| specparam_identifier
								| mintypmax_expression
*/


/*
There are three types of delay control for procedural assignments:
      .Regular delay control
      .Intra-assignment delay control
      .Zero delay control
*/

//		Regular delay control

//define parameters
parameter latency = 20;
parameter delta   =  2;
//define register variables
reg x, y, z, p, q, m, temp_pq;

`ifdef REGULAR_DELAY
initial
begin
  x = 0;      // no delay control
  #10 y = 1;  // delay control with a number. Delay execution of
              // y = 1 by 10 units

  #latency z = 0;           // Delay control with identifier. Delay of 20 units
  #(latency + delta) p = 1; // Delay control with expression
  #y x = x + 1;             // Delay control with identifier. Take value of y.
  #(4:5:6) q = 0;           // Minimum, typical and maximum delay values.
                            // Discussed in gate-level modeling chapter.
end

`elsif INTRA_ASSIGNMENT_DELAY
//intra assignment delays
initial
begin
  #0;
  y = #5 x + z; //Take value of x and z at the time=0, evaluate
                //x + z and then wait 5 time units to assign value to y.
end

initial
begin
  x = 0;
  z = 0;
  #1;
  x = 1;
  z = 1;
end


initial
begin
  p = 0;
  q = 0;
  temp_pq = p + q;//Take value of p + q at the current time and
                  //  store it in a temporary variable. Even though p and q
                  //  might change between 0 and 5,
  #5 m = temp_pq; //  the value assigned to y at time 5 is unaffected.
end

`endif


initial
begin
  #150;
  $stop;
end



endmodule