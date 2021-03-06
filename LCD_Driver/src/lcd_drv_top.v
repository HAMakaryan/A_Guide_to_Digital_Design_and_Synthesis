module lcd_drv_top(
  //  System signals
  input         rst_n_i,        //  Active low reset
  input         clk_i,          //  System clock @ ?? MHz
  // Keypad Interface
  //inout [3:0]   column_io,      // Column
  //inout [3:0]   row_io,         // Row
  //  LCD interface
  output        reg_sel_o,      //  Register select
  output        enable_o,       //  Strobe signal
  output [7:0]  lcd_data_o,     //  Data(or instruction) to LCD
  output        read_write_n_o  // 1 Read 0 Write

);

wire clk;
wire rst_n;
wire ready;
wire [8:0]data;
wire valid;

assign read_write_n_o = 1'b0;

lcd_drv u_lcd_drv (
  .rst_n_i        (rst_n),
  .clk_i          (clk),
  .data_i         (data),
  .data_valid_i   (valid),
  .device_ready_o (ready),
  .rs_o           (reg_sel_o),
  .en_o           (enable_o),
  .lcd_data_o     (lcd_data_o)

);

clk_wiz_0 u1_clk
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1
    // Status and control signals
    .resetn(rst_n_i),     // input resetn
    .locked(rst_n),       // output locked
   // Clock in ports
    .clk_in1(clk_i)         // input clk_in1
    );
// INST_TAG_END ------ End INSTANTIATION Template ---------


symbol_gen sym_gen_1
(
 .restn_i(rst_n),
 .clk_i(clk),
 .ready_i(ready),
 .data_o(data),
 .data_valid_o(valid)
);
endmodule
