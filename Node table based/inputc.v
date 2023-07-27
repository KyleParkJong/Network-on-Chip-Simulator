`include "define.h" 
module inputc ( 
        idata,  
        ivalid, 
        ivch,   
        oack,   
        ordy,   
        olck,   

        odata,  
        ovalid, 
        ovch,   

        irdy_0, 
        irdy_1, 
        irdy_2, 
        irdy_3, 
        irdy_4, 
        ilck_0, 
        ilck_1, 
        ilck_2, 
        ilck_3, 
        ilck_4, 

        grt_0, 
        grt_1, 
        grt_2, 
        grt_3, 
        grt_4, 

        port,  
        req,   
        fwdab_en,

        clk, 
        rst_ 
);
parameter       ROUTERID= 0;
parameter       PCHID   = 0;

parameter       MY_XPOS = 0;
parameter       MY_YPOS = 0;

input   [`DATAW:0]      idata;  
input                   ivalid; 
input   [`VCHW:0]       ivch;   
output  [`VCH:0]        oack;   
output  [`VCH:0]        ordy;   
output  [`VCH:0]        olck;   

output  [`DATAW:0]      odata;  
output                  ovalid; 
output  [`VCHW:0]       ovch;   

input   [`VCH:0]        irdy_0; 
input   [`VCH:0]        irdy_1; 
input   [`VCH:0]        irdy_2; 
input   [`VCH:0]        irdy_3; 
input   [`VCH:0]        irdy_4; 
input   [`VCH:0]        ilck_0; 
input   [`VCH:0]        ilck_1; 
input   [`VCH:0]        ilck_2; 
input   [`VCH:0]        ilck_3; 
input   [`VCH:0]        ilck_4; 

input                   grt_0; 
input                   grt_1; 
input                   grt_2; 
input                   grt_3; 
input                   grt_4; 

output  [`PORTW:0]      port;   
output                  req;    
<<<<<<< HEAD
output  [`DSTATUS:0]    multab_en;
=======
output  [`VCH:0]        fwdab_en;
>>>>>>> parent of 66a1952 (7.20 version)

input   clk, rst_;              

wire    [`DATAW:0]      odata0; 
wire                    ovalid0;
wire    [`VCHW:0]       ovch0;  
wire    [`PORTW:0]      port0;  
wire                    req0;   
wire                    send0;  
wire    [`DATAW:0]      bdata0;
wire    [`DATAW:0]      bdata00; 
wire    [`TYPEW:0]      btype0; 
wire    [`MADDR:0]      addr1_rm;

wire    [`VCH:0]        vcsel;

wire    [`DATAW:0]      merge;          // Merged data

assign  oack[0]        = send0;

/* 
 * VC mux 
 */ 
vcmux vcmux ( 
        .ovalid0 ( ovalid0 ),

        .odata0  ( odata0 ),

        .ovch0   ( ovch0 ),

        .req0    ( req0 ),

        .port0   ( port0 ),

        .ovalid  ( ovalid ),
        .odata   ( odata  ),
        .ovch    ( ovch   ),
        .req     ( req    ),
        .port    ( port   ),
        .vcsel   ( vcsel  ),

        .clk     ( clk    ),
        .rst_    ( rst_   ) 
);

/* 
 * Input virtual channels 
 */ 
vc #( ROUTERID, PCHID, 0 ) vc_0 ( 
       .bdata ( bdata0  ), 
       .send  ( send0   ), 
       .olck  ( olck[0] ), 

       .irdy_0( irdy_0  ), 
       .irdy_1( irdy_1  ), 
       .irdy_2( irdy_2  ), 
       .irdy_3( irdy_3  ), 
       .irdy_4( irdy_4  ), 
       .ilck_0( ilck_0  ), 
       .ilck_1( ilck_1  ), 
       .ilck_2( ilck_2  ), 
       .ilck_3( ilck_3  ), 
       .ilck_4( ilck_4  ), 

       .grt_0 ( vcsel[0] ? grt_0 : `Disable ), 
       .grt_1 ( vcsel[0] ? grt_1 : `Disable ), 
       .grt_2 ( vcsel[0] ? grt_2 : `Disable ), 
       .grt_3 ( vcsel[0] ? grt_3 : `Disable ), 
       .grt_4 ( vcsel[0] ? grt_4 : `Disable ),

       .fwdab_en( fwdab_en ),

       .req   ( req0    ),
       .port  ( port0   ),
       .ovch  ( ovch0   ),

       .clk ( clk  ), 
       .rst_( rst_ )  
);                  

/*  
 * Data transmission & merge
 */ 
assign  btype0  = bdata0[`TYPE_MSB:`TYPE_LSB];  // Flit type 

assign  merge = {bdata0[`TYPE_MSB:`UM_TYPE], addr1_rm, bdata0[`MSRC_MSB:`MVCH_LSB]};    // Multicast bdata

assign  bdata00 = bdata0[`UM_TYPE] ? merge : bdata0;    // U/M bdata

assign  odata0   = send0 ? bdata00 : `DATAW_P1'b0;

assign  ovalid0  = send0;

/* 
 * Routing computation logic 
 */ 
rtcomp #( MY_XPOS, MY_YPOS ) rc0 ( 
        .bdata0   ( bdata0 ),
        .en     ( btype0 == `TYPE_HEAD || btype0 == `TYPE_HEADTAIL ),
        .port   ( port0  ),
        .ovch   ( ovch0  ),
        .addr1_rm (addr1_rm),
        .fwdab_en( fwdab_en ),
        .clk    ( clk  ),
        .rst_   ( rst_ ) 
);

/* 
 * Input buffers
 */ 
fifo    ibuf0 ( 
        .idata  ( ivch == 0 ? idata  : `DATAW_P1'b0 ), 
        .odata  ( bdata0 ), 

        .wr_en  ( ivch == 0 ? ivalid : `Disable ), 
        .rd_en  ( send0 ), 
        .empty  ( /* not used */ ), 
        .full   ( /* not used */ ), 
        .ordy   ( ordy[0]        ), 

        .clk    ( clk  ), 
        .rst_   ( rst_ )  
); 
endmodule
