module top_test;

//***** input port connection
logic clk;
logic reset;
logic uart_rx;

//***** output port connection
wire ledo;
wire uart_txo;

//***** inout port connection

//***** DUT instanciation
top top0 (
  .clk ( clk ),
  .reset ( reset ),
  .uart_rx ( uart_rx ),
  .ledo ( ledo ),
  .uart_txo ( uart_txo )
);

always #(4) begin
  clk <= ~clk;
end

//***** Input initialize
initial begin
  clk = 0;
  reset = 1;
  uart_rx = 0;
  
  repeat(5) @(posedge clk);
  reset = 0;
  repeat(100) @(posedge clk);
  
  uart_rx <= 1'b0;
  repeat(1085) @(posedge clk);
  uart_rx <= 1'b0;
  repeat(1085) @(posedge clk);
  uart_rx <= 1'b1;
  repeat(1085) @(posedge clk);
  uart_rx <= 1'b0;
  repeat(1085) @(posedge clk);
  uart_rx <= 1'b1;
  
  repeat(100000) @(posedge clk);
  $finish;
end

endmodule
