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


`define NONBLOCKING

/////////////////////////////
/*
  There are two types of procedural assignment statements:
    blocking and nonblocking.
*/

`ifdef BLOCKING

  //  Example 7-6 Blocking Statements
reg         x, y, z;
reg [15:0]  reg_a, reg_b;
integer     count;

//All behavioral statements must be inside an initial or always block
initial
begin
  x = 0;                        //Scalar assignments
  y = 1;
  z = 1;
  count = 0;                    //Assignment to integer variables
  reg_a = 16'b0;                //initialize vectors
  reg_b = reg_a;
  #15 reg_a[    2] = 1'b1;      //Bit select assignment with delay
  #10 reg_b[15:13] = {x, y, z}; //Assign result of concatenation to
                                // part select of a vector
  count = count + 1;            //Assignment to an integer (increment)
end
`else

/////////////////////////////
//  Example 7-7 Nonblocking Assignments
reg           x, y, z;
reg   [15:0]  reg_a, reg_b;
integer       count;

//All behavioral statements must be inside an initial or always block
initial
begin
  x = 0;                  //Scalar assignments
  y = 1;
  z = 1;
  count = 0;              //Assignment to integer variables
  reg_a = 16'b0;          //Initialize vectors
  reg_b = reg_a;
  reg_a[2]      <= #15 1'b1;      //Bit select assignment with delay
  reg_b[15:13]  <= #10 {x, y, z}; //Assign result of concatenation
                                  //to part select of a vector
  count <= count + 1;             //Assignment to an integer (increment)
end
`endif

initial
begin
  $monitor($time,"\tx=%d\ty=%d\tz=%d\tcount=%d\treg_a=%d\treg_b=%d", x, y, z, count, reg_a, reg_b);
  #200 $stop;
end

/////////////////////////////
/////////////////////////////





endmodule

