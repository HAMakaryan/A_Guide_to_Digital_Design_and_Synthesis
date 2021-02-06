//    file 06_04_07_Shift_Operators.v

`timescale 10ns/1ns

module Shift_Operators;

reg         [7:0] operand_1;
reg signed  [7:0] operand_2;
reg signed  [7:0] operand_3;

reg         [1:0] a;


initial
begin
  $monitor($time, "op1 = %b\to2 = %b\to3 = %b\t", operand_1, operand_2, operand_3);
  operand_1 = -15;
  operand_2 = operand_1 >> 3;
  operand_3 = operand_1 << 3;
  #10;
  operand_2 = operand_1 >>> 3;
  operand_3 = operand_1 <<< 3;
  #10;
  operand_1 = -50;
  operand_2 = operand_1 >> 3;
  operand_3 = operand_1 << 3;
  #10;
  operand_2 = operand_1 >>> 3;
  operand_3 = operand_1 <<< 3;
  #10;
  operand_1 = -127;
  operand_2 = operand_1 >> 3;
  operand_3 = operand_1 << 3;
  #10;
  operand_2 = operand_1 >>> 3;
  operand_3 = operand_1 <<< 3;
  #10;
  operand_1 = 15;
  operand_2 = operand_1 >> 3;
  operand_3 = operand_1 << 3;
  #10;
  operand_2 = operand_1 >>> 3;
  operand_3 = operand_1 <<< 3;
  #10;
  operand_1 = 50;
  operand_2 = operand_1 >> 3;
  operand_3 = operand_1 << 3;
  #10;
  operand_2 = operand_1 >>> 3;
  operand_3 = operand_1 <<< 3;
  #10;
  operand_1 = 127;
  operand_2 = operand_1 >> 3;
  operand_3 = operand_1 << 3;
  #10;
  operand_2 = operand_1 >>> 3;
  operand_3 = operand_1 <<< 3;
  #10;
  a=01;
  operand_1 = {2{a,a}};
  #10;

  a=10;
  operand_1 = {2{a,a}};
  #10;


  $stop;
end

endmodule