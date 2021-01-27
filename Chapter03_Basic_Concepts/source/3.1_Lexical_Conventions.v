/*
3.1_Lexical_Conventions
*/

  /*
    3.1.1 Whitespace
    Blank spaces (\b) " "
    Tabs         (\t) "	"
    Newlines     (\n) "
"
  */


  /*
    3.1.2 Comments
  */

a = b && c; // This is a one-line comment

/* This is a multiple line
comment */

/* This is /* an illegal */ comment */

/* This is //a legal comment */

/*
  3.1.3 Operators
*/
a = ~ b;        // ~ is a unary operator.     b is the operand
a = b && c;     // && is a binary operator.   b and c are operands
a = b ? c : d;  // ?: is a ternary operator.  b, c and d are operands


/*
  3.1.4 Number Specification
*/

  //  Sized numbers
    4'b1111 // This is a 4-bit binary number
    12'habc // This is a 12-bit hexadecimal number
    16'd255 // This is a 16-bit decimal number.

  //  Unsized numbers
    23456   // This is a 32-bit decimal number by default
    'hc3    // This is a 32-bit hexadecimal number
    'o21    // This is a 32-bit octal number

  //  X or Z values
    12'h13x // This is a 12-bit hex number; 4 least significant bits unknown
    6'hx    // This is a 6-bit hex unknown number
    32'bz   // This is a 32-bit high impedance number

  //  Negative numbers
    -6'd3   // 8-bit negative number stored as 2`s complement of 3
    -6'sd3  // Used for performing signed integer math
    4'd-2   // Illegal specification

  //  Underscore characters and question marks
    12'b1111_0000_1010  // Use of underline characters for readability
    4'b10??             // Equivalent of a 4'b10zz

  //  3.1.5 Strings
    "Hello Verilog World" // is a string
    "a / b"               // is a string

  //  3.1.6 Identifiers and Keywords
    reg value; // reg is a keyword; value is an identifier
    input clk; // input is a keyword, clk is an identifier

  //  3.1.7 Escaped Identifiers
  /*
  Escaped identifiers shall start with the backslash character (\) and end
with white space (space, tab, newline). They provide a means of including any
of the printable ASCII characters in an identifier (the decimal values 33
through 126, or 21 through 7E in hexadecimal).
  Neither the leading backslash character nor the terminating white space is
considered to be part of the identifier. Therefore, an escaped identifier
\cpu3 is treated the same as a nonescaped identifier cpu3.
  For example:
  */
    \busa+index
    \-clock
    \***error-condition***
    \net1/\net2
    \{a,b}
    \a*(b+c)
    \a+b-c
    \**my_name**

