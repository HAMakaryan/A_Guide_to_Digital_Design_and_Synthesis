module lcd_drv_top(
  //  System signals
  input         rst_n_i,        //  Active low reset
  input         clk_i,          //  System clock @ ?? MHz
  // Keypad Interface
  inout [3:0]   column_io,      // Column
  inout [3:0]   row_io,         // Row
  //  LCD interface
  output        reg_sel_o,      //  Register select
  output        enable_o,       //  Strobe signal
  output [7:0]  lcd_data_o      //  Data(or instruction) to LCD

);


lcd_drv u_lcd_drv (
  .rst_n_i        (),
  .clk_i          (),
  .data_i         (),
  .data_valid_i   (),
  .device_ready_o (),
  .rs_o           (reg_sel_o),
  .en_o           (enable_o),
  .lcd_data_o     (lcd_data_o)

);


endmodule
