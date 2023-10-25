`include "define.v" 
module pe_set (
    p6_idata_p0,
    p6_ivalid_p0,
    p6_irdy_p0,

    p10_idata_p0,
    p10_ivalid_p0,
    p10_irdy_p0,

    p14_idata_p0,
    p14_ivalid_p0,
    p14_irdy_p0,

    p18_idata_p0,
    p18_ivalid_p0,
    p18_irdy_p0,

    p6_odata_p0,
    p6_ovalid_p0,
    p6_ovch_p0,

    p10_odata_p0,
    p10_ovalid_p0,
    p10_ovch_p0,

    p14_odata_p0,
    p14_ovalid_p0,
    p14_ovch_p0,

    p18_odata_p0,
    p18_ovalid_p0,
    p18_ovch_p0,

    clk,
    rst_
);

input   [`DATAW:0]  p6_idata_p0;
input               p6_ivalid_p0;
input   [`VCH:0]    p6_irdy_p0;

input   [`DATAW:0]  p10_idata_p0;
input               p10_ivalid_p0;
input   [`VCH:0]    p10_irdy_p0;

input   [`DATAW:0]  p14_idata_p0;
input               p14_ivalid_p0;
input   [`VCH:0]    p14_irdy_p0;

input   [`DATAW:0]  p18_idata_p0;
input               p18_ivalid_p0;
input   [`VCH:0]    p18_irdy_p0;

output  [`DATAW:0]  p6_odata_p0;
output              p6_ovalid_p0;
output  [`VCHW:0]   p6_ovch_p0;

output  [`DATAW:0]  p10_odata_p0;
output              p10_ovalid_p0;
output  [`VCHW:0]   p10_ovch_p0;

output  [`DATAW:0]  p14_odata_p0;
output              p14_ovalid_p0;
output  [`VCHW:0]   p14_ovch_p0;

output  [`DATAW:0]  p18_odata_p0;
output              p18_ovalid_p0;
output  [`VCHW:0]   p18_ovch_p0;

input   clk, rst_;

pe #( 6, 1, 2 ) p6 (       // PE ID, XPOS, YPOS
    .idata  ( p6_idata_p0 ),
    .ivalid ( p6_ivalid_p0 ),
    .irdy   ( p6_irdy_p0 ),

    .odata  ( p6_odata_p0 ),
    .ovalid ( p6_ovalid_p0 ),
    .ovch   ( p6_ovch_p0 ),

    .clk    ( clk ),
    .rst_   ( rst_ )
);

pe #( 10, 2, 2 ) p10 (       // PE ID, XPOS, YPOS
    .idata  ( p10_idata_p0 ),
    .ivalid ( p10_ivalid_p0 ),
    .irdy   ( p10_irdy_p0 ),

    .odata  ( p10_odata_p0 ),
    .ovalid ( p10_ovalid_p0 ),
    .ovch   ( p10_ovch_p0 ),

    .clk    ( clk ),
    .rst_   ( rst_ )
);

pe #( 14, 3, 2 ) p14 (       // PE ID, XPOS, YPOS
    .idata  ( p14_idata_p0 ),
    .ivalid ( p14_ivalid_p0 ),
    .irdy   ( p14_irdy_p0 ),

    .odata  ( p14_odata_p0 ),
    .ovalid ( p14_ovalid_p0 ),
    .ovch   ( p14_ovch_p0 ),

    .clk    ( clk ),
    .rst_   ( rst_ )
);

pe #( 18, 2, 2 ) p18 (       // PE ID, XPOS, YPOS
    .idata  ( p18_idata_p0 ),
    .ivalid ( p18_ivalid_p0 ),
    .irdy   ( p18_irdy_p0 ),

    .odata  ( p18_odata_p0 ),
    .ovalid ( p18_ovalid_p0 ),
    .ovch   ( p18_ovch_p0 ),

    .clk    ( clk ),
    .rst_   ( rst_ )
);

endmodule