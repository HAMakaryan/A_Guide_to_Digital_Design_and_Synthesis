// Top level stimulus module
module counter_tb;

// Declare variables for stimulating input
reg CLOCK, CLEAR;
wire [3:0] Q;


initial
begin
  $monitor($time, " Count Q = %b Clear= %b", Q[3:0],CLEAR);
end


// Instantiate the design block counter
counter c1(
  .Q      (Q    ),
  .clock  (CLOCK),
  .clear  (CLEAR)
);

// Stimulate the Clear Signal
initial
begin
        CLEAR = 1'b1;
  #34   CLEAR = 1'b0;
  #200  CLEAR = 1'b1;
  #50   CLEAR = 1'b0;
end

// Set up the clock to toggle every 10 time units
initial
begin
  CLOCK = 1'b0;
  forever
  begin
    #10 CLOCK = ~CLOCK;
  end
end

// Finish the simulation at time 400
initial
begin
  #1400 $stop;
end

endmodule
