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

/* FIFO 0 wires */
wire    [`DATAW:0]      odata0; 
wire                    ovalid0;
wire    [`VCHW:0]       ovch0;  
wire    [`PORTW:0]      port0;  
wire                    req0;   
wire                    send0;  
wire    [`DATAW:0]      bdata0;
wire    [`DATAW:0]      bdata00; 
wire    [`TYPEW:0]      btype0; 
wire    [`MADDR:0]      doc_send0;
wire    [`MADDR:0]      doc_remain0;
wire    [1:0]           umesh_state0;
wire    [`DSTATUS:0]    multab_en0; 

/* FIFO 1 wires */
wire    [`DATAW:0]      odata1; 
wire                    ovalid1;
wire    [`VCHW:0]       ovch1;  
wire    [`PORTW:0]      port1;  
wire                    req1;   
wire                    send1;  
wire    [`DATAW:0]      bdata1;
wire    [`DATAW:0]      bdata11; 
wire    [`TYPEW:0]      btype1; 
wire    [`MADDR:0]      doc_send1;
wire    [`MADDR:0]      doc_remain1;
wire    [1:0]           umesh_state1;
wire    [`DSTATUS:0]    multab_en1; 
wire    [`DATAW:0]      re_fifo_in0;

/* FIFO 2 wires */
wire    [`DATAW:0]      odata2; 
wire                    ovalid2;
wire    [`VCHW:0]       ovch2;  
wire    [`PORTW:0]      port2;  
wire                    req2;   
wire                    send2;  
wire    [`DATAW:0]      bdata2;
wire    [`DATAW:0]      bdata22; 
wire    [`TYPEW:0]      btype2; 
wire    [`MADDR:0]      doc_send2;
wire    [`MADDR:0]      doc_remain2;
wire    [`DSTATUS:0]    multab_en2; 
wire    [`DATAW:0]      re_fifo_in1; 

wire    [`DATAW:0]      header_send0;          // Merged data
wire    [`DATAW:0]      header_remain0;         
wire                    re_ordy1;

wire    [`DATAW:0]      header_send1;          // Merged data
wire    [`DATAW:0]      header_remain1;         
wire                    re_ordy2;

wire    [`DATAW:0]      header_send2; 

wire    [`VCH_R:0]        vcsel;             // (number of VC) * 3 

assign  oack[0]        = send0;

/* 
 * VC mux 
 */ 
vcmux vcmux ( 
        .ovalid0 ( ovalid0 ),
        .ovalid1 ( ovalid1 ),
        .ovalid2 ( ovalid2 ),

        .odata0  ( odata0 ),
        .odata1  ( odata1 ),
        .odata2  ( odata2 ),

        .ovch0   ( ovch0 ),
        .ovch1   ( ovch1 ),
        .ovch2   ( ovch2 ),

        .req0    ( req0 ),
        .req1    ( req1 ),
        .req2    ( req2 ),

        .port0   ( port0 ),
        .port1   ( port1 ),
        .port2   ( port2 ),

        .multab_en0 ( multab_en0 ),
        .multab_en1 ( multab_en1 ),
        .multab_en2 ( multab_en2 ),

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
       .olck  ( /**/ ),                 

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

vc #( ROUTERID, PCHID, 2 ) vc_2 ( 
       .bdata ( bdata2  ), 
       .send  ( send2   ), 
       .olck  ( /**/ ), 

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

       .grt_0 ( vcsel[2] ? grt_0 : `Disable ), 
       .grt_1 ( vcsel[2] ? grt_1 : `Disable ), 
       .grt_2 ( vcsel[2] ? grt_2 : `Disable ), 
       .grt_3 ( vcsel[2] ? grt_3 : `Disable ), 
       .grt_4 ( vcsel[2] ? grt_4 : `Disable ),

       .multab_en( multab_en2 ),

       .req   ( req2    ),
       .port  ( port2   ),
       .ovch  ( ovch2   ),

       .clk ( clk  ), 
       .rst_( rst_ )  
);  

/*  
 * Data transmission & merge
 */ 
assign  btype0  = bdata0[`TYPE_MSB:`TYPE_LSB];  
assign  btype1  = bdata1[`TYPE_MSB:`TYPE_LSB];  
assign  btype2  = bdata2[`TYPE_MSB:`TYPE_LSB];  

assign  header_send0   = {bdata0[`TYPE_MSB:`UM_TYPE], doc_send0, bdata0[`MSRC_MSB:`MVCH_LSB]};    // Multicast bdata
assign  header_remain0 = {bdata0[`TYPE_MSB:`UM_TYPE], doc_remain0, bdata0[`MSRC_MSB:`MVCH_LSB]};    // Multicast bdata

assign  header_send1   = {bdata1[`TYPE_MSB:`UM_TYPE], doc_send1, bdata1[`MSRC_MSB:`MVCH_LSB]};    // Multicast bdata
assign  header_remain1 = {bdata1[`TYPE_MSB:`UM_TYPE], doc_remain1, bdata1[`MSRC_MSB:`MVCH_LSB]};    // Multicast bdata

