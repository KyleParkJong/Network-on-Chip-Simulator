// Exist only for cycle simulation (No computation)
`include "define.v"
`include "parameters.v"
module pe_cycle (
    idata,      // <-> nX_odata_p0      (X : Router id)
    ivalid,     // <-> nX_ovalid_p0
    irdy,       // <-> &nX_ordy_p0

    odata,      // <-> nX_idata_p0
    ovalid,     // <-> nX_ivalid_p0
    ovch,       // <-> nX_ivch_p0

    clk,
    rst_
);

localparam IDLE=2'b00, MAC=2'b01, SEND=2'b10;

input   [`DATAW:0]   idata;
input                ivalid; 
input   [`VCH:0]     irdy;      // if 0, no grt

output   [`DATAW:0]   odata;
output                ovalid;
output   [`VCHW:0]    ovch;

input clk, rst_;

wire [1:0] grt;
wire [1:0] req;

wire [`DATAW:0] idata0, idata1;
wire            ivalid0, ivalid1;

wire [1:0]      state0, state1;
wire [`DATAW:0] odata0, odata1;
wire            ovalid0, ovalid1;
wire [`VCHW:0]  ovch0, ovch1;
wire [1:0]      msel;   // MUX select signal

reg  [1:0]  dsel;
wire [1:0]  dsel_hold;
wire [1:0]  dsel_req, dsel_grt, dsel_grt0;
wire        anyhold;

/* Decoder Select Signal Logic */
assign dsel_hold = dsel & dsel_req;
assign anyhold = |dsel_hold;

assign dsel_req[0] = (state0 != SEND) ? 1 : 0;
assign dsel_req[1] = (state1 != SEND) ? 1 : 0;

assign  dsel_grt0[0]  =                       dsel_req[0]; 
assign  dsel_grt0[1]  = (dsel_req[0]   == 0) & dsel_req[1];

assign dsel_grt[0] = anyhold ? dsel_hold[0] : dsel_grt0[0];
assign dsel_grt[1] = anyhold ? dsel_hold[1] : dsel_grt0[1];

always @(posedge clk) begin
    if (rst_ == `Enable_)
        dsel <= 2'b00;
    else if (dsel != dsel_grt)
        dsel <= dsel_grt;
end

assign idata0   =  (dsel == 2'b01) ? idata : 0;
assign ivalid0  =  (dsel == 2'b01) ? ivalid : 0;

assign idata1   =  (dsel == 2'b10) ? idata : 0;
assign ivalid1  =  (dsel == 2'b10) ? ivalid : 0;


/* Output data */
assign odata    =   (msel == 2'b01) ? odata0 :
                    (msel == 2'b10) ? odata1 :
                    `DATAW_P1'b0;

assign ovalid   =   (msel == 2'b01) ? ovalid0 :
                    (msel == 2'b10) ? ovalid1 :
                    1'b0;

assign ovch     =   (msel == 2'b01) ? ovch0 :
                    (msel == 2'b10) ? ovch1 :
                    `VCHW_P1'b0;

pe_fsm fsm0 (
    .idata  ( idata0 ),
    .ivalid ( ivalid0 ),
    .grt    ( grt[0] & |irdy ),     // IA 들어오는 것과 ACC 들어가는거 겹칠일 X

    .state  ( state0 ),
    .odata  ( odata0 ),
    .ovalid ( ovalid0 ),
    .ovch   ( ovch0 ),
    .req    ( req[0] ),

	.clk    (clk),
	.rst_   (rst_) 
);

pe_fsm fsm1 (
    .idata  ( idata1 ),
    .ivalid ( ivalid1 ),
    .grt    ( grt[1] & |irdy ),

    .state  ( state1 ),
    .odata  ( odata1 ),
    .ovalid ( ovalid1 ),
    .ovch   ( ovch1 ),
    .req    ( req[1] ),

	.clk    ( clk ),
	.rst_   ( rst_ ) 
);

pe_mux mux0 (
    .req    ( req ),

    .grt    ( grt ),
    .sel    ( msel ),

    .clk    ( clk ),
    .rst_   ( rst_ )
);

endmodule