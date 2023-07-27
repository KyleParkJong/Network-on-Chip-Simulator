`include "define.h" 
module router ( 
        idata_0,  
        ivalid_0, 
        ivch_0,   
        oack_0,   
        ordy_0,   
        olck_0,   

        idata_1,  
        ivalid_1, 
        ivch_1,   
        oack_1,   
        ordy_1,   
        olck_1,   

        idata_2,  
        ivalid_2, 
        ivch_2,   
        oack_2,   
        ordy_2,   
        olck_2,   

        idata_3,  
        ivalid_3, 
        ivch_3,   
        oack_3,   
        ordy_3,   
        olck_3,   

        idata_4,  
        ivalid_4, 
        ivch_4,   
        oack_4,   
        ordy_4,   
        olck_4,   

        odata_0,  
        ovalid_0, 
        ovch_0,   
        iack_0,   
        ilck_0,   

        odata_1,  
        ovalid_1, 
        ovch_1,   
        iack_1,   
        ilck_1,   

        odata_2,  
        ovalid_2, 
        ovch_2,   
        iack_2,   
        ilck_2,   

        odata_3,  
        ovalid_3, 
        ovch_3,   
        iack_3,   
        ilck_3,   

        odata_4,  
        ovalid_4, 
        ovch_4,   
        iack_4,   
        ilck_4,   

        clk, 
        rst_ 
);
parameter       ROUTERID  = 0;
parameter       MY_XPOS   = 0;
parameter       MY_YPOS   = 0;

input   [`DATAW:0] idata_0;  
input              ivalid_0; 
input   [`VCHW:0]  ivch_0;   
output  [`VCH:0]   oack_0;   
output  [`VCH:0]   ordy_0;   
output  [`VCH:0]   olck_0;   

input   [`DATAW:0] idata_1;  
input              ivalid_1; 
input   [`VCHW:0]  ivch_1;   
output  [`VCH:0]   oack_1;   
output  [`VCH:0]   ordy_1;   
output  [`VCH:0]   olck_1;   

input   [`DATAW:0] idata_2;  
input              ivalid_2; 
input   [`VCHW:0]  ivch_2;   
output  [`VCH:0]   oack_2;   
output  [`VCH:0]   ordy_2;   
output  [`VCH:0]   olck_2;   

input   [`DATAW:0] idata_3;  
input              ivalid_3; 
input   [`VCHW:0]  ivch_3;   
output  [`VCH:0]   oack_3;   
output  [`VCH:0]   ordy_3;   
output  [`VCH:0]   olck_3;   

input   [`DATAW:0] idata_4;  
input              ivalid_4; 
input   [`VCHW:0]  ivch_4;   
output  [`VCH:0]   oack_4;   
output  [`VCH:0]   ordy_4;   
output  [`VCH:0]   olck_4;   

output  [`DATAW:0] odata_0;  
output             ovalid_0; 
output  [`VCHW:0]  ovch_0;   
input   [`VCH:0]   iack_0;   
input   [`VCH:0]   ilck_0;   

output  [`DATAW:0] odata_1;  
output             ovalid_1; 
output  [`VCHW:0]  ovch_1;   
input   [`VCH:0]   iack_1;   
input   [`VCH:0]   ilck_1;   

output  [`DATAW:0] odata_2;  
output             ovalid_2; 
output  [`VCHW:0]  ovch_2;   
input   [`VCH:0]   iack_2;   
input   [`VCH:0]   ilck_2;   

output  [`DATAW:0] odata_3;  
output             ovalid_3; 
output  [`VCHW:0]  ovch_3;   
input   [`VCH:0]   iack_3;   
input   [`VCH:0]   ilck_3;   

output  [`DATAW:0] odata_4;  
output             ovalid_4; 
output  [`VCHW:0]  ovch_4;   
input   [`VCH:0]   iack_4;   
input   [`VCH:0]   ilck_4;   

input    clk;  
input    rst_; 

/* 
 * Wires from input channels (ic_) 
 */ 
