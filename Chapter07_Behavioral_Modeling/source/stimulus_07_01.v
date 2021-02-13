// Example 07_01_initial_Statement.v

module stimulus_07_01;

reg x;
reg y;
reg a;
reg b;
reg m;

initial
m = 1'b0;       //single statement; does not need to be grouped

initial
begin
  # 5 a = 1'b1; //multiple statements; need to be grouped
  #25 b = 1'b0;
end

initial
begin
  #10 x = 1'b0;
  #25 y = 1'b1;
end

initial #50 $finish;

endmodule
/////////////////////////////

/*  Example 7-2 Initial Value Assignment */

  //The clock variable is defined first
reg clock;

  //The value of clock is set to 0
initial clock = 0;

//Instead of the above method, clock variable
//can be initialized at the time of declaration
//This is allowed only for variables declared
//at module level.
  reg clock = 0;

/////////////////////////////
//  Example 7-3 Combined Port/Data Declaration and Variable Initialization
module adder (sum, co, a, b, ci);

output reg [7:0]  sum = 0; //Initialize 8 bit output sum
output reg        co  = 0; //Initialize 1 bit output co
input      [7:0]  a;
input             b;
input             ci;
  ......
  ......
endmodule

/////////////////////////////

//Example 7-4 Combined ANSI C Port Declaration and Variable Initialization
module adder (
  output reg  [7:0] sum = 0, //Initialize 8 bit output
  output reg        co  = 0, //Initialize 1 bit output co
  input       [7:0] a;
  input             b;
  input ci
);
--
--
endmodule
/////////////////////////////

//Example 7-5 always Statement
module clock_gen (
  output reg clock
);
//Initialize clock at time zero

initial
clock = 1'b0;

//Toggle clock every half-cycle (time period = 20)
always
#10 clock = ~clock;

initial
  #1000 $finish;
endmodule

/////////////////////////////
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
  #15 reg_a    [2] = 1'b1;      //Bit select assignment with delay
  #10 reg_b[15:13] = {x, y, z}  //Assign result of concatenation to
                                // part select of a vector
  count = count + 1;            //Assignment to an integer (increment)
end

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

/////////////////////////////
/////////////////////////////