assign  header_send2   = {bdata2[`TYPE_MSB:`UM_TYPE], doc_send2, bdata2[`MSRC_MSB:`MVCH_LSB]};    // Multicast bdata

assign  re_fifo_in0 = (bdata0[`UM_TYPE] && ((btype0 == `TYPE_HEAD) || (btype0 == `TYPE_HEADTAIL))) ? header_remain0 : bdata0;
assign  re_fifo_in1 = (bdata1[`UM_TYPE] && ((btype1 == `TYPE_HEAD) || (btype1 == `TYPE_HEADTAIL))) ? header_remain1 : bdata1;

assign  bdata00 = (bdata0[`UM_TYPE] && ((btype0 == `TYPE_HEAD) || (btype0 == `TYPE_HEADTAIL))) ? header_send0 : bdata0;    
assign  bdata11 = (bdata1[`UM_TYPE] && ((btype1 == `TYPE_HEAD) || (btype1 == `TYPE_HEADTAIL))) ? header_send1 : bdata1;
assign  bdata22 = (bdata2[`UM_TYPE] && ((btype2 == `TYPE_HEAD) || (btype2 == `TYPE_HEADTAIL))) ? header_send2 : bdata2;

assign  odata0   = send0 ? bdata00 : `DATAW_P1'b0;
assign  odata1   = send1 ? bdata11 : `DATAW_P1'b0;
assign  odata2   = send2 ? bdata22 : `DATAW_P1'b0;

assign  ovalid0  = send0;
assign  ovalid1  = send1;
assign  ovalid2  = send2;

/* 
 * Routing computation logic 
 */ 
rtcomp_hl #( MY_XPOS, MY_YPOS ) rc0 ( 
        .bdata0   ( bdata0 ),
        .en     ( btype0 == `TYPE_HEAD || btype0 == `TYPE_HEADTAIL ),
        .ovch   ( ovch0  ),
        .port   ( port0  ),
        .doc_send ( doc_send0 ),
        .doc_remain ( doc_remain0 ),
        .umesh_state ( umesh_state0 ),
        .multab_en( multab_en0 ),
        .clk    ( clk  ),
        .rst_   ( rst_ ) 
);

rtcomp_hl #( MY_XPOS, MY_YPOS ) rc1 ( 
        .bdata0   ( bdata1 ),
        .en     ( btype1 == `TYPE_HEAD || btype1 == `TYPE_HEADTAIL ),
        .ovch   ( ovch1  ),
        .port   ( port1  ),
        .doc_send ( doc_send1 ),
        .doc_remain ( doc_remain1 ),
        .umesh_state ( umesh_state1 ),
        .multab_en( multab_en1 ),
        .clk    ( clk  ),
        .rst_   ( rst_ ) 
);

rtcomp_hl #( MY_XPOS, MY_YPOS ) rc2 ( 
        .bdata0   ( bdata2 ),
        .en     ( btype2 == `TYPE_HEAD || btype2 == `TYPE_HEADTAIL ),
        .ovch   ( ovch2  ),
        .port   ( port2  ),
        .doc_send ( doc_send2 ),
        .doc_remain ( /* */ ),
        .umesh_state ( /* */ ),
        .multab_en( multab_en2 ),
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
        .rd_en  ( send0 && re_ordy1 ), 
        .empty  ( /* not used */ ), 
        .full   ( /* not used */ ), 
        .ordy   ( ordy[0]        ), 

        .clk    ( clk  ), 
        .rst_   ( rst_ )  
); 

/* Re-FIFO */ 
re_fifo    re_ibuf0 ( 
        .idata  ( (send0 && ((umesh_state0 == `UMESH_UNI_CENTER) || (umesh_state0 == `UMESH_MULT_COL))) ? re_fifo_in0 : `DATAW_P1'b0 ), 
        .odata  ( bdata1 ), 

        .wr_en  ( (send0 && ((umesh_state0 == `UMESH_UNI_CENTER) || (umesh_state0 == `UMESH_MULT_COL))) ? `Enable : `Disable ),  
        .rd_en  ( send1 && re_ordy2 ),      
        .empty  ( /* not used */ ), 
        .full   ( /* not used */ ), 
        .ordy   ( re_ordy1 ), 

        .clk    ( clk  ), 
        .rst_   ( rst_ )  
); 

/* Re-FIFO : FIFO for UMESH_MULT_COL */ 
re_fifo    re_ibuf1 ( 
        .idata  ( (send1 && (umesh_state1 == `UMESH_MULT_COL)) ? re_fifo_in1 : `DATAW_P1'b0 ), 
        .odata  ( bdata2 ), 

        .wr_en  ( (send1 && (umesh_state1 == `UMESH_MULT_COL)) ? `Enable : `Disable ),  
        .rd_en  ( send2 ),      
        .empty  ( /* not used */ ), 
        .full   ( /* not used */ ), 
        .ordy   ( re_ordy2 ), 

        .clk    ( clk  ), 
        .rst_   ( rst_ )  
); 


endmodule
