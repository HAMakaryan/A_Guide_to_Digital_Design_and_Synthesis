
`timescale 1ns/10ps

module temp_06;

integer a, b, c;

initial
begin
  #5;
  a = -10 / 5;
  #5;
  b = -'d10 / 5;
  #5;
  $stop;
end

endmodule