wire [`DATAW:0] ic_odata_0; 
wire [`DATAW:0] ic_odata_1; 
wire [`DATAW:0] ic_odata_2; 
wire [`DATAW:0] ic_odata_3; 
wire [`DATAW:0] ic_odata_4; 

wire            ic_ovalid_0; 
wire            ic_ovalid_1; 
wire            ic_ovalid_2; 
wire            ic_ovalid_3; 
wire            ic_ovalid_4; 

wire [`VCHW:0]  ic_ovch_0; 
wire [`VCHW:0]  ic_ovch_1; 
wire [`VCHW:0]  ic_ovch_2; 
wire [`VCHW:0]  ic_ovch_3; 
wire [`VCHW:0]  ic_ovch_4; 

wire [`PORTW:0] ic_port_0; 
wire [`PORTW:0] ic_port_1; 
wire [`PORTW:0] ic_port_2; 
wire [`PORTW:0] ic_port_3; 
wire [`PORTW:0] ic_port_4; 

wire            ic_req_0; 
wire            ic_req_1; 
wire            ic_req_2; 
wire            ic_req_3; 
wire            ic_req_4; 

/* Wires form input to corssbar*/
<<<<<<< HEAD
wire [`DSTATUS:0] multab_0;
wire [`DSTATUS:0] multab_1;
wire [`DSTATUS:0] multab_2;
wire [`DSTATUS:0] multab_3;
wire [`DSTATUS:0] multab_4;
=======
wire            fwdab_0;
wire            fwdab_1;
wire            fwdab_2;
wire            fwdab_3;
wire            fwdab_4;
>>>>>>> parent of 66a1952 (7.20 version)

/* 
 * Wires from crossbar (cb_) 
 */ 
wire [`DATAW:0] cb_odata_0; 
wire [`DATAW:0] cb_odata_1; 
wire [`DATAW:0] cb_odata_2; 
wire [`DATAW:0] cb_odata_3; 
wire [`DATAW:0] cb_odata_4; 

wire            cb_ovalid_0; 
wire            cb_ovalid_1; 
wire            cb_ovalid_2; 
wire            cb_ovalid_3; 
wire            cb_ovalid_4; 

wire [`VCHW:0]  cb_ovch_0; 
wire [`VCHW:0]  cb_ovch_1; 
wire [`VCHW:0]  cb_ovch_2; 
wire [`VCHW:0]  cb_ovch_3; 
wire [`VCHW:0]  cb_ovch_4; 

wire [`PORT:0]  cb_grt_0; 
wire [`PORT:0]  cb_grt_1; 
wire [`PORT:0]  cb_grt_2; 
wire [`PORT:0]  cb_grt_3; 
wire [`PORT:0]  cb_grt_4; 

/* 
 * Wires from output channels (oc_) 
 */ 
wire [`VCH:0]   oc_ordy_0; 
wire [`VCH:0]   oc_ordy_1; 
wire [`VCH:0]   oc_ordy_2; 
wire [`VCH:0]   oc_ordy_3; 
wire [`VCH:0]   oc_ordy_4; 

