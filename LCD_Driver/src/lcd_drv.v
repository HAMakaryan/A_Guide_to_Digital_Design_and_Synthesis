module lcd_drv(
  //  System signals
  input         rst_n_i,        // Active low reset
  input         clk_i,          // System clock @ 100 MHz
  // Data interface (Ready/Valid protocol)
  input [8:0]   data_i,         // Input data
  input         data_valid_i,   // Data on bus is valid
  output        device_ready_o, // Device is ready
  //  LCD interface
  output        rs_o,           //  Register select
  output        en_o,           //  Strobe signal
  output [7:0]  lcd_data_o      //  Data(or instruction) to LCD

);


endmodule