/******* 3.2 Data Types *********/

  //  3.2.1 Value Set
  /*
  The Verilog HDL value set consists of four basic values:
    0 - represents a logic zero, or a false condition
    1 - represents a logic one, or a true condition
    x - represents an unknown logic value
    z - represents a high-impedance state
  The values 0 and 1 are logical complements of one another.
  */

  //  3.2.2 Nets
  /*
  The default value of a net is z (except the trireg net, which
  defaults to x ). Nets get the output value of their drivers.
  If a net has no driver, it gets the value z.
  */
    wire a;         // Declare net a for the above circuit
    wire b,c;       // Declare two wires b,c for the above circuit
    wire d = 1'b0;  // Net d is fixed to logic value 0 at declaration.

  //  3.2.3 Registers
  /*
  Register data types are commonly declared by the keyword reg.
  The default value for a reg data type is x.
  An example of how registers are used is shown Example 3-1.
  */
      //  Example 3-1 - Example of Register
  reg reset;          // declare a variable reset that can hold its value
  initial             // this construct will be discussed later
  begin
    reset = 1'b1;     //initialize reset to 1 to reset the digital circuit.
    #100 reset = 1'b0;// after 100 time units reset is deasserted.
  end
      //  Example 3-2 - Signed Register Declaration
  reg signed [63:0] m;  // 64 bit signed value
  integer i;            // 32 bit signed value

  //  3.2.4 Vectors
  wire a;                     // scalar net variable, default
  wire [7:0] bus;             // 8-bit bus
  wire [31:0] busA,busB,busC; // 3 buses of 32-bit width.
  reg clock;                  // scalar register, default
  reg [0:40] virtual_addr;    // Vector register, virtual address 41 bits wide
    //  Vector Part Select
    busA[7]     // bit # 7 of vector busA
    bus[2:0]    // Three least significant bits of vector bus,
                // using bus[0:2] is illegal because the significant bit should
                // always be on the left of a range specification
    virtual_addr[0:1] // Two most significant bits of vector virtual_addr
    //  Variable Vector Part Select
    reg [255:0] data1; //Little endian notation
    reg [0:255] data2; //Big endian notation
    reg [7:0]   byte;
    //Using a variable part select, one can choose parts
        byte = data1[31-:8]; //starting bit = 31, width =8 => data1[31:24]
        byte = data1[24+:8]; //starting bit = 24, width =8 => data1[31:24]
        byte = data2[31-:8]; //starting bit = 31, width =8 => data2[24:31]
        byte = data2[24+:8]; //starting bit = 24, width =8 => data2[24:31]
    //The starting bit can also be a variable. The width has
    //to be constant. Therefore, one can use the variable part select
    //in a loop to select all bytes of the vector.
    for (j=0; j<=31; j=j+1)
    begin
      byte = data1[(j*8)+:8]; //Sequence is [7:0], [15:8]... [255:248]
    end
    //Can initialize a part of the vector
    data1[(byteNum*8)+:8] = 8'b0; //If byteNum = 1, clear 8 bits [15:8]

    //  3.2.5 Integer , Real, and Time Register Data Types
        //  Integer
    integer counter; // general purpose variable used as a counter.
    initial
    begin
      counter = -1; // A negative one is stored in the counter
    end
        //  Real
    real delta;     // Define a real variable called delta
    initial
    begin
      delta = 4e10; // delta is assigned in scientific notation
      delta = 2.13; // delta is assigned a value 2.13
    end
    integer i;      // Define an integer i
    initial
    begin
      i = delta;    // i gets the value 2 (rounded value of 2.13)
    end
        //  Time
    time save_sim_time; // Define a time variable save_sim_time
    initial
    begin
      save_sim_time = $time; // Save the current simulation time
    end

  //  3.2.6 Arrays
  integer count [0 :  7]; // An array of 8 count variables
  reg     bool  [31:  0]; // Array of 32 one-bit boolean register variables
  time chk_point[ 1:100]; // Array of 100 time checkpoint variables
  reg [4:0] port_id[0:7]; // Array of 8 port_ids; each port_id is 5 bits wide
  integer matrix[4:0][0:255]; // Two dimensional array of integers
  reg [63:0] array_4d [15:0][7:0][7:0][255:0]; //Four dimensional array
  wire [7:0] w_array2 [5:0]; // Declare an array of 8 bit vector wire
  wire w_array1[7:0][5:0]; // Declare an array of single bit wires
    //    Examples of assignments to elements of arrays discussed above are
    //  shown below:
  count[5]        = 0;    // Reset 5th element of array of count variables
  chk_point[100]  = 0;    // Reset 100th time check point value
  port_id[3]      = 0;    // Reset 3rd element (a 5-bit value) of port_id array.
  matrix[1][0]    = 33559;// Set value of element indexed by [1][0] to 33559
  array_4d[0][0][0][0][15:0] = 0; //Clear bits 15:0 of the register
                                  //accessed by indices [0][0][0][0]
  port_id         = 0; // Illegal syntax - Attempt to write the entire array
  matrix [1]      = 0; // Illegal syntax - Attempt to write [1][0]..[1][255]

  //  3.2.7 Memories
  reg       mem1bit[0:1023]; // Memory mem1bit with 1K 1-bit words
  reg [7:0] membyte[0:1023]; // Memory membyte with 1K 8-bit words(bytes)
  membyte[511] // Fetches 1 byte word whose address is 511.

  //  3.2.8 Parameters
  parameter port_id = 5;            // Defines a constant port_id
  parameter cache_line_width = 256; // Constant defines width of cache line
  parameter signed [15:0] WIDTH;    // Fixed sign and range for parameter WIDTH

  localparam  state1 = 4'b0001,
              state2 = 4'b0010,
              state3 = 4'b0100,
              state4 = 4'b1000;

  //  3.2.9 Strings
  reg [8*18:1] string_value; // Declare a variable that is 18 bytes wide
  initial
  begin
    string_value = "Hello Verilog World"; // String can be stored in variable
  end
    //  Special Characters
