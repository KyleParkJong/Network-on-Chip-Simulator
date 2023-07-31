`timescale 1ns/1ps

module dec_rt_tb();
`include "define.v" 

reg                 um_type;
reg [`MADDR:0]      addr1;
reg [`UADDR:0]      addr0;
reg                 clk;

wire [`PORTW:0]     port;
wire [`MADDR:0]	    addr1_rm;   // 56 bits 
wire                multab_en;
        
reg [65:0] bdata0;

dec_rt #(0,0) u0 (      // Src : (0,0)
    .um_type(um_type),
    .addr0(addr0),
    .addr1(addr1),
    .port(port),
    .addr1_rm(addr1_rm),
    .multab_en(multab_en)
);

always #5 clk = ~clk;

/* Data split */ 
always @(*) begin
    um_type = bdata0[`UM_TYPE];
    addr0 = bdata0[`UM_TYPE] ? `DATAW_P1'b0 : bdata0[`DST_MSB:`DST_LSB]; 
    addr1 = bdata0[`UM_TYPE] ? bdata0[`MDST_MSB:`MDST_LSB] : `DATAW_P1'b0;
end

initial begin
    clk = 0;
    
    bdata0 = {2'b00, 1'b1, 56'b0000000000000000000000000000000000000000000000000001, 7'b0000000};   // M, Dst : 0 (Absorb)
    $strobe ("addr1 = %b\nport = %d, multab_en = %d\naddr1_rm = %b\n\n", addr1, port, multab_en, addr1_rm);

    #10
    bdata0 = {2'b00, 1'b1, 56'b0000000000000000000000000000000000000000000000010001, 7'b0000000};   // M, Dst : 0, 4 (F & A)
    $strobe ("addr1 = %b\nport = %d, multab_en = %d\naddr1_rm = %b\n\n", addr1, port, multab_en, addr1_rm);
    #10
    bdata0 = {2'b00, 1'b1, 56'b0000000000000000000000000000000000000000000100010001, 7'b0000000};   // M, Dst : 0, 4, 8 (F & A)
    $strobe ("addr1 = %b\nport = %d, multab_en = %d\naddr1_rm = %b\n\n", addr1, port, multab_en, addr1_rm);
    #10
    bdata0 = {2'b00, 1'b1, 56'b0000000000000000000000000000000000000001000100000000, 7'b0000000};   // M, Dst : 8, 12 (Forward)
    $strobe ("addr1 = %b\nport = %d, multab_en = %d\naddr1_rm = %b\n\n", addr1, port, multab_en, addr1_rm);

    #10
    bdata0 = {2'b00, 1'b0, 11'b00000000101, 52'b0};   // U, Dst : 5     (S)
    $strobe ("addr0 = %b\nport = %d, multab_en = %d\naddr1_rm = %b\n\n", addr0, port, multab_en, addr1_rm);

    #10
    bdata0 = {2'b00, 1'b0, 11'b00000001100, 52'b0};   // U, Dst : 12    (E)
    $strobe ("addr0 = %b\nport = %d, multab_en = %d\naddr1_rm = %b\n\n", addr0, port, multab_en, addr1_rm);
end

endmodule