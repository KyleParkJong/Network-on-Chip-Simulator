`include "define.v" 
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
        multab_en,

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
output  [`DSTATUS:0]    multab_en;

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
wire    [`MADDR:0]      addr1_rm0;
wire    [`DSTATUS:0]    multab_en0;

wire    [`DATAW:0]      odata1; 
wire                    ovalid1;
wire    [`VCHW:0]       ovch1;  
wire    [`PORTW:0]      port1;  
wire                    req1;   
wire                    send1;  
wire    [`DATAW:0]      bdata1;
wire    [`DATAW:0]      bdata11; 
wire    [`TYPEW:0]      btype1; 
wire    [`MADDR:0]      addr1_rm1;
wire    [`DSTATUS:0]    multab_en1;

wire    [`VCH:0]        vcsel;

wire    [`DATAW:0]      merge0;          // Merged data
wire    [`DATAW:0]      merge1;  

assign  oack[0]        = send0;
assign  oack[1]        = send1;

/* 
 * VC mux 
 */ 
vcmux vcmux ( 
        .ovalid0 ( ovalid0 ),
        .ovalid1 ( ovalid1 ),

        .odata0  ( odata0 ),
        .odata1  ( odata1 ),

        .ovch0   ( ovch0 ),
        .ovch1   ( ovch1 ),

        .req0    ( req0 ),
        .req1    ( req1 ),

        .port0   ( port0 ),
        .port1   ( port1 ),

        .multab_en0 ( multab_en0 ),
        .multab_en1 ( multab_en1 ),

        .ovalid  ( ovalid ),
        .odata   ( odata  ),
        .ovch    ( ovch   ),
        .req     ( req    ),
        .port    ( port   ),
        .vcsel   ( vcsel  ),
        .multab_en ( multab_en ),

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

       .multab_en( multab_en0 ),

       .req   ( req0    ),
       .port  ( port0   ),
       .ovch  ( ovch0   ),

       .clk ( clk  ), 
       .rst_( rst_ )  
);             

vc #( ROUTERID, PCHID, 1 ) vc_1 ( 
       .bdata ( bdata1  ), 
       .send  ( send1   ), 
       .olck  ( olck[1] ), 

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

       .grt_0 ( vcsel[1] ? grt_0 : `Disable ), 
       .grt_1 ( vcsel[1] ? grt_1 : `Disable ), 
       .grt_2 ( vcsel[1] ? grt_2 : `Disable ), 
       .grt_3 ( vcsel[1] ? grt_3 : `Disable ), 
       .grt_4 ( vcsel[1] ? grt_4 : `Disable ), 

       .multab_en( multab_en1 ),

       .req   ( req1    ),
       .port  ( port1   ),
       .ovch  ( ovch1   ),

       .clk ( clk  ), 
       .rst_( rst_ )  
);  

/*  
 * Data transmission & merge
 */ 
assign  btype0  = bdata0[`TYPE_MSB:`TYPE_LSB];  // Flit type 
assign  btype1  = bdata1[`TYPE_MSB:`TYPE_LSB];

assign  merge0 = {bdata0[`TYPE_MSB:`UM_TYPE], addr1_rm0, bdata0[`MSRC_MSB:`MVCH_LSB]};    // Multicast bdata
assign  merge1 = {bdata1[`TYPE_MSB:`UM_TYPE], addr1_rm1, bdata1[`MSRC_MSB:`MVCH_LSB]};    

assign  bdata00 = bdata0[`UM_TYPE] ? merge0 : bdata0;    // U/M bdata
assign  bdata11 = bdata1[`UM_TYPE] ? merge1 : bdata1;    // U/M bdata

assign  odata0   = send0 ? bdata00 : `DATAW_P1'b0;
assign  odata1   = send1 ? bdata11 : `DATAW_P1'b0;

assign  ovalid0  = send0;
assign  ovalid1  = send1;

/* 
 * Routing computation logic 
 */ 
rtcomp #( MY_XPOS, MY_YPOS ) rc0 ( 
        .bdata0   ( bdata0 ),
        .en     ( btype0 == `TYPE_HEAD || btype0 == `TYPE_HEADTAIL ),
        .port   ( port0  ),
        .ovch   ( ovch0  ),
        .addr1_rm (addr1_rm0),
        .multab_en( multab_en0 ),
        .clk    ( clk  ),
        .rst_   ( rst_ ) 
);

rtcomp #( MY_XPOS, MY_YPOS ) rc1 ( 
        .bdata0   ( bdata1 ),
        .en     ( btype1 == `TYPE_HEAD || btype1 == `TYPE_HEADTAIL ),
        .port   ( port1  ),
        .ovch   ( ovch1  ),
        .addr1_rm (addr1_rm1),
        .multab_en( multab_en1 ),
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

fifo    ibuf1 ( 
        .idata  ( ivch == 1 ? idata  : `DATAW_P1'b0 ), 
        .odata  ( bdata1 ), 

        .wr_en  ( ivch == 1 ? ivalid : `Disable ), 
        .rd_en  ( send1 ), 
        .empty  ( /* not used */ ), 
        .full   ( /* not used */ ), 
        .ordy   ( ordy[1]        ), 

        .clk    ( clk  ), 
        .rst_   ( rst_ )  
); 
endmodule