/************************************************
    Escaped Characters Character Displayed
    \n                  newline
    \t                  tab
    \\                  \
    \"                  "
    \ddd  A character specified in 1–3 octal digits (0 <= d <= 7).
          If less than three characters are used, the following character
          shall not be an octal digit.
          Implementations may issue an error if the character
          represented is greater than \377.
/************************************************/

/******* 3.3 System Tasks and Compiler Directives *********/

  //  3.3.1 System Tasks
    //  Displaying information
    //  Usage: $display(p1, p2, p3,....., pn);
/************************************************
    Argument      Description
    %h or %H    Display in hexadecimal format
    %d or %D    Display in decimal format
    %o or %O    Display in octal format
    %b or %B    Display in binary format
    %c or %C    Display in ASCII character format
    %l or %L    Display library binding information
    %v or %V    Display net signal strength
    %m or %M    Display hierarchical name
    %s or %S    Display as a string
    %t or %T    Display in current time format
    %u or %U    Unformatted 2 value data
    %z or %Z    Unformatted 4 value data
/************************************************/

      //  Example 3-3 $display Task
  //Display the string in quotes
  $display("Hello Verilog World");
  -- Hello Verilog World

  //Display value of current simulation time 230
  $display($time);
  -- 230

  //Display value of 41-bit virtual address 1fe0000001c at time 200
  reg [0:40] virtual_addr;
  $display("At time %d virtual address is %h", $time, virtual_addr);
  -- At time 200 virtual address is 1fe0000001c

  //Display value of port_id 5 in binary
  reg [4:0] port_id;
  $display("ID of the port is %b", port_id);
  -- ID of the port is 00101

  //Display x characters
  //Display value of 4-bit bus 10xx (signal contention) in binary
  reg [3:0] bus;
  $display("Bus value is %b", bus);
  -- Bus value is 10xx

  //Display the hierarchical name of instance p1 instantiated under
  //the highest-level module called top. No argument is required. This
  //is a useful feature)
    $display("This string is displayed from %m level of hierarchy");
  -- This string is displayed from top.p1 level of hierarchy

      //  Example 3-4 Special Characters
  //Display special characters, newline and %
  $display("This is a \n multiline string with a %% sign");
  -- This is a
  -- multiline string with a % sign


    //  Monitoring information
/*
Verilog provides a mechanism to monitor a signal when its value changes.
This facility is provided by the $monitor task.
    Usage: $monitor(p1,p2,p3,....,pn);
*/
//  Two tasks are used to switch monitoring on and off.
    //  Usage:
    $monitoron;
    $monitoroff;
    //  Example 3-5 Monitor Statement
  //Monitor time and value of the signals clock and reset
  //Clock toggles every 5 time units and reset goes down at 10 time units
  initial
  begin
    $monitor($time, " Value of signals clock = %b reset = %b", clock,reset);
  end

//  Partial output of the monitor statement:
-- 0 Value of signals clock = 0 reset = 1
-- 5 Value of signals clock = 1 reset = 1
-- 10 Value of signals clock = 0 reset = 0

    //  Stopping and finishing in a simulation
      //  The task $stop is provided to stop during a simulation.
        //  Usage: $stop;
      //  The $finish task terminates the simulation.
        //  Usage: $finish;

  //  3.3.2 Compiler Directives
    //  `define
  //define a text macro that defines default word size
  //Used as `WORD_SIZE in the code
  `define WORD_SIZE 32
  //define an alias. A $stop will be substituted wherever `S appears
  `define S $stop;
  //define a frequently used text string
  `define WORD_REG reg [31:0]
  // you can then define a 32-bit register as `WORD_REG reg32;
    //  `include
// Include the file header.v, which contains declarations in the
// main verilog file design.v.
`include header.v
...
...
<Verilog code in file design.v>
...
...




