
module helen (
	adc_sclk,
	adc_cs_n,
	adc_dout,
	adc_din,
	altpll_areset_conduit_export,
	altpll_locked_conduit_export,
	altpll_sdram_clk,
	clk_clk,
	flash_dclk,
	flash_sce,
	flash_sdo,
	flash_data0,
	ledg_export,
	reset_reset_n,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	spi_MISO,
	spi_MOSI,
	spi_SCLK,
	spi_SS_n,
	uart_rxd,
	uart_txd);	

	output		adc_sclk;
	output		adc_cs_n;
	input		adc_dout;
	output		adc_din;
	input		altpll_areset_conduit_export;
	output		altpll_locked_conduit_export;
	output		altpll_sdram_clk;
	input		clk_clk;
	output		flash_dclk;
	output		flash_sce;
	output		flash_sdo;
	input		flash_data0;
	output	[7:0]	ledg_export;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		spi_MISO;
	output		spi_MOSI;
	output		spi_SCLK;
	output		spi_SS_n;
	input		uart_rxd;
	output		uart_txd;
endmodule
