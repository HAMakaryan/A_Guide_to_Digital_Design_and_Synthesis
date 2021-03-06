`timescale 10us/100ns

module lcd_drv(
  //  System signals
  input         rst_n_i,        //  Active low reset
  input         clk_i,          //  System clock @ 100 MHz
  // Data interface (Ready/Valid protocol)
  input [8:0]   data_i,         // Input data
  input         data_valid_i,   // Data on bus is valid
  output        device_ready_o, // Device is ready
  //  LCD interface
  output reg       rs_o,        //  Register select
  output           en_o,        //  Strobe signal
  output reg [7:0] lcd_data_o   //  Data(or instruction) to LCD

);

//State encoding
localparam IDLE   = 2'b00;
localparam SET 	  = 2'b01;
localparam STROBE = 2'b10;
localparam DELAY  = 2'b11;

//State reg declaration
reg [1:0] CurrentState;
reg [1:0] NextState ;

//Counter declaration
reg [17:0] counter;
wire [7:0] cnt;
wire [7:0] dly;

assign en_o = (CurrentState == STROBE)? 1'b1 : 1'b0;
assign device_ready_o = (CurrentState == IDLE)? 1'b1 : 1'b0;
assign dly = ({rs_o, lcd_data_o} == 0)? 250 : 10;

`ifdef SIMULATION
assign cnt = counter[9:2];
`else
assign cnt = counter[17:10];
`endif



//Data and register_select definition
always@(posedge clk_i)
begin
  if (0 == rst_n_i )
  begin
    lcd_data_o  <= 8'H00;
    rs_o        <= 1'b0;
  end
  else
  begin
    if (data_valid_i && device_ready_o)
    begin
      lcd_data_o  <= data_i[7:0];
      rs_o        <= data_i[8];
    end
  end
end


always@(posedge clk_i)
begin
	if (0 == rst_n_i) begin
		CurrentState <= IDLE;
	end
	else begin
		CurrentState <= NextState;
	end
end


//Counter definition
always@(posedge clk_i)
begin
  	if (0 == rst_n_i) begin
      		counter <= 18'b0;
  	end
  	else begin
    		if (CurrentState == IDLE || CurrentState != NextState) begin
        		counter <= 0;
    		end
    		else begin
        		counter <= counter + 1;
   		end
  	end
end


//Conditional State - Transition
always@ (*)
begin
  NextState = CurrentState;
	case (CurrentState)
	      IDLE: begin
	        if(data_valid_i == 1 && device_ready_o == 1) begin
			NextState <= SET;
		end
	      end
	      SET: begin
		if(cnt[0] == 1) begin
			NextState <= STROBE;
		end
	      end
	      STROBE: begin
	        if(cnt[0] == 1) begin
			NextState <= DELAY;
		end
	      end
	      DELAY: begin
		if(cnt >= dly) begin
			NextState <= IDLE;
		end
	      end
	      default: begin
			NextState <= IDLE;
	      end
	endcase
end

endmodule
