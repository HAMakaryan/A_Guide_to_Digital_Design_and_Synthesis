//    file four_bit_Synchronous_Counter_tb.v

`timescale 10ns/10 ps

module four_bit_Synchronous_Counter_tb ();

wire [3:0]  q;
reg         clear;
reg         clock;
reg         cnt_en;

always
begin
  clock = 1'b0;
  # 5;
  clock = 1'b1;
  # 5;
end

initial
begin
  cnt_en  = 1'b0;
  clear   = 1'b0;
  repeat(3)@(posedge clock);
  #1;
  clear   = 1'b1;
  repeat(3)@(posedge clock);
  cnt_en  = 1'b1;

  repeat(40)@(posedge clock);
  $stop;
end



four_bit_Synchronous_Counter DUT (
  .clear  (clear ),
  .clock  (clock ),
  .cnt_en (cnt_en),
  .q  (q)
);




endmodule
