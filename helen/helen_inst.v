	helen u0 (
		.adc_sclk                     (<connected-to-adc_sclk>),                     //                   adc.sclk
		.adc_cs_n                     (<connected-to-adc_cs_n>),                     //                      .cs_n
		.adc_dout                     (<connected-to-adc_dout>),                     //                      .dout
		.adc_din                      (<connected-to-adc_din>),                      //                      .din
		.altpll_areset_conduit_export (<connected-to-altpll_areset_conduit_export>), // altpll_areset_conduit.export
		.altpll_locked_conduit_export (<connected-to-altpll_locked_conduit_export>), // altpll_locked_conduit.export
		.altpll_sdram_clk             (<connected-to-altpll_sdram_clk>),             //          altpll_sdram.clk
		.clk_clk                      (<connected-to-clk_clk>),                      //                   clk.clk
		.flash_dclk                   (<connected-to-flash_dclk>),                   //                 flash.dclk
		.flash_sce                    (<connected-to-flash_sce>),                    //                      .sce
		.flash_sdo                    (<connected-to-flash_sdo>),                    //                      .sdo
		.flash_data0                  (<connected-to-flash_data0>),                  //                      .data0
		.ledg_export                  (<connected-to-ledg_export>),                  //                  ledg.export
		.reset_reset_n                (<connected-to-reset_reset_n>),                //                 reset.reset_n
		.sdram_wire_addr              (<connected-to-sdram_wire_addr>),              //            sdram_wire.addr
		.sdram_wire_ba                (<connected-to-sdram_wire_ba>),                //                      .ba
		.sdram_wire_cas_n             (<connected-to-sdram_wire_cas_n>),             //                      .cas_n
		.sdram_wire_cke               (<connected-to-sdram_wire_cke>),               //                      .cke
		.sdram_wire_cs_n              (<connected-to-sdram_wire_cs_n>),              //                      .cs_n
		.sdram_wire_dq                (<connected-to-sdram_wire_dq>),                //                      .dq
		.sdram_wire_dqm               (<connected-to-sdram_wire_dqm>),               //                      .dqm
		.sdram_wire_ras_n             (<connected-to-sdram_wire_ras_n>),             //                      .ras_n
		.sdram_wire_we_n              (<connected-to-sdram_wire_we_n>),              //                      .we_n
		.uart_rxd                     (<connected-to-uart_rxd>),                     //                  uart.rxd
		.uart_txd                     (<connected-to-uart_txd>)                      //                      .txd
	);

