//    file 06_04_07_Shift_Operators.v

`timescale 10ns/1ns

module Shift_Operators;

reg signed  [7:0] operand_1;
reg signed  [7:0] operand_2;
reg signed  [7:0] operand_3;

initial
begin
  $monitor($time, "operand_1 = %b\toperand_2 = %b\toperand_3 = %b\t", operand_1, operand_2, operand_3);
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
  $stop;
end

endmodule