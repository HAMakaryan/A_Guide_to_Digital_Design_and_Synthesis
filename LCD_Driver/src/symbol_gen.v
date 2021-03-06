`timescale 10us/100ns

module symbol_gen(
 input restn_i,
 input clk_i,
  // Data interface
 input ready_i,
 output [8:0]data_o,
 output data_valid_o
);

reg [1:0] CurrentState;
reg [1:0] NextState;

wire [ 3:0]  cnt;
reg  [ 5:0]  address;
wire [12:0]  rom_data;
wire [ 3:0]  delay;
reg  [20:0]  counter;


assign delay  = rom_data[12: 9];
assign data_o = rom_data[ 8: 0];

`ifdef SIMULATION
assign cnt = counter[10: 7];
`else
assign cnt = counter[20:17];
`endif

localparam HOLD   = 2'b00;
localparam DLY    = 2'b01;
localparam VALID  = 2'b10;

assign data_valid_o = (CurrentState == VALID);

always@(posedge clk_i)
begin
  if (0 == restn_i)
	begin
    address <= 5'b0;
  end
	else if( CurrentState == VALID && NextState == HOLD )
  begin
	  address <= address + 1;
	end
end

always@(posedge clk_i)
begin
  if (0 == restn_i)
  begin
    counter <= 21'b0;
  end
  else if ( (CurrentState != NextState) || (rom_data[8:0] == 9'b0) )
  begin
    counter <= 0;
  end
  else
  begin
    counter <= counter + 1;
  end
end

blk_mem_gen_0 init_rom (
  .clka(clk_i),    // input wire clka
  .ena(1'b1),      // input wire ena
  .addra(address),  // input wire [5 : 0] addra
  .douta(rom_data)  // output wire [12 : 0] douta
);


always@(posedge clk_i)
begin
	if (0 == restn_i)
	begin
		CurrentState <= HOLD;
	end
	else
	begin
		CurrentState <= NextState;
	end
end

always@(*)
begin
	NextState = CurrentState;
	case( CurrentState )
		HOLD:
		  begin
		      if( rom_data[8:0] != 9'b0 && counter[2] == 1 )
		      begin
		          NextState = DLY;
		      end
		  end
		DLY:
		  begin
		      if( cnt >= rom_data[12:9] )
		      begin
		        NextState = VALID;
		      end
		  end
		VALID:
		  begin
		     if( ready_i == 1'b1 )
		     begin
		        NextState = HOLD;
		     end
		  end
		default:
		  begin
		      NextState = HOLD;
		  end
	endcase
end

endmodule
