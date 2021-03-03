module conditional_statements;
//Type 1 conditional statement. No else statement.
  //Statement executes or does not execute.
  /*     if (<expression>) true_statement ;
  */

//Type 2 conditional statement. One else statement
  //Either true_statement or false_statement is evaluated
  /*
    if (<expression>) true_statement ; else false_statement ;
  */

//Type 3 conditional statement. Nested if-else-if.
  //Choice of multiple statements. Only one is executed.
  /*
    if (<expression1>) true_statement1 ;
    else if (<expression2>) true_statement2 ;
    else if (<expression3>) true_statement3 ;
    else default_statement ;
  */

reg lock;
reg buffer;
reg data;
reg enable;
reg out;
reg in;
reg number_queued;
reg data_queue;
reg alu_control;
reg x;
reg y;
reg z;

localparam MAX_Q_DEPTH = 3;

initial
begin
//Type 1 statements
  if(!lock)
  begin
    buffer = data;
  end
  if(enable)
  begin
    out = in;
  end
end

//Type 2 statements
initial
begin
  if (number_queued < MAX_Q_DEPTH)
  begin
    data_queue = data;
    number_queued = number_queued + 1;
  end
  else
  begin
    $display("Queue Full. Try again");
  end
end

//Type 3 statements
//Execute statements based on ALU control signal.
initial
begin
  if (alu_control == 0)
  begin
    y = x + z;
  end
  else if(alu_control == 1)
  begin
    y = x - z;
  end
  else if(alu_control == 2)
  begin
    y = x * z;
  end
  else
  begin
    $display("Invalid ALU control signal");
  end
end

endmodule
