module uart_echoback (
  input wire      clk,
  input wire      reset,

  input wire      uart_rx,
  output wire     uart_txo
);

wire        axi_arready;
wire        axi_rready;
wire        axi_awready;
wire [3:0]  axi_araddr;
wire [3:0]  axi_awaddr;
wire        axi_awvalid;
wire        axi_wvalid;
wire [31:0] axi_wdata;
wire        axi_wready;
wire [3:0]  axi_wstrb;
wire        axi_bready;
wire        axi_arvalid;
wire [31:0] axi_rdata;
wire [31:0] bus_rdata;
wire        axi_rvalid;
wire        bus_ready;
wire        bus_busy;

reg        req;
reg [3:0]  ad;
reg [3:0]  strb;
reg [3:0]  fsm;
reg [31:0] data;

always_ff @(posedge clk) begin
  if ( reset ) begin
    fsm <= 'h0;
  end else begin
    case (fsm)
      'h0 : begin // read request
        ad  <= 4'h8;
        req <= 1'b1;
        strb <= 4'b0000;
        fsm <= 'h1;
      end

      'h1 : begin // read wait
        req <= 1'b0;
        if ( bus_ready ) begin
          if ( bus_rdata[0] ) begin
            fsm <= 'h2;
          end else begin
            fsm <= 'h0;
          end
        end
      end

      'h2 : begin // read data
        ad <= 4'h0;
        req <= 1'b1;
        strb <= 4'b0000;
        fsm <= 'h3;
      end

      'h3 : begin // read wait
        req <= 1'b0;
        if ( bus_ready ) begin
          fsm  <= 'h4;
          data <= bus_rdata;
        end
      end

      'h4 : begin // write request
        ad <= 4'h4;
        req <= 1'b1;
        strb <= 4'b0001;
        fsm <= 'h5;
      end

      'h5 : begin // write wait
        req <= 1'b0;
        if ( bus_ready ) begin
          fsm <= 'h6;
        end
      end
      
      'h6 : begin
        if ( !bus_busy ) begin
          fsm <= 'h0;
        end
      end

      default : begin
        fsm <= 'h0;
      end
    endcase
  end
end

axi2lbus_bridge #(
  .AddrW ( 4 ),
  .StrbW ( 4 ),
  .DataW ( 32 )
) axi2lbus_bridge0 (
  .clk         ( clk ),
  .reset      ( reset ),
  
  .bus_addr   ( ad ),
  .bus_id     ( 0 ),
  .bus_req    ( req ),
  .bus_strb   ( strb ),
  .bus_wdata  ( data ),
  .bus_busyo  ( bus_busy ),
  .bus_ido    (),
  .bus_rdatao ( bus_rdata ),
  .bus_readyo ( bus_ready ),
  
  .axi_arready  ( axi_arready ),
  .axi_awready  ( axi_awready ),
  .axi_bvalid   ( axi_bvalid ),
  .axi_rdata    ( axi_rdata ),
  .axi_rvalid   ( axi_rvalid ),
  .axi_wready   ( 1'b1 ),
  .axi_araddro  ( axi_araddr ),
  .axi_arbursto (),
  .axi_arido    (),
  .axi_arleno   (),
  .axi_arsizeo  (),
  .axi_arvalido ( axi_arvalid ),
  .axi_awaddro  ( axi_awaddr ),
  .axi_awbursto (),
  .axi_awido    (),
  .axi_awleno   (),
  .axi_awsizeo  (),
  .axi_awvalido ( axi_awvalid ),
  .axi_breadyo  ( axi_bready ),
  .axi_rreadyo  ( axi_rready ),
  .axi_wdatao   ( axi_wdata ),
  .axi_wlasto   (),
  .axi_wstrbo   ( axi_wstrb ),
  .axi_wvalido  ( axi_wvalid )
);

axi_uartlite0 uart_tx (
    .s_axi_aclk     ( clk ),
    .s_axi_aresetn  ( ~reset ),
    .rx             ( uart_rx ),
    .tx             ( uart_txo ),
    .s_axi_awaddr   ( axi_awaddr ),
    .s_axi_awvalid  ( axi_awvalid ),
    .s_axi_wvalid   ( axi_awvalid ),
    .s_axi_awready  ( axi_awready ),
    .s_axi_wdata    ( axi_wdata ),
    .s_axi_wready   ( axi_wready ),
    .s_axi_wstrb    ( axi_wstrb ),
    .s_axi_bvalid   ( axi_bvalid ),
    .s_axi_bready   ( axi_bready ),
    
    .s_axi_araddr   ( axi_araddr ),
    .s_axi_arvalid  ( axi_arvalid ),
    .s_axi_arready  ( axi_arready ),
    .s_axi_rready   ( axi_rready ),
    .s_axi_rdata    ( axi_rdata ),
    .s_axi_rvalid   ( axi_rvalid )
);

endmodule
