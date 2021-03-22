// Example 07_02_Procedural_Assignments.v

`timescale 1ns/10ps

module Procedural_Assignments;


/************** 7.2 Procedural Assignments  *******************/
/*

    assignment ::= variable_lvalue = [ delay_or_event_control ] expression

The left-hand side of a procedural assignment <lvalue> can be one of the following:
 -- A reg, integer, real, or time register variable or a memory element
 -- A bit select of these variables (e.g., addr[0])
 -- A part select of these variables (e.g., addr[31:16])
 -- A concatenation of any of the above
*/

reg   clock = 0;
reg   a = 0;
reg   b = 1;

reg   temp_a;
reg   temp_b;


localparam in_1   = 2'b10;
localparam in_2   = 2'b00;
localparam in_3   = 2'b11;

reg   [1:0] reg_1 = 2'b01;
reg   [1:0] reg_2 = 2'b10;
reg   [1:0] reg_3 = 2'b11;

reg         x, y, z;
reg [15:0]  reg_a, reg_b;
integer     count;


always
begin
  #5 clock=!clock;
end

`define __NONBLOCKING //BLOCKING // NONBLOCKING

/////////////////////////////
/*
  There are two types of procedural assignment statements:
    blocking and nonblocking.
*/

`ifdef BLOCKING
  //  Example 7-6 Blocking Statements
//All behavioral statements must be inside an initial or always block

initial
begin
  $display("\n\t\tBlocking Assignments");
  x                = 0;         //Scalar assignments
  y                = 1;
  z                = 1;
  count            = 0;         //Assignment to integer variables
  reg_a            = 16'b0;     //initialize vectors
  reg_b            = reg_a;
  #15 reg_a[    2] = 1'b1;      //Bit select assignment with delay
  #10 reg_b[15:13] = {x, y, z}; //Assign result of concatenation to
                                // part select of a vector
  count = count + 1;            //Assignment to an integer (increment)
end


always @(posedge clock)
begin
  b = a;
end

always @(posedge clock)
begin
  a = b;
end

/*
*/
`elsif NONBLOCKING

/////////////////////////////
//  Example 7-7 Nonblocking Assignments
//All behavioral statements must be inside an initial or always block
initial
begin
  $display("\n\t\tNonblocking Assignments");
  x              = 0;             //Scalar assignments
  y              = 1;
  z              = 1;
  count          = 0;             //Assignment to integer variables
  reg_a          = 16'b0;         //Initialize vectors
  reg_b          = reg_a;
  #1;
  reg_a[2]      <= #15 1'b1;      //Bit select assignment with delay
  reg_b[15:13]  <= #10 {x, y, z}; //Assign result of concatenation
  #1;                             //to part select of a vector
  count         <= count + 1;     //Assignment to an integer (increment)
end


always @(posedge clock)
begin
//  reg_1 <= #1 in_1;
  reg_1 <= #1 reg_1 + 1;
  reg_2 <= @(negedge clock) in_2 ^ in_3;
  reg_3 <= #36 reg_1; //The old value of reg1
end

always @(posedge clock)
begin
  a <= b;
end

always @(posedge clock)
begin
  b <= a;
end

/*

*/
`else

  //Emulate the behavior of nonblocking assignments by
  //using temporary variables and blocking assignments
always @(posedge clock)
begin
//Read operation
//store values of right-hand-side expressions in temporary variables
  temp_a = a;
  temp_b = b;
//Write operation
//Assign values of temporary variables to left-hand-side variables
  a = temp_b;
  b = temp_a;
end

`endif

initial
begin
  $monitor($time,"\tx=%d\ty=%d\tz=%d\tcount=%D\treg_a=%H\treg_b=%H\ta=%d\tb=%d"
                    , x,     y,     z,    count,  reg_a,    reg_b,    a,    b);
  #200 $stop;
end

/////////////////////////////
/////////////////////////////





endmodule

