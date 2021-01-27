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
    -6'd3   // 8-bit negative number stored as 2's complement of 3
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

