`timescale 1ns/1ns
//`define SIMULATION

module lcd_drv_tb();
  //Declaring inputs
  reg rstn;
  reg clk;

  //Declaring outputs
  wire reg_sel;
  wire enable;
  wire lcd_data;

always
begin
  #5 clk <= 1'b0;
  #5 clk <= 1'b1;
end


//Instantiate
lcd_drv_top DUT(
  .rst_n_i    (rstn),     //  Active low reset
  .clk_i      (clk),      //  System clock @ ?? MHz
  .reg_sel_o  (reg_sel),  //  Register select
  .enable_o   (enable),   //  Strobe signal
  .lcd_data_o (lcd_data)  //  Data(or instruction) to LCD
);


initial
begin
  rstn = 1'b0;
  #33;
  rstn = 1'b1;
  # 50000000 ;
  $stop();
end
endmodule
