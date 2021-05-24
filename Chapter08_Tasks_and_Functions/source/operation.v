`timescale 1ns/1ps

//Define a module called operation that contains the task bitwise_oper
module operation;

parameter delay = 10;

reg [15:0] A;
reg [15:0] B;
reg [15:0] AB_AND;
reg [15:0] AB_OR;
reg [15:0] AB_XOR;
reg        clk;
reg        clk2;

always @(A or B) //whenever A or B changes in value
begin
//invoke the task bitwise_oper. provide 2 input arguments A, B
//Expect 3 output arguments AB_AND, AB_OR, AB_XOR
//The arguments must be specified in the same order as they
//appear in the task declaration.
  bitwise_oper_a(AB_AND, AB_OR, AB_XOR, A, B);
  bitwise_oper_b(AB_AND, AB_OR, AB_XOR, A, B);
end

//define task bitwise_oper
task bitwise_oper_a;
//outputs from the task
  output  [15:0] ab_and;
  output  [15:0] ab_or;
  output  [15:0] ab_xor;
//inputs to the task
  input   [15:0] a;
  input   [15:0] b; //inputs to the task
  begin
    #delay;
    ab_and  = a & b;
    ab_or   = a | b;
    ab_xor  = a ^ b;
  end
endtask

//define task bitwise_oper
task bitwise_oper_b (
  output  [15:0] ab_and,
  output  [15:0] ab_or,
  output  [15:0] ab_xor,
  input   [15:0] a,
  input   [15:0] b
);
  begin
    #delay;
    ab_and  = ~(a & b);
    ab_or   = ~(a | b);
    ab_xor  = ~(a ^ b);
  end
endtask


initial
begin
  A = 16'b0000_0000_1000_0000;   B = 16'b0100_1001_0010_0010; # 100;
  A = 16'b1000_0001_0000_0001;   B = 16'b0010_0100_0100_0001; # 100;
  A = 16'b0010_0010_0010_0001;   B = 16'b0001_0010_0100_0011; # 100;
  A = 16'b0100_0100_0010_0001;   B = 16'b0100_1000_0100_1000; # 100;
  A = 16'b0001_1000_0100_0001;   B = 16'b1000_0100_0101_1001; # 100;
  #500;
  $stop;
end



// Module that contains an automatic (re-entrant) task
// Only a small portion of the module that contains the task definition
// is shown in this example. There are two clocks.
// clk2 runs at twice the frequency of clk and is synchronous
// with clk.

reg [15:0] cd_xor, ef_xor;  //variables in module top
reg [15:0] c, d, e, f;      //variables in module top

task automatic bitwise_xor;
  output  [15:0] ab_xor;  //output from the task
  input   [15:0] a, b;    //inputs to the task
  begin
    #delay;
    ab_xor  = a ^ b;
  end
endtask

// These two always blocks will call the bitwise_xor task
// concurrently at each positive edge of clk. However, since
// the task is re-entrant, these concurrent calls will work correctly.
always @(posedge clk)
begin
  bitwise_xor(ef_xor, e, f);
end

always @(posedge clk2) // twice the frequency as the previous block
begin
  bitwise_xor(cd_xor, c, d);
end

always
begin
  clk2 = 1'b0;
  #5;
  clk2 = 1'b1;
  #5;
end

always
begin
  clk = 1'b0;
  #10;
  clk = 1'b1;
  #10;
end


initial
begin
  c = 16'b0000_0000_1000_0000;   d = 16'b0100_1001_0010_0010; # 100;
  e = 16'b0000_0000_1000_0000;   f = 16'b0100_1001_0010_0010; # 100;
  c = 16'b1000_0001_0000_0001;   d = 16'b0010_0100_0100_0001; # 100;
  e = 16'b1000_0001_0000_0001;   f = 16'b0010_0100_0100_0001; # 100;

  c = 16'b0010_0010_0010_0001;   d = 16'b0001_0010_0100_0011; # 100;
  e = 16'b0100_0100_0010_0001;   f = 16'b0100_1000_0100_1000; # 100;
  c = 16'b0001_1000_0100_0001;   d = 16'b1000_0100_0101_1001; # 100;
end

endmodule

