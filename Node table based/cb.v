`include "define.h" 
module cb ( 
        idata_0,  
        ivalid_0, 
        ivch_0,   
        port_0,   
        req_0,    
        grt_0,
        fwdab_0,    

        idata_1,  
        ivalid_1, 
        ivch_1,   
        port_1,   
        req_1,    
        grt_1,
        fwdab_1,    

        idata_2,  
        ivalid_2, 
        ivch_2,   
        port_2,   
        req_2,    
        grt_2,
        fwdab_2,    

        idata_3,  
        ivalid_3, 
        ivch_3,   
        port_3,   
        req_3,    
        grt_3,
        fwdab_3,    

        idata_4,  
        ivalid_4, 
        ivch_4,   
        port_4,   
        req_4,    
        grt_4,
        fwdab_4,    

        odata_0,  
        ovalid_0, 
        ovch_0,   

        odata_1,  
        ovalid_1, 
        ovch_1,   

        odata_2,  
        ovalid_2, 
        ovch_2,   

        odata_3,  
        ovalid_3, 
        ovch_3,   

        odata_4,  
        ovalid_4, 
        ovch_4,   

        clk, 
        rst_ 
);

input   [`DATAW:0]      idata_0;  
input                   ivalid_0; 
input   [`VCHW:0]       ivch_0;   
input   [`PORTW:0]      port_0;   
input                   req_0;
output  [`PORT:0]       grt_0;    
input                   fwdab_0;    


input   [`DATAW:0]      idata_1;  
input                   ivalid_1; 
input   [`VCHW:0]       ivch_1;   
input   [`PORTW:0]      port_1;   
input                   req_1;
output  [`PORT:0]       grt_1;  
input                   fwdab_1;      

input   [`DATAW:0]      idata_2;  
input                   ivalid_2; 
input   [`VCHW:0]       ivch_2;   
input   [`PORTW:0]      port_2;   
input                   req_2;
output  [`PORT:0]       grt_2;  
input                   fwdab_2;      

input   [`DATAW:0]      idata_3;  
input                   ivalid_3; 
input   [`VCHW:0]       ivch_3;   
input   [`PORTW:0]      port_3;   
input                   req_3;
output  [`PORT:0]       grt_3;  
input                   fwdab_3;      

input   [`DATAW:0]      idata_4;  
input                   ivalid_4; 
input   [`VCHW:0]       ivch_4;   
input   [`PORTW:0]      port_4;   
input                   req_4;  
output  [`PORT:0]       grt_4;  
input                   fwdab_4;    

output  [`DATAW:0]      odata_0;  
output                  ovalid_0; 
output  [`VCHW:0]       ovch_0;   

output  [`DATAW:0]      odata_1;  
output                  ovalid_1; 
output  [`VCHW:0]       ovch_1;   

output  [`DATAW:0]      odata_2;  
output                  ovalid_2; 
output  [`VCHW:0]       ovch_2;   

output  [`DATAW:0]      odata_3;  
output                  ovalid_3; 
output  [`VCHW:0]       ovch_3;   

output  [`DATAW:0]      odata_4;  
output                  ovalid_4; 
output  [`VCHW:0]       ovch_4;   

input                   clk; 
input                   rst_;

wire    [`PORT:0]     cb_sel_0; 
wire    [`PORT:0]     cb_sel_1; 
wire    [`PORT:0]     cb_sel_2; 
wire    [`PORT:0]     cb_sel_3; 
wire    [`PORT:0]     cb_sel_4; 
wire    [`PORT:0]     cb_grt_0; 
wire    [`PORT:0]     cb_grt_1; 
wire    [`PORT:0]     cb_grt_2; 
wire    [`PORT:0]     cb_grt_3; 
wire    [`PORT:0]     cb_grt_4; 

muxcont #( 0 ) muxcont_0 ( 
        .port_0   ( port_0   ), 
        .req_0    ( req_0    ), 

        .port_1   ( port_1   ), 
        .req_1    ( req_1    ), 

        .port_2   ( port_2   ), 
        .req_2    ( req_2    ), 

        .port_3   ( port_3   ), 
        .req_3    ( req_3    ), 

        .port_4   ( port_4   ), 
        .req_4    ( req_4    ),

        .sel ( cb_sel_0 ), 
        .grt ( cb_grt_0 ), 

        .clk ( clk  ), 
        .rst_( rst_ ) 
); 

muxcont #( 1 ) muxcont_1 ( 
        .port_0   ( port_0   ), 
        .req_0    ( req_0    ), 

        .port_1   ( port_1   ), 
        .req_1    ( req_1    ), 

        .port_2   ( port_2   ), 
        .req_2    ( req_2    ), 

        .port_3   ( port_3   ), 
        .req_3    ( req_3    ), 

        .port_4   ( port_4   ), 
        .req_4    ( req_4    ),

        .sel ( cb_sel_1 ), 
        .grt ( cb_grt_1 ), 

        .clk ( clk  ), 
        .rst_( rst_ ) 
); 

muxcont #( 2 ) muxcont_2 ( 
        .port_0   ( port_0   ), 
        .req_0    ( req_0    ), 

        .port_1   ( port_1   ), 
        .req_1    ( req_1    ), 

        .port_2   ( port_2   ), 
        .req_2    ( req_2    ), 

        .port_3   ( port_3   ), 
        .req_3    ( req_3    ), 

        .port_4   ( port_4   ), 
        .req_4    ( req_4    ),

        .sel ( cb_sel_2 ), 
        .grt ( cb_grt_2 ), 

        .clk ( clk  ), 
        .rst_( rst_ ) 
); 

muxcont #( 3 ) muxcont_3 ( 
        .port_0   ( port_0   ), 
        .req_0    ( req_0    ), 

        .port_1   ( port_1   ), 
        .req_1    ( req_1    ), 

        .port_2   ( port_2   ), 
        .req_2    ( req_2    ), 

        .port_3   ( port_3   ), 
        .req_3    ( req_3    ), 

        .port_4   ( port_4   ), 
        .req_4    ( req_4    ),

        .sel ( cb_sel_3 ), 
        .grt ( cb_grt_3 ), 

        .clk ( clk  ), 
        .rst_( rst_ ) 
); 

muxcont4 #( 4 ) muxcont_4 ( 
        .port_0   ( port_0   ), 
        .req_0    ( req_0    ), 

        .port_1   ( port_1   ), 
        .req_1    ( req_1    ), 

        .port_2   ( port_2   ), 
        .req_2    ( req_2    ), 

        .port_3   ( port_3   ), 
        .req_3    ( req_3    ), 

        .port_4   ( port_4   ), 
        .req_4    ( req_4    ),

        .fwdab_0 ( fwdab_0 ),
        .fwdab_1 ( fwdab_1 ),
        .fwdab_2 ( fwdab_2 ),
        .fwdab_3 ( fwdab_3 ),
        .fwdab_4 ( fwdab_4 ), 

        .sel ( cb_sel_4 ), 
        .grt ( cb_grt_4 ), 

        .clk ( clk  ), 
        .rst_( rst_ ) 
); 

mux mux_0 ( 
        .idata_0  ( idata_0  ), 
        .ivalid_0 ( ivalid_0 ), 
        .ivch_0   ( ivch_0   ), 

        .idata_1  ( idata_1  ), 
        .ivalid_1 ( ivalid_1 ), 
        .ivch_1   ( ivch_1   ), 

        .idata_2  ( idata_2  ), 
        .ivalid_2 ( ivalid_2 ), 
        .ivch_2   ( ivch_2   ), 

        .idata_3  ( idata_3  ), 
        .ivalid_3 ( ivalid_3 ), 
        .ivch_3   ( ivch_3   ), 

        .idata_4  ( idata_4  ), 
        .ivalid_4 ( ivalid_4 ), 
        .ivch_4   ( ivch_4   ), 

        .odata  ( odata_0    ), 
        .ovalid ( ovalid_0   ), 
        .ovch   ( ovch_0     ), 

        .sel ( cb_sel_0 ) 
); 

mux mux_1 ( 
        .idata_0  ( idata_0  ), 
        .ivalid_0 ( ivalid_0 ), 
        .ivch_0   ( ivch_0   ), 

        .idata_1  ( idata_1  ), 
        .ivalid_1 ( ivalid_1 ), 
        .ivch_1   ( ivch_1   ), 

        .idata_2  ( idata_2  ), 
        .ivalid_2 ( ivalid_2 ), 
        .ivch_2   ( ivch_2   ), 

        .idata_3  ( idata_3  ), 
        .ivalid_3 ( ivalid_3 ), 
        .ivch_3   ( ivch_3   ), 

        .idata_4  ( idata_4  ), 
        .ivalid_4 ( ivalid_4 ), 
        .ivch_4   ( ivch_4   ), 

        .odata  ( odata_1    ), 
        .ovalid ( ovalid_1   ), 
        .ovch   ( ovch_1     ), 

        .sel ( cb_sel_1 ) 
); 

mux mux_2 ( 
        .idata_0  ( idata_0  ), 
        .ivalid_0 ( ivalid_0 ), 
        .ivch_0   ( ivch_0   ), 

        .idata_1  ( idata_1  ), 
        .ivalid_1 ( ivalid_1 ), 
        .ivch_1   ( ivch_1   ), 

        .idata_2  ( idata_2  ), 
        .ivalid_2 ( ivalid_2 ), 
        .ivch_2   ( ivch_2   ), 

        .idata_3  ( idata_3  ), 
        .ivalid_3 ( ivalid_3 ), 
        .ivch_3   ( ivch_3   ), 

        .idata_4  ( idata_4  ), 
        .ivalid_4 ( ivalid_4 ), 
        .ivch_4   ( ivch_4   ), 

        .odata  ( odata_2    ), 
        .ovalid ( ovalid_2   ), 
        .ovch   ( ovch_2     ), 

        .sel ( cb_sel_2 ) 
); 

mux mux_3 ( 
        .idata_0  ( idata_0  ), 
        .ivalid_0 ( ivalid_0 ), 
        .ivch_0   ( ivch_0   ), 

        .idata_1  ( idata_1  ), 
        .ivalid_1 ( ivalid_1 ), 
        .ivch_1   ( ivch_1   ), 

        .idata_2  ( idata_2  ), 
        .ivalid_2 ( ivalid_2 ), 
        .ivch_2   ( ivch_2   ), 

        .idata_3  ( idata_3  ), 
        .ivalid_3 ( ivalid_3 ), 
        .ivch_3   ( ivch_3   ), 

        .idata_4  ( idata_4  ), 
        .ivalid_4 ( ivalid_4 ), 
        .ivch_4   ( ivch_4   ), 

        .odata  ( odata_3    ), 
        .ovalid ( ovalid_3   ), 
        .ovch   ( ovch_3     ), 

        .sel ( cb_sel_3 ) 
); 

mux mux_4 ( 
        .idata_0  ( idata_0  ), 
        .ivalid_0 ( ivalid_0 ), 
        .ivch_0   ( ivch_0   ), 

        .idata_1  ( idata_1  ), 
        .ivalid_1 ( ivalid_1 ), 
        .ivch_1   ( ivch_1   ), 

        .idata_2  ( idata_2  ), 
        .ivalid_2 ( ivalid_2 ), 
        .ivch_2   ( ivch_2   ), 

        .idata_3  ( idata_3  ), 
        .ivalid_3 ( ivalid_3 ), 
        .ivch_3   ( ivch_3   ), 

        .idata_4  ( idata_4  ), 
        .ivalid_4 ( ivalid_4 ), 
        .ivch_4   ( ivch_4   ), 

        .odata  ( odata_4    ), 
        .ovalid ( ovalid_4   ), 
        .ovch   ( ovch_4     ), 

        .sel ( cb_sel_4 ) 
); 

assign grt_0[0]  = cb_grt_0[0]; 
assign grt_0[1]  = cb_grt_1[0]; 
assign grt_0[2]  = cb_grt_2[0]; 
assign grt_0[3]  = cb_grt_3[0]; 
assign grt_0[4]  = cb_grt_4[0]; 

assign grt_1[0]  = cb_grt_0[1]; 
assign grt_1[1]  = cb_grt_1[1]; 
assign grt_1[2]  = cb_grt_2[1]; 
assign grt_1[3]  = cb_grt_3[1]; 
assign grt_1[4]  = cb_grt_4[1]; 

assign grt_2[0]  = cb_grt_0[2]; 
assign grt_2[1]  = cb_grt_1[2]; 
assign grt_2[2]  = cb_grt_2[2]; 
assign grt_2[3]  = cb_grt_3[2]; 
assign grt_2[4]  = cb_grt_4[2]; 

assign grt_3[0]  = cb_grt_0[3]; 
assign grt_3[1]  = cb_grt_1[3]; 
assign grt_3[2]  = cb_grt_2[3]; 
assign grt_3[3]  = cb_grt_3[3]; 
assign grt_3[4]  = cb_grt_4[3]; 

assign grt_4[0]  = cb_grt_0[4]; 
assign grt_4[1]  = cb_grt_1[4]; 
assign grt_4[2]  = cb_grt_2[4]; 
assign grt_4[3]  = cb_grt_3[4]; 
assign grt_4[4]  = cb_grt_4[4]; 

endmodule
