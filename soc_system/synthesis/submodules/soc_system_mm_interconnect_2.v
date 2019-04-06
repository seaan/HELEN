// soc_system_mm_interconnect_2.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module soc_system_mm_interconnect_2 (
		input  wire         pll_0_outclk0_clk,                       //                     pll_0_outclk0.clk
		input  wire         dma_0_reset_reset_bridge_in_reset_reset, // dma_0_reset_reset_bridge_in_reset.reset
		input  wire [9:0]   dma_0_read_master_address,               //                 dma_0_read_master.address
		output wire         dma_0_read_master_waitrequest,           //                                  .waitrequest
		input  wire         dma_0_read_master_chipselect,            //                                  .chipselect
		input  wire         dma_0_read_master_read,                  //                                  .read
		output wire [127:0] dma_0_read_master_readdata,              //                                  .readdata
		output wire         dma_0_read_master_readdatavalid,         //                                  .readdatavalid
		output wire [5:0]   onchip_memory_0_s2_address,              //                onchip_memory_0_s2.address
		output wire         onchip_memory_0_s2_write,                //                                  .write
		input  wire [127:0] onchip_memory_0_s2_readdata,             //                                  .readdata
		output wire [127:0] onchip_memory_0_s2_writedata,            //                                  .writedata
		output wire [15:0]  onchip_memory_0_s2_byteenable,           //                                  .byteenable
		output wire         onchip_memory_0_s2_chipselect,           //                                  .chipselect
		output wire         onchip_memory_0_s2_clken                 //                                  .clken
	);

	wire          dma_0_read_master_translator_avalon_universal_master_0_waitrequest;   // onchip_memory_0_s2_translator:uav_waitrequest -> dma_0_read_master_translator:uav_waitrequest
	wire  [127:0] dma_0_read_master_translator_avalon_universal_master_0_readdata;      // onchip_memory_0_s2_translator:uav_readdata -> dma_0_read_master_translator:uav_readdata
	wire          dma_0_read_master_translator_avalon_universal_master_0_debugaccess;   // dma_0_read_master_translator:uav_debugaccess -> onchip_memory_0_s2_translator:uav_debugaccess
	wire    [9:0] dma_0_read_master_translator_avalon_universal_master_0_address;       // dma_0_read_master_translator:uav_address -> onchip_memory_0_s2_translator:uav_address
	wire          dma_0_read_master_translator_avalon_universal_master_0_read;          // dma_0_read_master_translator:uav_read -> onchip_memory_0_s2_translator:uav_read
	wire   [15:0] dma_0_read_master_translator_avalon_universal_master_0_byteenable;    // dma_0_read_master_translator:uav_byteenable -> onchip_memory_0_s2_translator:uav_byteenable
	wire          dma_0_read_master_translator_avalon_universal_master_0_readdatavalid; // onchip_memory_0_s2_translator:uav_readdatavalid -> dma_0_read_master_translator:uav_readdatavalid
	wire          dma_0_read_master_translator_avalon_universal_master_0_lock;          // dma_0_read_master_translator:uav_lock -> onchip_memory_0_s2_translator:uav_lock
	wire          dma_0_read_master_translator_avalon_universal_master_0_write;         // dma_0_read_master_translator:uav_write -> onchip_memory_0_s2_translator:uav_write
	wire  [127:0] dma_0_read_master_translator_avalon_universal_master_0_writedata;     // dma_0_read_master_translator:uav_writedata -> onchip_memory_0_s2_translator:uav_writedata
	wire    [4:0] dma_0_read_master_translator_avalon_universal_master_0_burstcount;    // dma_0_read_master_translator:uav_burstcount -> onchip_memory_0_s2_translator:uav_burstcount

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (10),
		.AV_DATA_W                   (128),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (16),
		.UAV_ADDRESS_W               (10),
		.UAV_BURSTCOUNT_W            (5),
		.USE_READ                    (1),
		.USE_WRITE                   (0),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (1),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.USE_READRESPONSE            (0),
		.USE_WRITERESPONSE           (0),
		.AV_SYMBOLS_PER_WORD         (16),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) dma_0_read_master_translator (
		.clk                    (pll_0_outclk0_clk),                                                                                                                     //                       clk.clk
		.reset                  (dma_0_reset_reset_bridge_in_reset_reset),                                                                                               //                     reset.reset
		.uav_address            (dma_0_read_master_translator_avalon_universal_master_0_address),                                                                        // avalon_universal_master_0.address
		.uav_burstcount         (dma_0_read_master_translator_avalon_universal_master_0_burstcount),                                                                     //                          .burstcount
		.uav_read               (dma_0_read_master_translator_avalon_universal_master_0_read),                                                                           //                          .read
		.uav_write              (dma_0_read_master_translator_avalon_universal_master_0_write),                                                                          //                          .write
		.uav_waitrequest        (dma_0_read_master_translator_avalon_universal_master_0_waitrequest),                                                                    //                          .waitrequest
		.uav_readdatavalid      (dma_0_read_master_translator_avalon_universal_master_0_readdatavalid),                                                                  //                          .readdatavalid
		.uav_byteenable         (dma_0_read_master_translator_avalon_universal_master_0_byteenable),                                                                     //                          .byteenable
		.uav_readdata           (dma_0_read_master_translator_avalon_universal_master_0_readdata),                                                                       //                          .readdata
		.uav_writedata          (dma_0_read_master_translator_avalon_universal_master_0_writedata),                                                                      //                          .writedata
		.uav_lock               (dma_0_read_master_translator_avalon_universal_master_0_lock),                                                                           //                          .lock
		.uav_debugaccess        (dma_0_read_master_translator_avalon_universal_master_0_debugaccess),                                                                    //                          .debugaccess
		.av_address             (dma_0_read_master_address),                                                                                                             //      avalon_anti_master_0.address
		.av_waitrequest         (dma_0_read_master_waitrequest),                                                                                                         //                          .waitrequest
		.av_chipselect          (dma_0_read_master_chipselect),                                                                                                          //                          .chipselect
		.av_read                (dma_0_read_master_read),                                                                                                                //                          .read
		.av_readdata            (dma_0_read_master_readdata),                                                                                                            //                          .readdata
		.av_readdatavalid       (dma_0_read_master_readdatavalid),                                                                                                       //                          .readdatavalid
		.av_burstcount          (1'b1),                                                                                                                                  //               (terminated)
		.av_byteenable          (16'b1111111111111111),                                                                                                                  //               (terminated)
		.av_beginbursttransfer  (1'b0),                                                                                                                                  //               (terminated)
		.av_begintransfer       (1'b0),                                                                                                                                  //               (terminated)
		.av_write               (1'b0),                                                                                                                                  //               (terminated)
		.av_writedata           (128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000), //               (terminated)
		.av_lock                (1'b0),                                                                                                                                  //               (terminated)
		.av_debugaccess         (1'b0),                                                                                                                                  //               (terminated)
		.uav_clken              (),                                                                                                                                      //               (terminated)
		.av_clken               (1'b1),                                                                                                                                  //               (terminated)
		.uav_response           (2'b00),                                                                                                                                 //               (terminated)
		.av_response            (),                                                                                                                                      //               (terminated)
		.uav_writeresponsevalid (1'b0),                                                                                                                                  //               (terminated)
		.av_writeresponsevalid  ()                                                                                                                                       //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (6),
		.AV_DATA_W                      (128),
		.UAV_DATA_W                     (128),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (16),
		.UAV_BYTEENABLE_W               (16),
		.UAV_ADDRESS_W                  (10),
		.UAV_BURSTCOUNT_W               (5),
		.AV_READLATENCY                 (1),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (16),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (0),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) onchip_memory_0_s2_translator (
		.clk                    (pll_0_outclk0_clk),                                                    //                      clk.clk
		.reset                  (dma_0_reset_reset_bridge_in_reset_reset),                              //                    reset.reset
		.uav_address            (dma_0_read_master_translator_avalon_universal_master_0_address),       // avalon_universal_slave_0.address
		.uav_burstcount         (dma_0_read_master_translator_avalon_universal_master_0_burstcount),    //                         .burstcount
		.uav_read               (dma_0_read_master_translator_avalon_universal_master_0_read),          //                         .read
		.uav_write              (dma_0_read_master_translator_avalon_universal_master_0_write),         //                         .write
		.uav_waitrequest        (dma_0_read_master_translator_avalon_universal_master_0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid      (dma_0_read_master_translator_avalon_universal_master_0_readdatavalid), //                         .readdatavalid
		.uav_byteenable         (dma_0_read_master_translator_avalon_universal_master_0_byteenable),    //                         .byteenable
		.uav_readdata           (dma_0_read_master_translator_avalon_universal_master_0_readdata),      //                         .readdata
		.uav_writedata          (dma_0_read_master_translator_avalon_universal_master_0_writedata),     //                         .writedata
		.uav_lock               (dma_0_read_master_translator_avalon_universal_master_0_lock),          //                         .lock
		.uav_debugaccess        (dma_0_read_master_translator_avalon_universal_master_0_debugaccess),   //                         .debugaccess
		.av_address             (onchip_memory_0_s2_address),                                           //      avalon_anti_slave_0.address
		.av_write               (onchip_memory_0_s2_write),                                             //                         .write
		.av_readdata            (onchip_memory_0_s2_readdata),                                          //                         .readdata
		.av_writedata           (onchip_memory_0_s2_writedata),                                         //                         .writedata
		.av_byteenable          (onchip_memory_0_s2_byteenable),                                        //                         .byteenable
		.av_chipselect          (onchip_memory_0_s2_chipselect),                                        //                         .chipselect
		.av_clken               (onchip_memory_0_s2_clken),                                             //                         .clken
		.av_read                (),                                                                     //              (terminated)
		.av_begintransfer       (),                                                                     //              (terminated)
		.av_beginbursttransfer  (),                                                                     //              (terminated)
		.av_burstcount          (),                                                                     //              (terminated)
		.av_readdatavalid       (1'b0),                                                                 //              (terminated)
		.av_waitrequest         (1'b0),                                                                 //              (terminated)
		.av_writebyteenable     (),                                                                     //              (terminated)
		.av_lock                (),                                                                     //              (terminated)
		.uav_clken              (1'b0),                                                                 //              (terminated)
		.av_debugaccess         (),                                                                     //              (terminated)
		.av_outputenable        (),                                                                     //              (terminated)
		.uav_response           (),                                                                     //              (terminated)
		.av_response            (2'b00),                                                                //              (terminated)
		.uav_writeresponsevalid (),                                                                     //              (terminated)
		.av_writeresponsevalid  (1'b0)                                                                  //              (terminated)
	);

endmodule
