module delay_control



/*
delay3 ::= # delay_value | # ( delay_value [ , delay_value [ ,delay_value ] ] )

delay2 ::= # delay_value | # ( delay_value [ , delay_value ] )
delay_value ::= 	unsigned_number
								| parameter_identifier
								| specparam_identifier
								| mintypmax_expression
*/

//	//		Regular delay control

//define parameters
parameter latency = 20;
parameter delta = 2;
//define register variables
reg x, y, z, p, q;
initial
begin

  x = 0;      // no delay control
  #10 y = 1;  // delay control with a number. Delay execution of
  // y = 1 by 10 units
  #latency z = 0; // Delay control with identifier. Delay of 20 units
  #(latency + delta) p = 1; // Delay control with expression
  #y x = x + 1; // Delay control with identifier. Take value of y.
  #(4:5:6) q = 0; // Minimum, typical and maximum delay values.
  //Discussed in gate-level modeling chapter.
end





endmodule