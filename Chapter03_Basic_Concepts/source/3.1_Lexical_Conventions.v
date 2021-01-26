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
    \a+b-c
    \**my_name**