wire [`VCH:0]   oc_olck_0; 
wire [`VCH:0]   oc_olck_1; 
wire [`VCH:0]   oc_olck_2; 
wire [`VCH:0]   oc_olck_3; 
wire [`VCH:0]   oc_olck_4; 

/* 
 * Input physical channels 
 * 각 port별로 router 내부에서 동작 결정 과정
 * 각 odata와 ovch 내보낼 port에 대해서 지정하고 해당 정보를 crossbar로 전송
 */ 
inputc #( ROUTERID, 0, MY_XPOS, MY_YPOS ) ic_0 ( 
       .idata ( idata_0     ), 
       .ivalid( ivalid_0    ), 
       .ivch  ( ivch_0      ), 
       .oack  ( oack_0      ), 
       .ordy  ( ordy_0      ), 
       .olck  ( olck_0      ), 

       .odata ( ic_odata_0  ), 
       .ovalid( ic_ovalid_0 ), 
       .ovch  ( ic_ovch_0   ), 

       .irdy_0( oc_ordy_0   ), 
       .irdy_1( oc_ordy_1   ), 
       .irdy_2( oc_ordy_2   ), 
       .irdy_3( oc_ordy_3   ), 
       .irdy_4( oc_ordy_4   ), 
       .ilck_0( oc_olck_0   ), 
       .ilck_1( oc_olck_1   ), 
       .ilck_2( oc_olck_2   ), 
       .ilck_3( oc_olck_3   ), 
       .ilck_4( oc_olck_4   ), 

       .grt_0 ( cb_grt_0[0] ), 
       .grt_1 ( cb_grt_0[1] ), 
       .grt_2 ( cb_grt_0[2] ), 
       .grt_3 ( cb_grt_0[3] ), 
       .grt_4 ( cb_grt_0[4] ), 

       .port  ( ic_port_0   ), 
       .req   ( ic_req_0    ),
       .fwdab_en (fwdab_0), 

       .clk ( clk  ),          
       .rst_( rst_ )           
);                             

inputc #( ROUTERID, 1, MY_XPOS, MY_YPOS ) ic_1 ( 
       .idata ( idata_1     ), 
       .ivalid( ivalid_1    ), 
       .ivch  ( ivch_1      ), 
       .oack  ( oack_1      ), 
       .ordy  ( ordy_1      ), 
       .olck  ( olck_1      ), 

       .odata ( ic_odata_1  ), 
       .ovalid( ic_ovalid_1 ), 
       .ovch  ( ic_ovch_1   ), 

       .irdy_0( oc_ordy_0   ), 
       .irdy_1( oc_ordy_1   ), 
       .irdy_2( oc_ordy_2   ), 
       .irdy_3( oc_ordy_3   ), 
       .irdy_4( oc_ordy_4   ), 
       .ilck_0( oc_olck_0   ), 
       .ilck_1( oc_olck_1   ), 
       .ilck_2( oc_olck_2   ), 
       .ilck_3( oc_olck_3   ), 
       .ilck_4( oc_olck_4   ), 

       .grt_0 ( cb_grt_1[0] ), 
       .grt_1 ( cb_grt_1[1] ), 
       .grt_2 ( cb_grt_1[2] ), 
       .grt_3 ( cb_grt_1[3] ), 
       .grt_4 ( cb_grt_1[4] ), 

       .port  ( ic_port_1   ), 
       .req   ( ic_req_1    ),
       .fwdab_en (fwdab_1), 

       .clk ( clk  ),          
       .rst_( rst_ )           
);                             

inputc #( ROUTERID, 2, MY_XPOS, MY_YPOS ) ic_2 ( 
       .idata ( idata_2     ), 
       .ivalid( ivalid_2    ), 
       .ivch  ( ivch_2      ), 
       .oack  ( oack_2      ), 
       .ordy  ( ordy_2      ), 
       .olck  ( olck_2      ), 

       .odata ( ic_odata_2  ), 
       .ovalid( ic_ovalid_2 ), 
       .ovch  ( ic_ovch_2   ), 

       .irdy_0( oc_ordy_0   ), 
       .irdy_1( oc_ordy_1   ), 
       .irdy_2( oc_ordy_2   ), 
       .irdy_3( oc_ordy_3   ), 
       .irdy_4( oc_ordy_4   ), 
       .ilck_0( oc_olck_0   ), 
       .ilck_1( oc_olck_1   ), 
       .ilck_2( oc_olck_2   ), 
       .ilck_3( oc_olck_3   ), 
       .ilck_4( oc_olck_4   ), 

       .grt_0 ( cb_grt_2[0] ), 
       .grt_1 ( cb_grt_2[1] ), 
       .grt_2 ( cb_grt_2[2] ), 
       .grt_3 ( cb_grt_2[3] ), 
       .grt_4 ( cb_grt_2[4] ), 

       .port  ( ic_port_2   ), 
       .req   ( ic_req_2    ),
       .fwdab_en (fwdab_2),  

       .clk ( clk  ),          
       .rst_( rst_ )           
);                             

inputc #( ROUTERID, 3, MY_XPOS, MY_YPOS ) ic_3 ( 
       .idata ( idata_3     ), 
       .ivalid( ivalid_3    ), 
       .ivch  ( ivch_3      ), 
       .oack  ( oack_3      ), 
       .ordy  ( ordy_3      ), 
       .olck  ( olck_3      ), 

       .odata ( ic_odata_3  ), 
       .ovalid( ic_ovalid_3 ), 
       .ovch  ( ic_ovch_3   ), 

       .irdy_0( oc_ordy_0   ), 
       .irdy_1( oc_ordy_1   ), 
       .irdy_2( oc_ordy_2   ), 
       .irdy_3( oc_ordy_3   ), 
       .irdy_4( oc_ordy_4   ), 
       .ilck_0( oc_olck_0   ), 
       .ilck_1( oc_olck_1   ), 
       .ilck_2( oc_olck_2   ), 
       .ilck_3( oc_olck_3   ), 
       .ilck_4( oc_olck_4   ), 

       .grt_0 ( cb_grt_3[0] ), 
       .grt_1 ( cb_grt_3[1] ), 
       .grt_2 ( cb_grt_3[2] ), 
       .grt_3 ( cb_grt_3[3] ), 
       .grt_4 ( cb_grt_3[4] ), 

       .port  ( ic_port_3   ), 
       .req   ( ic_req_3    ), 
       .fwdab_en (fwdab_3), 

       .clk ( clk  ),          
       .rst_( rst_ )           
);                             

inputc #( ROUTERID, 4, MY_XPOS, MY_YPOS ) ic_4 ( 
       .idata ( idata_4     ), 
       .ivalid( ivalid_4    ), 
       .ivch  ( ivch_4      ), 
       .oack  ( oack_4      ), 
       .ordy  ( ordy_4      ), 
       .olck  ( olck_4      ), 

       .odata ( ic_odata_4  ), 
       .ovalid( ic_ovalid_4 ), 
       .ovch  ( ic_ovch_4   ), 

       .irdy_0( oc_ordy_0   ), 
       .irdy_1( oc_ordy_1   ), 
       .irdy_2( oc_ordy_2   ), 
       .irdy_3( oc_ordy_3   ), 
       .irdy_4( oc_ordy_4   ), 
       .ilck_0( oc_olck_0   ), 
       .ilck_1( oc_olck_1   ), 
       .ilck_2( oc_olck_2   ), 
       .ilck_3( oc_olck_3   ), 
       .ilck_4( oc_olck_4   ), 

       .grt_0 ( cb_grt_4[0] ), 
       .grt_1 ( cb_grt_4[1] ), 
       .grt_2 ( cb_grt_4[2] ), 
       .grt_3 ( cb_grt_4[3] ), 
       .grt_4 ( cb_grt_4[4] ), 

       .port  ( ic_port_4   ), 
       .req   ( ic_req_4    ),
       .fwdab_en (fwdab_4),  

       .clk ( clk  ),          
       .rst_( rst_ )           
);                             


/* 
 * Crossbar switch 
 * fwdab_en signal input(0607)
 */ 
cb cb ( 
        .idata_0 ( ic_odata_0  ), 
        .ivalid_0( ic_ovalid_0 ), 
        .ivch_0  ( ic_ovch_0   ), 
        .port_0  ( ic_port_0   ), 
        .req_0   ( ic_req_0    ), 
        .grt_0   ( cb_grt_0    ),
        .fwdab_0 (fwdab_0), 

        .idata_1 ( ic_odata_1  ), 
        .ivalid_1( ic_ovalid_1 ), 
        .ivch_1  ( ic_ovch_1   ), 
        .port_1  ( ic_port_1   ), 
        .req_1   ( ic_req_1    ), 
        .grt_1   ( cb_grt_1    ),
        .fwdab_1 (fwdab_1), 

        .idata_2 ( ic_odata_2  ), 
        .ivalid_2( ic_ovalid_2 ), 
        .ivch_2  ( ic_ovch_2   ), 
        .port_2  ( ic_port_2   ), 
        .req_2   ( ic_req_2    ), 
        .grt_2   ( cb_grt_2    ), 
        .fwdab_2 (fwdab_2),

        .idata_3 ( ic_odata_3  ), 
        .ivalid_3( ic_ovalid_3 ), 
        .ivch_3  ( ic_ovch_3   ), 
        .port_3  ( ic_port_3   ), 
        .req_3   ( ic_req_3    ), 
        .grt_3   ( cb_grt_3    ), 
        .fwdab_3 (fwdab_3),

        .idata_4 ( ic_odata_4  ), 
        .ivalid_4( ic_ovalid_4 ), 
        .ivch_4  ( ic_ovch_4   ), 
        .port_4  ( ic_port_4   ), 
        .req_4   ( ic_req_4    ), 
        .grt_4   ( cb_grt_4    ), 
        .fwdab_4 (fwdab_4),

        .odata_0 ( cb_odata_0  ), 
        .ovalid_0( cb_ovalid_0 ), 
        .ovch_0  ( cb_ovch_0   ), 

        .odata_1 ( cb_odata_1  ), 
        .ovalid_1( cb_ovalid_1 ), 
        .ovch_1  ( cb_ovch_1   ), 

        .odata_2 ( cb_odata_2  ), 
        .ovalid_2( cb_ovalid_2 ), 
        .ovch_2  ( cb_ovch_2   ), 

        .odata_3 ( cb_odata_3  ), 
        .ovalid_3( cb_ovalid_3 ), 
        .ovch_3  ( cb_ovch_3   ), 

        .odata_4 ( cb_odata_4  ), 
        .ovalid_4( cb_ovalid_4 ), 
        .ovch_4  ( cb_ovch_4   ), 

        .clk ( clk  ),
        .rst_( rst_ ) 
);                    

/* 
 * Output channels 
 */ 
outputc #( ROUTERID, 0 ) oc_0 ( 
       .idata ( cb_odata_0  ), 
       .ivalid( cb_ovalid_0 ), 
       .ivch  ( cb_ovch_0   ), 

       .odata ( odata_0     ), 
       .ovalid( ovalid_0    ), 
       .ovch  ( ovch_0      ), 

       .iack  ( iack_0      ), 
       .ordy  ( oc_ordy_0   ), 

       .ilck  ( ilck_0      ), 
       .olck  ( oc_olck_0   ), 

       .clk ( clk  ),
       .rst_( rst_ ) 
);                  

outputc #( ROUTERID, 1 ) oc_1 ( 
       .idata ( cb_odata_1  ), 
       .ivalid( cb_ovalid_1 ), 
       .ivch  ( cb_ovch_1   ), 

       .odata ( odata_1     ), 
       .ovalid( ovalid_1    ), 
       .ovch  ( ovch_1      ), 

       .iack  ( iack_1      ), 
       .ordy  ( oc_ordy_1   ), 

       .ilck  ( ilck_1      ), 
       .olck  ( oc_olck_1   ), 

       .clk ( clk  ),
       .rst_( rst_ ) 
);                  

outputc #( ROUTERID, 2 ) oc_2 ( 
       .idata ( cb_odata_2  ), 
       .ivalid( cb_ovalid_2 ), 
       .ivch  ( cb_ovch_2   ), 

       .odata ( odata_2     ), 
       .ovalid( ovalid_2    ), 
       .ovch  ( ovch_2      ), 

       .iack  ( iack_2      ), 
       .ordy  ( oc_ordy_2   ), 

       .ilck  ( ilck_2      ), 
       .olck  ( oc_olck_2   ), 

       .clk ( clk  ),
       .rst_( rst_ ) 
);                  

outputc #( ROUTERID, 3 ) oc_3 ( 
       .idata ( cb_odata_3  ), 
       .ivalid( cb_ovalid_3 ), 
       .ivch  ( cb_ovch_3   ), 

       .odata ( odata_3     ), 
       .ovalid( ovalid_3    ), 
       .ovch  ( ovch_3      ), 

       .iack  ( iack_3      ), 
       .ordy  ( oc_ordy_3   ), 

       .ilck  ( ilck_3      ), 
       .olck  ( oc_olck_3   ), 

       .clk ( clk  ),
       .rst_( rst_ ) 
);                  

outputc #( ROUTERID, 4 ) oc_4 ( 
       .idata ( cb_odata_4  ), 
       .ivalid( cb_ovalid_4 ), 
       .ivch  ( cb_ovch_4   ), 

       .odata ( odata_4     ), 
       .ovalid( ovalid_4    ), 
       .ovch  ( ovch_4      ), 

       .iack  ( iack_4      ), 
       .ordy  ( oc_ordy_4   ), 

       .ilck  ( ilck_4      ), 
       .olck  ( oc_olck_4   ), 

       .clk ( clk  ),
       .rst_( rst_ ) 
);                  

endmodule
