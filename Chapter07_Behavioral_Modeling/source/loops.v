`timescale 1ns/1ps

//  while
//  for
//  repeat
//  forever

module loops;

        /*    Example 7-22 While Loop */

//Illustration 1: Increment count from 0 to 127. Exit at count 128.
//Display the count variable.

integer count;

initial
begin
  #1;
  count = 0;
  while (count < 128) //Execute loop till count is 127.
                      //exit at count 128
  begin
//    $display("Count = %d", count);
    count = count + 1;
    #1;
  end
end

//Illustration 2: Find the first bit with a value 1 in flag (vector variable)

`define TRUE  1'b1;
`define FALSE 1'b0;

reg     [15:0]  flag;
integer         i; //integer to keep count
reg Continue;

initial
begin
  flag = 16'b 0010_0000_0000_0000;
  i = 0;
  Continue = `TRUE
  while((i < 16) && Continue ) //Multiple conditions using operators.
  begin
    if (flag[i])
    begin
//      $display("Encountered a TRUE bit at element number %d", i);
      Continue = `FALSE
    end
    i = i + 1;
  end
end


/*    Example 7-23 For Loop   */

integer Count;
initial
begin
  for ( Count=0; Count < 128; Count = Count + 1)
  begin
    $display("COUNT = %d", Count);
  end
end


endmodule






