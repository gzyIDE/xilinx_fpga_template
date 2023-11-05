`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2023 10:43:30 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top(
  input wire    clk,
  input wire    reset,
  output wire   ledo,
      
  input wire    uart_rx,
  output wire   uart_txo
);

wire  clk_100m;
wire  clk_200m;
wire  reset_100m;
wire  reset_200m;
wire  pll_lock;

clk_wiz0 clk_wiz_inst (
  .reset      ( reset ),
  .clk_in1    ( clk ),

  .clk_out1   ( clk_200m ),
  .clk_out2   ( clk_100m ),
  .locked     ( pll_lock )
);

reset_sync reset_sync0 (
  .clk          ( clk ),
  .locked       ( pll_lock ),
  .reset        ( reset ),
  .clk_100m     ( clk_100m ),
  .clk_200m     ( clk_200m ),
  .reset_100mo  ( reset_100m ),
  .reset_200mo  ( reset_200m )
);

led_blink led_blink0 (
  .clk          ( clk_100m ),
  .reset        ( reset_100m ),
  .ledo         ( ledo )
);

uart_echoback uart_echoback0 (
  .clk          ( clk_200m ),
  .reset        ( reset_200m ),
  .uart_rx      ( uart_rx ),
  .uart_txo     ( uart_txo )
);
    
endmodule
