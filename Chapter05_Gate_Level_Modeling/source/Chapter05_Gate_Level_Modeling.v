//file -- Chapter05_Gate_Level_Modeling

  //  Example 5-1 Gate Instantiation of And/Or Gates

wire OUT, IN1, IN2;

// basic gate instantiations.
and   a1  (OUT, IN1, IN2);
nand  na1 (OUT, IN1, IN2);
or    or1 (OUT, IN1, IN2);
nor   nor1(OUT, IN1, IN2);
xor   x1  (OUT, IN1, IN2);
xnor  nx1 (OUT, IN1, IN2);

// More than two inputs; 3 input nand gate
nand na1_3inp(OUT, IN1, IN2, IN3);

// gate instantiation without instance name
and (OUT, IN1, IN2); // legal gate instantiation

  //  5.1.2 Buf/Not Gates

    //  Example 5-2 Gate Instantiations of Buf/Not Gates
  // basic gate instantiations.
buf b1(OUT1, IN);
not n1(OUT1, IN);
  // More than two outputs
buf b1_2out(OUT1, OUT2, IN);
  // gate instantiation without instance name
not (OUT1, IN); // legal gate instantiation

  //  Bufif/notif
    //  Gates with an additional control signal on buf and not
    //  gates are also available.
bufif1 notif1 bufif0 notif0

    //Instantiation of bufif gates.
bufif1 b1 (out, in, ctrl);
bufif0 b0 (out, in, ctrl);

    //Instantiation of notif gates
notif1 n1 (out, in, ctrl);
notif0 n0 (out, in, ctrl);

  //  5.1.3 Array of Instances
wire [7:0] OUT, IN1, IN2;

// basic gate instantiations.
nand n_gate[7:0](OUT, IN1, IN2);

// This is equivalent to the following 8 instantiations
nand n_gate0(OUT[0], IN1[0], IN2[0]);
nand n_gate1(OUT[1], IN1[1], IN2[1]);
nand n_gate2(OUT[2], IN1[2], IN2[2]);
nand n_gate3(OUT[3], IN1[3], IN2[3]);
nand n_gate4(OUT[4], IN1[4], IN2[4]);
nand n_gate5(OUT[5], IN1[5], IN2[5]);
nand n_gate6(OUT[6], IN1[6], IN2[6]);
nand n_gate7(OUT[7], IN1[7], IN2[7]);


