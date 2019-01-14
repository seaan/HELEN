module addc_hsmc 
(
    input  logic        clk,            // clock.clk
    input  logic        reset,          // reset.reset

    // Memory mapped read/write slave interface
    input  logic        avs_s0_address,   // avs_s0.address
    input  logic        avs_s0_read,      //       .read
    input  logic        avs_s0_write,     //       .write
    output logic [31:0] avs_s0_readdata,  //       .readdata
    input  logic [31:0] avs_s0_writedata,  //      .writedata

    // The ADD HSMC outputs
    input logic [13:0] addc_hsmc
);

// Read operations performed on the Avalon-MM Slave interface
always_comb begin
    if(avs_s0_read) begin
        case(avs_s0_address)
            1'b0 : avs_s0_readdata = {24'b0, addc_hsmc};
            default : avs_s0_readdata = 'x;
        endcase
    end else begin
        avs_s0_readdata = 'x;
    end
end

endmodule // addc_hsmc
