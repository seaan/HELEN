	component helen is
		port (
			adc_sclk                     : out   std_logic;                                        -- sclk
			adc_cs_n                     : out   std_logic;                                        -- cs_n
			adc_dout                     : in    std_logic                     := 'X';             -- dout
			adc_din                      : out   std_logic;                                        -- din
			altpll_areset_conduit_export : in    std_logic                     := 'X';             -- export
			altpll_locked_conduit_export : out   std_logic;                                        -- export
			altpll_sdram_clk             : out   std_logic;                                        -- clk
			clk_clk                      : in    std_logic                     := 'X';             -- clk
			flash_dclk                   : out   std_logic;                                        -- dclk
			flash_sce                    : out   std_logic;                                        -- sce
			flash_sdo                    : out   std_logic;                                        -- sdo
			flash_data0                  : in    std_logic                     := 'X';             -- data0
			ledg_export                  : out   std_logic_vector(7 downto 0);                     -- export
			reset_reset_n                : in    std_logic                     := 'X';             -- reset_n
			sdram_wire_addr              : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba                : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n             : out   std_logic;                                        -- cas_n
			sdram_wire_cke               : out   std_logic;                                        -- cke
			sdram_wire_cs_n              : out   std_logic;                                        -- cs_n
			sdram_wire_dq                : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm               : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n             : out   std_logic;                                        -- ras_n
			sdram_wire_we_n              : out   std_logic;                                        -- we_n
			uart_rxd                     : in    std_logic                     := 'X';             -- rxd
			uart_txd                     : out   std_logic                                         -- txd
		);
	end component helen;

	u0 : component helen
		port map (
			adc_sclk                     => CONNECTED_TO_adc_sclk,                     --                   adc.sclk
			adc_cs_n                     => CONNECTED_TO_adc_cs_n,                     --                      .cs_n
			adc_dout                     => CONNECTED_TO_adc_dout,                     --                      .dout
			adc_din                      => CONNECTED_TO_adc_din,                      --                      .din
			altpll_areset_conduit_export => CONNECTED_TO_altpll_areset_conduit_export, -- altpll_areset_conduit.export
			altpll_locked_conduit_export => CONNECTED_TO_altpll_locked_conduit_export, -- altpll_locked_conduit.export
			altpll_sdram_clk             => CONNECTED_TO_altpll_sdram_clk,             --          altpll_sdram.clk
			clk_clk                      => CONNECTED_TO_clk_clk,                      --                   clk.clk
			flash_dclk                   => CONNECTED_TO_flash_dclk,                   --                 flash.dclk
			flash_sce                    => CONNECTED_TO_flash_sce,                    --                      .sce
			flash_sdo                    => CONNECTED_TO_flash_sdo,                    --                      .sdo
			flash_data0                  => CONNECTED_TO_flash_data0,                  --                      .data0
			ledg_export                  => CONNECTED_TO_ledg_export,                  --                  ledg.export
			reset_reset_n                => CONNECTED_TO_reset_reset_n,                --                 reset.reset_n
			sdram_wire_addr              => CONNECTED_TO_sdram_wire_addr,              --            sdram_wire.addr
			sdram_wire_ba                => CONNECTED_TO_sdram_wire_ba,                --                      .ba
			sdram_wire_cas_n             => CONNECTED_TO_sdram_wire_cas_n,             --                      .cas_n
			sdram_wire_cke               => CONNECTED_TO_sdram_wire_cke,               --                      .cke
			sdram_wire_cs_n              => CONNECTED_TO_sdram_wire_cs_n,              --                      .cs_n
			sdram_wire_dq                => CONNECTED_TO_sdram_wire_dq,                --                      .dq
			sdram_wire_dqm               => CONNECTED_TO_sdram_wire_dqm,               --                      .dqm
			sdram_wire_ras_n             => CONNECTED_TO_sdram_wire_ras_n,             --                      .ras_n
			sdram_wire_we_n              => CONNECTED_TO_sdram_wire_we_n,              --                      .we_n
			uart_rxd                     => CONNECTED_TO_uart_rxd,                     --                  uart.rxd
			uart_txd                     => CONNECTED_TO_uart_txd                      --                      .txd
		);

