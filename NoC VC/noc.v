`include "define.v" 
module noc ( 

        /* n0 */ 
        n0_idata_p0,  
        n0_ivalid_p0, 
        n0_ivch_p0,   
        n0_ordy_p0,   
        n0_odata_p0,  
        n0_ovalid_p0, 

        /* n1 */ 
        n1_idata_p0,  
        n1_ivalid_p0, 
        n1_ivch_p0,   
        n1_ordy_p0,   
        n1_odata_p0,  
        n1_ovalid_p0, 

        /* n2 */ 
        n2_idata_p0,  
        n2_ivalid_p0, 
        n2_ivch_p0,   
        n2_ordy_p0,   
        n2_odata_p0,  
        n2_ovalid_p0, 

        /* n3 */ 
        n3_idata_p0,  
        n3_ivalid_p0, 
        n3_ivch_p0,   
        n3_ordy_p0,   
        n3_odata_p0,  
        n3_ovalid_p0, 

        /* n4 */ 
        n4_idata_p0,  
        n4_ivalid_p0, 
        n4_ivch_p0,   
        n4_ordy_p0,   
        n4_odata_p0,  
        n4_ovalid_p0, 

        /* n5 */ 
        n5_idata_p0,  
        n5_ivalid_p0, 
        n5_ivch_p0,   
        n5_ordy_p0,   
        n5_odata_p0,  
        n5_ovalid_p0, 

        /* n6 */ 
        n6_idata_p0,  
        n6_ivalid_p0, 
        n6_ivch_p0,   
        n6_ordy_p0,   
        n6_odata_p0,  
        n6_ovalid_p0, 

        /* n7 */ 
        n7_idata_p0,  
        n7_ivalid_p0, 
        n7_ivch_p0,   
        n7_ordy_p0,   
        n7_odata_p0,  
        n7_ovalid_p0, 

        /* n8 */ 
        n8_idata_p0,  
        n8_ivalid_p0, 
        n8_ivch_p0,   
        n8_ordy_p0,   
        n8_odata_p0,  
        n8_ovalid_p0, 

        /* n9 */ 
        n9_idata_p0,  
        n9_ivalid_p0, 
        n9_ivch_p0,   
        n9_ordy_p0,   
        n9_odata_p0,  
        n9_ovalid_p0, 

        /* n10 */ 
        n10_idata_p0,  
        n10_ivalid_p0, 
        n10_ivch_p0,   
        n10_ordy_p0,   
        n10_odata_p0,  
        n10_ovalid_p0, 

        /* n11 */ 
        n11_idata_p0,  
        n11_ivalid_p0, 
        n11_ivch_p0,   
        n11_ordy_p0,   
        n11_odata_p0,  
        n11_ovalid_p0, 

        /* n12 */ 
        n12_idata_p0,  
        n12_ivalid_p0, 
        n12_ivch_p0,   
        n12_ordy_p0,   
        n12_odata_p0,  
        n12_ovalid_p0, 

        /* n13 */ 
        n13_idata_p0,  
        n13_ivalid_p0, 
        n13_ivch_p0,   
        n13_ordy_p0,   
        n13_odata_p0,  
        n13_ovalid_p0, 

        /* n14 */ 
        n14_idata_p0,  
        n14_ivalid_p0, 
        n14_ivch_p0,   
        n14_ordy_p0,   
        n14_odata_p0,  
        n14_ovalid_p0, 

        /* n15 */ 
        n15_idata_p0,  
        n15_ivalid_p0, 
        n15_ivch_p0,   
        n15_ordy_p0,   
        n15_odata_p0,  
        n15_ovalid_p0, 

        /* n16 */ 
        n16_idata_p0,  
        n16_ivalid_p0, 
        n16_ivch_p0,   
        n16_ordy_p0,   
        n16_odata_p0,  
        n16_ovalid_p0, 

        /* n17 */ 
        n17_idata_p0,  
        n17_ivalid_p0, 
        n17_ivch_p0,   
        n17_ordy_p0,   
        n17_odata_p0,  
        n17_ovalid_p0, 

        /* n18 */ 
        n18_idata_p0,  
        n18_ivalid_p0, 
        n18_ivch_p0,   
        n18_ordy_p0,   
        n18_odata_p0,  
        n18_ovalid_p0,  

        /* n19 */ 
        n19_idata_p0,  
        n19_ivalid_p0, 
        n19_ivch_p0,   
        n19_ordy_p0,   
        n19_odata_p0,  
        n19_ovalid_p0,

        clk, 
        rst_
);   

/* n0 */ 
input   [`DATAW:0]      n0_idata_p0;  
input                   n0_ivalid_p0; 
input   [`VCHW:0]       n0_ivch_p0;   
output  [`VCH:0]        n0_ordy_p0;   
output  [`DATAW:0]      n0_odata_p0;  
output                  n0_ovalid_p0; 

/* n1 */ 
input   [`DATAW:0]      n1_idata_p0;  
input                   n1_ivalid_p0; 
input   [`VCHW:0]       n1_ivch_p0;   
output  [`VCH:0]        n1_ordy_p0;   
output  [`DATAW:0]      n1_odata_p0;  
output                  n1_ovalid_p0; 

/* n2 */ 
input   [`DATAW:0]      n2_idata_p0;  
input                   n2_ivalid_p0; 
input   [`VCHW:0]       n2_ivch_p0;   
output  [`VCH:0]        n2_ordy_p0;   
output  [`DATAW:0]      n2_odata_p0;  
output                  n2_ovalid_p0; 

/* n3 */ 
input   [`DATAW:0]      n3_idata_p0;  
input                   n3_ivalid_p0; 
input   [`VCHW:0]       n3_ivch_p0;   
output  [`VCH:0]        n3_ordy_p0;   
output  [`DATAW:0]      n3_odata_p0;  
output                  n3_ovalid_p0; 

/* n4 */ 
input   [`DATAW:0]      n4_idata_p0;  
input                   n4_ivalid_p0; 
input   [`VCHW:0]       n4_ivch_p0;   
output  [`VCH:0]        n4_ordy_p0;   
output  [`DATAW:0]      n4_odata_p0;  
output                  n4_ovalid_p0; 

/* n5 */ 
input   [`DATAW:0]      n5_idata_p0;  
input                   n5_ivalid_p0; 
input   [`VCHW:0]       n5_ivch_p0;   
output  [`VCH:0]        n5_ordy_p0;   
output  [`DATAW:0]      n5_odata_p0;  
output                  n5_ovalid_p0; 

/* n6 */ 
input   [`DATAW:0]      n6_idata_p0;  
input                   n6_ivalid_p0; 
input   [`VCHW:0]       n6_ivch_p0;   
output  [`VCH:0]        n6_ordy_p0;   
output  [`DATAW:0]      n6_odata_p0;  
output                  n6_ovalid_p0; 

/* n7 */ 
input   [`DATAW:0]      n7_idata_p0;  
input                   n7_ivalid_p0; 
input   [`VCHW:0]       n7_ivch_p0;   
output  [`VCH:0]        n7_ordy_p0;   
output  [`DATAW:0]      n7_odata_p0;  
output                  n7_ovalid_p0; 

/* n8 */ 
input   [`DATAW:0]      n8_idata_p0;  
input                   n8_ivalid_p0; 
input   [`VCHW:0]       n8_ivch_p0;   
output  [`VCH:0]        n8_ordy_p0;   
output  [`DATAW:0]      n8_odata_p0;  
output                  n8_ovalid_p0; 

/* n9 */ 
input   [`DATAW:0]      n9_idata_p0;  
input                   n9_ivalid_p0; 
input   [`VCHW:0]       n9_ivch_p0;   
output  [`VCH:0]        n9_ordy_p0;   
output  [`DATAW:0]      n9_odata_p0;  
output                  n9_ovalid_p0; 

/* n10 */ 
input   [`DATAW:0]      n10_idata_p0;  
input                   n10_ivalid_p0; 
input   [`VCHW:0]       n10_ivch_p0;   
output  [`VCH:0]        n10_ordy_p0;   
output  [`DATAW:0]      n10_odata_p0;  
output                  n10_ovalid_p0; 

/* n11 */ 
input   [`DATAW:0]      n11_idata_p0;  
input                   n11_ivalid_p0; 
input   [`VCHW:0]       n11_ivch_p0;   
output  [`VCH:0]        n11_ordy_p0;   
output  [`DATAW:0]      n11_odata_p0;  
output                  n11_ovalid_p0; 

/* n12 */ 
input   [`DATAW:0]      n12_idata_p0;  
input                   n12_ivalid_p0; 
input   [`VCHW:0]       n12_ivch_p0;   
output  [`VCH:0]        n12_ordy_p0;   
output  [`DATAW:0]      n12_odata_p0;  
output                  n12_ovalid_p0; 

/* n13 */ 
input   [`DATAW:0]      n13_idata_p0;  
input                   n13_ivalid_p0; 
input   [`VCHW:0]       n13_ivch_p0;   
output  [`VCH:0]        n13_ordy_p0;   
output  [`DATAW:0]      n13_odata_p0;  
output                  n13_ovalid_p0; 

/* n14 */ 
input   [`DATAW:0]      n14_idata_p0;  
input                   n14_ivalid_p0; 
input   [`VCHW:0]       n14_ivch_p0;   
output  [`VCH:0]        n14_ordy_p0;   
output  [`DATAW:0]      n14_odata_p0;  
output                  n14_ovalid_p0; 

/* n15 */ 
input   [`DATAW:0]      n15_idata_p0;  
input                   n15_ivalid_p0; 
input   [`VCHW:0]       n15_ivch_p0;   
output  [`VCH:0]        n15_ordy_p0;   
output  [`DATAW:0]      n15_odata_p0;  
output                  n15_ovalid_p0; 

/* n16 */ 
input   [`DATAW:0]      n16_idata_p0;  
input                   n16_ivalid_p0; 
input   [`VCHW:0]       n16_ivch_p0;   
output  [`VCH:0]        n16_ordy_p0;   
output  [`DATAW:0]      n16_odata_p0;  
output                  n16_ovalid_p0; 

/* n17 */ 
input   [`DATAW:0]      n17_idata_p0;  
input                   n17_ivalid_p0; 
input   [`VCHW:0]       n17_ivch_p0;   
output  [`VCH:0]        n17_ordy_p0;   
output  [`DATAW:0]      n17_odata_p0;  
output                  n17_ovalid_p0; 

/* n18 */ 
input   [`DATAW:0]      n18_idata_p0;  
input                   n18_ivalid_p0; 
input   [`VCHW:0]       n18_ivch_p0;   
output  [`VCH:0]        n18_ordy_p0;   
output  [`DATAW:0]      n18_odata_p0;  
output                  n18_ovalid_p0; 

/* n19 */ 
input   [`DATAW:0]      n19_idata_p0;  
input                   n19_ivalid_p0; 
input   [`VCHW:0]       n19_ivch_p0;   
output  [`VCH:0]        n19_ordy_p0;   
output  [`DATAW:0]      n19_odata_p0;  
output                  n19_ovalid_p0; 

input clk, rst_; 

// row0
/* n0 --> n4 */ 
wire    [`DATAW:0]      n0_odata_1;  
wire                    n0_ovalid_1; 
wire    [`VCH:0]        n4_oack_3;   
wire    [`VCH:0]        n4_olck_3;   
wire    [`VCHW:0]       n4_ovch_3;   
/* n0 --> n1 */ 
wire    [`DATAW:0]      n0_odata_2;  
wire                    n0_ovalid_2; 
wire    [`VCH:0]        n1_oack_0;   
wire    [`VCH:0]        n1_olck_0;   
wire    [`VCHW:0]       n1_ovch_0;   
/* n4 --> n0 */ 
wire    [`DATAW:0]      n4_odata_3;  
wire                    n4_ovalid_3; 
wire    [`VCH:0]        n0_oack_1;   
wire    [`VCH:0]        n0_olck_1;   
wire    [`VCHW:0]       n0_ovch_1;   
/* n4 --> n8 */ 
wire    [`DATAW:0]      n4_odata_1;  
wire                    n4_ovalid_1; 
wire    [`VCH:0]        n8_oack_3;   
wire    [`VCH:0]        n8_olck_3;   
wire    [`VCHW:0]       n8_ovch_3;   
/* n4 --> n5 */ 
wire    [`DATAW:0]      n4_odata_2;  
wire                    n4_ovalid_2; 
wire    [`VCH:0]        n5_oack_0;   
wire    [`VCH:0]        n5_olck_0;   
wire    [`VCHW:0]       n5_ovch_0;   
/* n8 --> n4 */ 
wire    [`DATAW:0]      n8_odata_3;  
wire                    n8_ovalid_3; 
wire    [`VCH:0]        n4_oack_1;   
wire    [`VCH:0]        n4_olck_1;   
wire    [`VCHW:0]       n4_ovch_1;   
/* n8 --> n12 */ 
wire    [`DATAW:0]      n8_odata_1;  
wire                    n8_ovalid_1; 
wire    [`VCH:0]        n12_oack_3;   
wire    [`VCH:0]        n12_olck_3;   
wire    [`VCHW:0]       n12_ovch_3;   
/* n8 --> n9 */ 
wire    [`DATAW:0]      n8_odata_2;  
wire                    n8_ovalid_2; 
wire    [`VCH:0]        n9_oack_0;   
wire    [`VCH:0]        n9_olck_0;   
wire    [`VCHW:0]       n9_ovch_0;   
/* n12 --> n8 */ 
wire    [`DATAW:0]      n12_odata_3;  
wire                    n12_ovalid_3; 
wire    [`VCH:0]        n8_oack_1;   
wire    [`VCH:0]        n8_olck_1;   
wire    [`VCHW:0]       n8_ovch_1;   
/* n12 --> n16 */ 
wire    [`DATAW:0]      n12_odata_1;  
wire                    n12_ovalid_1; 
wire    [`VCH:0]        n16_oack_3;   
wire    [`VCH:0]        n16_olck_3;   
wire    [`VCHW:0]       n16_ovch_3;   
/* n12 --> n13 */ 
wire    [`DATAW:0]      n12_odata_2;  
wire                    n12_ovalid_2; 
wire    [`VCH:0]        n13_oack_0;   
wire    [`VCH:0]        n13_olck_0;   
wire    [`VCHW:0]       n13_ovch_0; 
/* n16 --> n12 */ 
wire    [`DATAW:0]      n16_odata_3;  
wire                    n16_ovalid_3; 
wire    [`VCH:0]        n12_oack_1;   
wire    [`VCH:0]        n12_olck_1;   
wire    [`VCHW:0]       n12_ovch_1;   
/* n16 --> n17 */ 
wire    [`DATAW:0]      n16_odata_2;  
wire                    n16_ovalid_2; 
wire    [`VCH:0]        n17_oack_0;   
wire    [`VCH:0]        n17_olck_0;   
wire    [`VCHW:0]       n17_ovch_0;   

// row1
/* n1 --> n0 */ 
wire    [`DATAW:0]      n1_odata_0;  
wire                    n1_ovalid_0; 
wire    [`VCH:0]        n0_oack_2;   
wire    [`VCH:0]        n0_olck_2;   
wire    [`VCHW:0]       n0_ovch_2;   
/* n1 --> n5 */ 
wire    [`DATAW:0]      n1_odata_1;  
wire                    n1_ovalid_1; 
wire    [`VCH:0]        n5_oack_3;   
wire    [`VCH:0]        n5_olck_3;   
wire    [`VCHW:0]       n5_ovch_3;   
/* n1 --> n2 */ 
wire    [`DATAW:0]      n1_odata_2;  
wire                    n1_ovalid_2; 
wire    [`VCH:0]        n2_oack_0;   
wire    [`VCH:0]        n2_olck_0;   
wire    [`VCHW:0]       n2_ovch_0;   
/* n5 --> n4 */ 
wire    [`DATAW:0]      n5_odata_0;  
wire                    n5_ovalid_0; 
wire    [`VCH:0]        n4_oack_2;   
wire    [`VCH:0]        n4_olck_2;   
wire    [`VCHW:0]       n4_ovch_2;   
/* n5 --> n1 */ 
wire    [`DATAW:0]      n5_odata_3;  
wire                    n5_ovalid_3; 
wire    [`VCH:0]        n1_oack_1;   
wire    [`VCH:0]        n1_olck_1;   
wire    [`VCHW:0]       n1_ovch_1;   
/* n5 --> n9 */ 
wire    [`DATAW:0]      n5_odata_1;  
wire                    n5_ovalid_1; 
wire    [`VCH:0]        n9_oack_3;   
wire    [`VCH:0]        n9_olck_3;   
wire    [`VCHW:0]       n9_ovch_3;   
/* n5 --> n6 */ 
wire    [`DATAW:0]      n5_odata_2;  
wire                    n5_ovalid_2; 
wire    [`VCH:0]        n6_oack_0;   
wire    [`VCH:0]        n6_olck_0;   
wire    [`VCHW:0]       n6_ovch_0;   
/* n9 --> n8 */ 
wire    [`DATAW:0]      n9_odata_0;  
wire                    n9_ovalid_0; 
wire    [`VCH:0]        n8_oack_2;   
wire    [`VCH:0]        n8_olck_2;   
wire    [`VCHW:0]       n8_ovch_2;   
/* n9 --> n5 */ 
wire    [`DATAW:0]      n9_odata_3;  
wire                    n9_ovalid_3; 
wire    [`VCH:0]        n5_oack_1;   
wire    [`VCH:0]        n5_olck_1;   
wire    [`VCHW:0]       n5_ovch_1;   
/* n9 --> n13 */ 
wire    [`DATAW:0]      n9_odata_1;  
wire                    n9_ovalid_1; 
wire    [`VCH:0]        n13_oack_3;   
wire    [`VCH:0]        n13_olck_3;   
wire    [`VCHW:0]       n13_ovch_3;   
/* n9 --> n10 */ 
wire    [`DATAW:0]      n9_odata_2;  
wire                    n9_ovalid_2; 
wire    [`VCH:0]        n10_oack_0;   
wire    [`VCH:0]        n10_olck_0;   
wire    [`VCHW:0]       n10_ovch_0;   
/* n13 --> n12 */ 
wire    [`DATAW:0]      n13_odata_0;  
wire                    n13_ovalid_0; 
wire    [`VCH:0]        n12_oack_2;   
wire    [`VCH:0]        n12_olck_2;   
wire    [`VCHW:0]       n12_ovch_2;   
/* n13 --> n9 */ 
wire    [`DATAW:0]      n13_odata_3;  
wire                    n13_ovalid_3; 
wire    [`VCH:0]        n9_oack_1;   
wire    [`VCH:0]        n9_olck_1;   
wire    [`VCHW:0]       n9_ovch_1; 
/* n13 --> n17 */ 
wire    [`DATAW:0]      n13_odata_1;  
wire                    n13_ovalid_1; 
wire    [`VCH:0]        n17_oack_3;   
wire    [`VCH:0]        n17_olck_3;   
wire    [`VCHW:0]       n17_ovch_3;   
/* n13 --> n14 */ 
wire    [`DATAW:0]      n13_odata_2;  
wire                    n13_ovalid_2; 
wire    [`VCH:0]        n14_oack_0;   
wire    [`VCH:0]        n14_olck_0;   
wire    [`VCHW:0]       n14_ovch_0;   
/* n17 --> n16 */ 
wire    [`DATAW:0]      n17_odata_0;  
wire                    n17_ovalid_0; 
wire    [`VCH:0]        n16_oack_2;   
wire    [`VCH:0]        n16_olck_2;   
wire    [`VCHW:0]       n16_ovch_2;   
/* n17 --> n13 */ 
wire    [`DATAW:0]      n17_odata_3;  
wire                    n17_ovalid_3; 
wire    [`VCH:0]        n13_oack_1;   
wire    [`VCH:0]        n13_olck_1;   
wire    [`VCHW:0]       n13_ovch_1;   
/* n17 --> n18 */ 
wire    [`DATAW:0]      n17_odata_2;  
wire                    n17_ovalid_2; 
wire    [`VCH:0]        n18_oack_0;   
wire    [`VCH:0]        n18_olck_0;   
wire    [`VCHW:0]       n18_ovch_0; 

//row2
/* n2 --> n1 */ 
wire    [`DATAW:0]      n2_odata_0;  
wire                    n2_ovalid_0; 
wire    [`VCH:0]        n1_oack_2;   
wire    [`VCH:0]        n1_olck_2;   
wire    [`VCHW:0]       n1_ovch_2;   
/* n2 --> n6 */ 
wire    [`DATAW:0]      n2_odata_1;  
wire                    n2_ovalid_1; 
wire    [`VCH:0]        n6_oack_3;   
wire    [`VCH:0]        n6_olck_3;   
wire    [`VCHW:0]       n6_ovch_3;   
/* n2 --> n3 */ 
wire    [`DATAW:0]      n2_odata_2;  
wire                    n2_ovalid_2; 
wire    [`VCH:0]        n3_oack_0;   
wire    [`VCH:0]        n3_olck_0;   
wire    [`VCHW:0]       n3_ovch_0;   
/* n6 --> n5 */ 
wire    [`DATAW:0]      n6_odata_0;  
wire                    n6_ovalid_0; 
wire    [`VCH:0]        n5_oack_2;   
wire    [`VCH:0]        n5_olck_2;   
wire    [`VCHW:0]       n5_ovch_2;   
/* n6 --> n2 */ 
wire    [`DATAW:0]      n6_odata_3;  
wire                    n6_ovalid_3; 
wire    [`VCH:0]        n2_oack_1;   
wire    [`VCH:0]        n2_olck_1;   
wire    [`VCHW:0]       n2_ovch_1;   
/* n6 --> n10 */ 
wire    [`DATAW:0]      n6_odata_1;  
wire                    n6_ovalid_1; 
wire    [`VCH:0]        n10_oack_3;   
wire    [`VCH:0]        n10_olck_3;   
wire    [`VCHW:0]       n10_ovch_3;   
/* n6 --> n7 */ 
wire    [`DATAW:0]      n6_odata_2;  
wire                    n6_ovalid_2; 
wire    [`VCH:0]        n7_oack_0;   
wire    [`VCH:0]        n7_olck_0;   
wire    [`VCHW:0]       n7_ovch_0;   
/* n10 --> n9 */ 
wire    [`DATAW:0]      n10_odata_0;  
wire                    n10_ovalid_0; 
wire    [`VCH:0]        n9_oack_2;   
wire    [`VCH:0]        n9_olck_2;   
wire    [`VCHW:0]       n9_ovch_2;   
/* n10 --> n6 */ 
wire    [`DATAW:0]      n10_odata_3;  
wire                    n10_ovalid_3; 
wire    [`VCH:0]        n6_oack_1;   
wire    [`VCH:0]        n6_olck_1;   
wire    [`VCHW:0]       n6_ovch_1;   
/* n10 --> n14 */ 
wire    [`DATAW:0]      n10_odata_1;  
wire                    n10_ovalid_1; 
wire    [`VCH:0]        n14_oack_3;   
wire    [`VCH:0]        n14_olck_3;   
wire    [`VCHW:0]       n14_ovch_3;   
/* n10 --> n11 */ 
wire    [`DATAW:0]      n10_odata_2;  
wire                    n10_ovalid_2; 
wire    [`VCH:0]        n11_oack_0;   
wire    [`VCH:0]        n11_olck_0;   
wire    [`VCHW:0]       n11_ovch_0;   
/* n14 --> n13 */ 
wire    [`DATAW:0]      n14_odata_0;  
wire                    n14_ovalid_0; 
wire    [`VCH:0]        n13_oack_2;   
wire    [`VCH:0]        n13_olck_2;   
wire    [`VCHW:0]       n13_ovch_2;   
/* n14 --> n10 */ 
wire    [`DATAW:0]      n14_odata_3;  
wire                    n14_ovalid_3; 
wire    [`VCH:0]        n10_oack_1;   
wire    [`VCH:0]        n10_olck_1;   
wire    [`VCHW:0]       n10_ovch_1; 
/* n14 --> n18 */ 
wire    [`DATAW:0]      n14_odata_1;  
wire                    n14_ovalid_1; 
wire    [`VCH:0]        n18_oack_3;   
wire    [`VCH:0]        n18_olck_3;   
wire    [`VCHW:0]       n18_ovch_3;   
/* n14 --> n15 */ 
wire    [`DATAW:0]      n14_odata_2;  
wire                    n14_ovalid_2; 
wire    [`VCH:0]        n15_oack_0;   
wire    [`VCH:0]        n15_olck_0;   
wire    [`VCHW:0]       n15_ovch_0;   
/* n18 --> n17 */ 
wire    [`DATAW:0]      n18_odata_0;  
wire                    n18_ovalid_0; 
wire    [`VCH:0]        n17_oack_2;   
wire    [`VCH:0]        n17_olck_2;   
wire    [`VCHW:0]       n17_ovch_2;   
/* n18 --> n14 */ 
wire    [`DATAW:0]      n18_odata_3;  
wire                    n18_ovalid_3; 
wire    [`VCH:0]        n14_oack_1;   
wire    [`VCH:0]        n14_olck_1;   
wire    [`VCHW:0]       n14_ovch_1;   
/* n18 --> n19 */ 
wire    [`DATAW:0]      n18_odata_2;  
wire                    n18_ovalid_2; 
wire    [`VCH:0]        n19_oack_0;   
wire    [`VCH:0]        n19_olck_0;   
wire    [`VCHW:0]       n19_ovch_0; 
 
// row 3
/* n3 --> n2 */ 
wire    [`DATAW:0]      n3_odata_0;  
wire                    n3_ovalid_0; 
wire    [`VCH:0]        n2_oack_2;   
wire    [`VCH:0]        n2_olck_2;   
wire    [`VCHW:0]       n2_ovch_2;   
/* n3 --> n7 */ 
wire    [`DATAW:0]      n3_odata_1;  
wire                    n3_ovalid_1; 
wire    [`VCH:0]        n7_oack_3;   
wire    [`VCH:0]        n7_olck_3;   
wire    [`VCHW:0]       n7_ovch_3;   
/* n7 --> n6 */ 
wire    [`DATAW:0]      n7_odata_0;  
wire                    n7_ovalid_0; 
wire    [`VCH:0]        n6_oack_2;   
wire    [`VCH:0]        n6_olck_2;   
wire    [`VCHW:0]       n6_ovch_2;   
/* n7 --> n3 */ 
wire    [`DATAW:0]      n7_odata_3;  
wire                    n7_ovalid_3; 
wire    [`VCH:0]        n3_oack_1;   
wire    [`VCH:0]        n3_olck_1;   
wire    [`VCHW:0]       n3_ovch_1;   
/* n7 --> n11 */ 
wire    [`DATAW:0]      n7_odata_1;  
wire                    n7_ovalid_1; 
wire    [`VCH:0]        n11_oack_3;   
wire    [`VCH:0]        n11_olck_3;   
wire    [`VCHW:0]       n11_ovch_3;   
/* n11 --> n10 */ 
wire    [`DATAW:0]      n11_odata_0;  
wire                    n11_ovalid_0; 
wire    [`VCH:0]        n10_oack_2;   
wire    [`VCH:0]        n10_olck_2;   
wire    [`VCHW:0]       n10_ovch_2;   
/* n11 --> n7 */ 
wire    [`DATAW:0]      n11_odata_3;  
wire                    n11_ovalid_3; 
wire    [`VCH:0]        n7_oack_1;   
wire    [`VCH:0]        n7_olck_1;   
wire    [`VCHW:0]       n7_ovch_1;   
/* n11 --> n15 */ 
wire    [`DATAW:0]      n11_odata_1;  
wire                    n11_ovalid_1; 
wire    [`VCH:0]        n15_oack_3;   
wire    [`VCH:0]        n15_olck_3;   
wire    [`VCHW:0]       n15_ovch_3;   
/* n15 --> n14 */ 
wire    [`DATAW:0]      n15_odata_0;  
wire                    n15_ovalid_0; 
wire    [`VCH:0]        n14_oack_2;   
wire    [`VCH:0]        n14_olck_2;   
wire    [`VCHW:0]       n14_ovch_2;   
/* n15 --> n11 */ 
wire    [`DATAW:0]      n15_odata_3;  
wire                    n15_ovalid_3; 
wire    [`VCH:0]        n11_oack_1;   
wire    [`VCH:0]        n11_olck_1;   
wire    [`VCHW:0]       n11_ovch_1;   
/* n15 --> n19 */ 
wire    [`DATAW:0]      n15_odata_1;  
wire                    n15_ovalid_1; 
wire    [`VCH:0]        n19_oack_3;   
wire    [`VCH:0]        n19_olck_3;   
wire    [`VCHW:0]       n19_ovch_3;  
/* n19 --> n18 */ 
wire    [`DATAW:0]      n19_odata_0;  
wire                    n19_ovalid_0; 
wire    [`VCH:0]        n18_oack_2;   
wire    [`VCH:0]        n18_olck_2;   
wire    [`VCHW:0]       n18_ovch_2;   
/* n19 --> n15 */ 
wire    [`DATAW:0]      n19_odata_3;  
wire                    n19_ovalid_3; 
wire    [`VCH:0]        n15_oack_1;   
wire    [`VCH:0]        n15_olck_1;   
wire    [`VCHW:0]       n15_ovch_1;   

//test
wire    [10:0]   on0;
wire    [10:0]   on4;
wire    [10:0]   on8;
wire    [10:0]   on12;
wire    [10:0]   on16;

assign on0 = n0_idata_p0[22:12];
assign on4 = n4_odata_p0[22:12];
assign on8 = n8_odata_p0[22:12];
assign on12 = n12_odata_p0[22:12];
assign on16 = n16_odata_p0[22:12];

//router call

router #( 0, 0, 0 ) n0 (                // Router ID, XPOS, YPOS
        .idata_4 ( n0_idata_p0  ), 
        .ivalid_4( n0_ivalid_p0 ), 
        .ivch_4  ( n0_ivch_p0   ), 
        .ordy_4  ( n0_ordy_p0   ), 
        .odata_4 ( n0_odata_p0  ), 
        .ovalid_4( n0_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( `DATAW_P1'b0 ),  
        .ivalid_0( 1'b0         ),  
        .ivch_0  ( `VCHW_P1'b0  ),  
        .iack_0  ( `VCH_P1'b0   ),  
        .ilck_0  ( `VCH_P1'b0   ),  

        .idata_1 ( n4_odata_3   ), 
        .ivalid_1( n4_ovalid_3  ), 
        .ivch_1  ( n4_ovch_3    ), 
        .oack_1  ( n0_oack_1    ), 
        .olck_1  ( n0_olck_1    ), 
        .odata_1 ( n0_odata_1   ), 
        .ovalid_1( n0_ovalid_1  ), 
        .ovch_1  ( n0_ovch_1    ), 
        .iack_1  ( n4_oack_3    ), 
        .ilck_1  ( n4_olck_3    ), 

        .idata_2 ( n1_odata_0   ), 
        .ivalid_2( n1_ovalid_0  ), 
        .ivch_2  ( n1_ovch_0    ), 
        .oack_2  ( n0_oack_2    ), 
        .olck_2  ( n0_olck_2    ), 
        .odata_2 ( n0_odata_2   ), 
        .ovalid_2( n0_ovalid_2  ), 
        .ovch_2  ( n0_ovch_2    ), 
        .iack_2  ( n1_oack_0    ), 
        .ilck_2  ( n1_olck_0    ), 

        .idata_3 ( `DATAW_P1'b0 ),  
        .ivalid_3( 1'b0         ),  
        .ivch_3  ( `VCHW_P1'b0  ),  
        .iack_3  ( `VCH_P1'b0   ),  
        .ilck_3  ( `VCH_P1'b0   ),  

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 4, 1, 0 ) n4 ( 
        .idata_4 ( n4_idata_p0  ), 
        .ivalid_4( n4_ivalid_p0 ), 
        .ivch_4  ( n4_ivch_p0   ), 
        .ordy_4  ( n4_ordy_p0   ), 
        .odata_4 ( n4_odata_p0  ), 
        .ovalid_4( n4_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( `DATAW_P1'b0 ),  
        .ivalid_0( 1'b0         ),  
        .ivch_0  ( `VCHW_P1'b0  ),  
        .iack_0  ( `VCH_P1'b0   ),  
        .ilck_0  ( `VCH_P1'b0   ),  

        .idata_1 ( n8_odata_3   ), 
        .ivalid_1( n8_ovalid_3  ), 
        .ivch_1  ( n8_ovch_3    ), 
        .oack_1  ( n4_oack_1    ), 
        .olck_1  ( n4_olck_1    ), 
        .odata_1 ( n4_odata_1   ), 
        .ovalid_1( n4_ovalid_1  ), 
        .ovch_1  ( n4_ovch_1    ), 
        .iack_1  ( n8_oack_3    ),
        .ilck_1  ( n8_olck_3    ), 

        .idata_2 ( n5_odata_0   ), 
        .ivalid_2( n5_ovalid_0  ), 
        .ivch_2  ( n5_ovch_0    ), 
        .oack_2  ( n4_oack_2    ), 
        .olck_2  ( n4_olck_2    ), 
        .odata_2 ( n4_odata_2   ), 
        .ovalid_2( n4_ovalid_2  ), 
        .ovch_2  ( n4_ovch_2    ), 
        .iack_2  ( n5_oack_0    ), 
        .ilck_2  ( n5_olck_0    ), 

        .idata_3 ( n0_odata_1   ), 
        .ivalid_3( n0_ovalid_1  ), 
        .ivch_3  ( n0_ovch_1    ), 
        .oack_3  ( n4_oack_3    ), 
        .olck_3  ( n4_olck_3    ), 
        .odata_3 ( n4_odata_3   ), 
        .ovalid_3( n4_ovalid_3  ), 
        .ovch_3  ( n4_ovch_3    ), 
        .iack_3  ( n0_oack_1    ), 
        .ilck_3  ( n0_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 8, 2, 0 ) n8 ( 
        .idata_4 ( n8_idata_p0  ), 
        .ivalid_4( n8_ivalid_p0 ), 
        .ivch_4  ( n8_ivch_p0   ), 
        .ordy_4  ( n8_ordy_p0   ), 
        .odata_4 ( n8_odata_p0  ), 
        .ovalid_4( n8_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( `DATAW_P1'b0 ),  
        .ivalid_0( 1'b0         ),  
        .ivch_0  ( `VCHW_P1'b0  ),  
        .iack_0  ( `VCH_P1'b0   ),  
        .ilck_0  ( `VCH_P1'b0   ),  

        .idata_1 ( n12_odata_3   ), 
        .ivalid_1( n12_ovalid_3  ), 
        .ivch_1  ( n12_ovch_3    ), 
        .oack_1  ( n8_oack_1    ), 
        .olck_1  ( n8_olck_1    ), 
        .odata_1 ( n8_odata_1   ), 
        .ovalid_1( n8_ovalid_1  ), 
        .ovch_1  ( n8_ovch_1    ), 
        .iack_1  ( n12_oack_3    ), 
        .ilck_1  ( n12_olck_3    ), 

        .idata_2 ( n9_odata_0   ), 
        .ivalid_2( n9_ovalid_0  ), 
        .ivch_2  ( n9_ovch_0    ), 
        .oack_2  ( n8_oack_2    ), 
        .olck_2  ( n8_olck_2    ), 
        .odata_2 ( n8_odata_2   ), 
        .ovalid_2( n8_ovalid_2  ), 
        .ovch_2  ( n8_ovch_2    ), 
        .iack_2  ( n9_oack_0    ), 
        .ilck_2  ( n9_olck_0    ), 

        .idata_3 ( n4_odata_1   ), 
        .ivalid_3( n4_ovalid_1  ), 
        .ivch_3  ( n4_ovch_1    ), 
        .oack_3  ( n8_oack_3    ), 
        .olck_3  ( n8_olck_3    ), 
        .odata_3 ( n8_odata_3   ), 
        .ovalid_3( n8_ovalid_3  ), 
        .ovch_3  ( n8_ovch_3    ), 
        .iack_3  ( n4_oack_1    ), 
        .ilck_3  ( n4_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 12, 3, 0 ) n12 ( 
        .idata_4 ( n12_idata_p0  ), 
        .ivalid_4( n12_ivalid_p0 ), 
        .ivch_4  ( n12_ivch_p0   ), 
        .ordy_4  ( n12_ordy_p0   ), 
        .odata_4 ( n12_odata_p0  ), 
        .ovalid_4( n12_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( `DATAW_P1'b0 ),  
        .ivalid_0( 1'b0         ),  
        .ivch_0  ( `VCHW_P1'b0  ),  
        .iack_0  ( `VCH_P1'b0   ),  
        .ilck_0  ( `VCH_P1'b0   ),  

        .idata_1 ( n16_odata_3   ), 
        .ivalid_1( n16_ovalid_3  ), 
        .ivch_1  ( n16_ovch_3    ), 
        .oack_1  ( n12_oack_1    ), 
        .olck_1  ( n12_olck_1    ), 
        .odata_1 ( n12_odata_1   ), 
        .ovalid_1( n12_ovalid_1  ), 
        .ovch_1  ( n12_ovch_1    ), 
        .iack_1  ( n16_oack_3    ), 
        .ilck_1  ( n16_olck_3    ), 

        .idata_2 ( n13_odata_0   ), 
        .ivalid_2( n13_ovalid_0  ), 
        .ivch_2  ( n13_ovch_0    ), 
        .oack_2  ( n12_oack_2    ), 
        .olck_2  ( n12_olck_2    ), 
        .odata_2 ( n12_odata_2   ), 
        .ovalid_2( n12_ovalid_2  ), 
        .ovch_2  ( n12_ovch_2    ), 
        .iack_2  ( n13_oack_0    ), 
        .ilck_2  ( n13_olck_0    ), 

        .idata_3 ( n8_odata_1   ), 
        .ivalid_3( n8_ovalid_1  ), 
        .ivch_3  ( n8_ovch_1    ), 
        .oack_3  ( n12_oack_3    ), 
        .olck_3  ( n12_olck_3    ), 
        .odata_3 ( n12_odata_3   ), 
        .ovalid_3( n12_ovalid_3  ), 
        .ovch_3  ( n12_ovch_3    ), 
        .iack_3  ( n8_oack_1    ), 
        .ilck_3  ( n8_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 16, 4, 0 ) n16 ( 
        .idata_4 ( n16_idata_p0  ), 
        .ivalid_4( n16_ivalid_p0 ), 
        .ivch_4  ( n16_ivch_p0   ), 
        .ordy_4  ( n16_ordy_p0   ), 
        .odata_4 ( n16_odata_p0  ), 
        .ovalid_4( n16_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( `DATAW_P1'b0 ),  
        .ivalid_0( 1'b0         ),  
        .ivch_0  ( `VCHW_P1'b0  ),  
        .iack_0  ( `VCH_P1'b0   ),  
        .ilck_0  ( `VCH_P1'b0   ),  

        .idata_1 ( `DATAW_P1'b0 ),  
        .ivalid_1( 1'b0         ),  
        .ivch_1  ( `VCHW_P1'b0  ),  
        .iack_1  ( `VCH_P1'b0   ),  
        .ilck_1  ( `VCH_P1'b0   ),  

        .idata_2 ( n17_odata_0   ), 
        .ivalid_2( n17_ovalid_0  ), 
        .ivch_2  ( n17_ovch_0    ), 
        .oack_2  ( n16_oack_2    ), 
        .olck_2  ( n16_olck_2    ), 
        .odata_2 ( n16_odata_2   ), 
        .ovalid_2( n16_ovalid_2  ), 
        .ovch_2  ( n16_ovch_2    ), 
        .iack_2  ( n17_oack_0    ), 
        .ilck_2  ( n17_olck_0    ), 

        .idata_3 ( n12_odata_1   ), 
        .ivalid_3( n12_ovalid_1  ), 
        .ivch_3  ( n12_ovch_1    ), 
        .oack_3  ( n16_oack_3    ), 
        .olck_3  ( n16_olck_3    ), 
        .odata_3 ( n16_odata_3   ), 
        .ovalid_3( n16_ovalid_3  ), 
        .ovch_3  ( n16_ovch_3    ), 
        .iack_3  ( n12_oack_1    ), 
        .ilck_3  ( n12_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
);

router #( 1, 0, 1 ) n1 ( 
        .idata_4 ( n1_idata_p0  ), 
        .ivalid_4( n1_ivalid_p0 ), 
        .ivch_4  ( n1_ivch_p0   ), 
        .ordy_4  ( n1_ordy_p0   ), 
        .odata_4 ( n1_odata_p0  ), 
        .ovalid_4( n1_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n0_odata_2   ), 
        .ivalid_0( n0_ovalid_2  ), 
        .ivch_0  ( n0_ovch_2    ), 
        .oack_0  ( n1_oack_0    ), 
        .olck_0  ( n1_olck_0    ), 
        .odata_0 ( n1_odata_0   ), 
        .ovalid_0( n1_ovalid_0  ), 
        .ovch_0  ( n1_ovch_0    ), 
        .iack_0  ( n0_oack_2    ), 
        .ilck_0  ( n0_olck_2    ), 

        .idata_1 ( n5_odata_3   ), 
        .ivalid_1( n5_ovalid_3  ), 
        .ivch_1  ( n5_ovch_3    ), 
        .oack_1  ( n1_oack_1    ), 
        .olck_1  ( n1_olck_1    ), 
        .odata_1 ( n1_odata_1   ), 
        .ovalid_1( n1_ovalid_1  ), 
        .ovch_1  ( n1_ovch_1    ), 
        .iack_1  ( n5_oack_3    ), 
        .ilck_1  ( n5_olck_3    ), 

        .idata_2 ( n2_odata_0   ), 
        .ivalid_2( n2_ovalid_0  ), 
        .ivch_2  ( n2_ovch_0    ), 
        .oack_2  ( n1_oack_2    ), 
        .olck_2  ( n1_olck_2    ), 
        .odata_2 ( n1_odata_2   ), 
        .ovalid_2( n1_ovalid_2  ), 
        .ovch_2  ( n1_ovch_2    ), 
        .iack_2  ( n2_oack_0    ), 
        .ilck_2  ( n2_olck_0    ), 

        .idata_3 ( `DATAW_P1'b0 ),  
        .ivalid_3( 1'b0         ),  
        .ivch_3  ( `VCHW_P1'b0  ),  
        .iack_3  ( `VCH_P1'b0   ),  
        .ilck_3  ( `VCH_P1'b0   ),  

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 5, 1, 1 ) n5 ( 
        .idata_4 ( n5_idata_p0  ), 
        .ivalid_4( n5_ivalid_p0 ), 
        .ivch_4  ( n5_ivch_p0   ), 
        .ordy_4  ( n5_ordy_p0   ), 
        .odata_4 ( n5_odata_p0  ), 
        .ovalid_4( n5_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n4_odata_2   ), 
        .ivalid_0( n4_ovalid_2  ), 
        .ivch_0  ( n4_ovch_2    ), 
        .oack_0  ( n5_oack_0    ), 
        .olck_0  ( n5_olck_0    ), 
        .odata_0 ( n5_odata_0   ), 
        .ovalid_0( n5_ovalid_0  ), 
        .ovch_0  ( n5_ovch_0    ), 
        .iack_0  ( n4_oack_2    ), 
        .ilck_0  ( n4_olck_2    ), 

        .idata_1 ( n9_odata_3   ), 
        .ivalid_1( n9_ovalid_3  ), 
        .ivch_1  ( n9_ovch_3    ), 
        .oack_1  ( n5_oack_1    ), 
        .olck_1  ( n5_olck_1    ), 
        .odata_1 ( n5_odata_1   ), 
        .ovalid_1( n5_ovalid_1  ), 
        .ovch_1  ( n5_ovch_1    ), 
        .iack_1  ( n9_oack_3    ), 
        .ilck_1  ( n9_olck_3    ), 

        .idata_2 ( n6_odata_0   ), 
        .ivalid_2( n6_ovalid_0  ), 
        .ivch_2  ( n6_ovch_0    ), 
        .oack_2  ( n5_oack_2    ), 
        .olck_2  ( n5_olck_2    ), 
        .odata_2 ( n5_odata_2   ), 
        .ovalid_2( n5_ovalid_2  ), 
        .ovch_2  ( n5_ovch_2    ), 
        .iack_2  ( n6_oack_0    ), 
        .ilck_2  ( n6_olck_0    ), 

        .idata_3 ( n1_odata_1   ), 
        .ivalid_3( n1_ovalid_1  ), 
        .ivch_3  ( n1_ovch_1    ), 
        .oack_3  ( n5_oack_3    ), 
        .olck_3  ( n5_olck_3    ), 
        .odata_3 ( n5_odata_3   ), 
        .ovalid_3( n5_ovalid_3  ), 
        .ovch_3  ( n5_ovch_3    ), 
        .iack_3  ( n1_oack_1    ), 
        .ilck_3  ( n1_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 9, 2, 1 ) n9 ( 
        .idata_4 ( n9_idata_p0  ), 
        .ivalid_4( n9_ivalid_p0 ), 
        .ivch_4  ( n9_ivch_p0   ), 
        .ordy_4  ( n9_ordy_p0   ), 
        .odata_4 ( n9_odata_p0  ), 
        .ovalid_4( n9_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n8_odata_2   ), 
        .ivalid_0( n8_ovalid_2  ), 
        .ivch_0  ( n8_ovch_2    ), 
        .oack_0  ( n9_oack_0    ), 
        .olck_0  ( n9_olck_0    ), 
        .odata_0 ( n9_odata_0   ), 
        .ovalid_0( n9_ovalid_0  ), 
        .ovch_0  ( n9_ovch_0    ), 
        .iack_0  ( n8_oack_2    ), 
        .ilck_0  ( n8_olck_2    ), 

        .idata_1 ( n13_odata_3   ), 
        .ivalid_1( n13_ovalid_3  ), 
        .ivch_1  ( n13_ovch_3    ), 
        .oack_1  ( n9_oack_1    ), 
        .olck_1  ( n9_olck_1    ), 
        .odata_1 ( n9_odata_1   ), 
        .ovalid_1( n9_ovalid_1  ), 
        .ovch_1  ( n9_ovch_1    ), 
        .iack_1  ( n13_oack_3    ), 
        .ilck_1  ( n13_olck_3    ), 

        .idata_2 ( n10_odata_0   ), 
        .ivalid_2( n10_ovalid_0  ), 
        .ivch_2  ( n10_ovch_0    ), 
        .oack_2  ( n9_oack_2    ), 
        .olck_2  ( n9_olck_2    ), 
        .odata_2 ( n9_odata_2   ), 
        .ovalid_2( n9_ovalid_2  ), 
        .ovch_2  ( n9_ovch_2    ), 
        .iack_2  ( n10_oack_0    ), 
        .ilck_2  ( n10_olck_0    ), 

        .idata_3 ( n5_odata_1   ), 
        .ivalid_3( n5_ovalid_1  ), 
        .ivch_3  ( n5_ovch_1    ), 
        .oack_3  ( n9_oack_3    ), 
        .olck_3  ( n9_olck_3    ), 
        .odata_3 ( n9_odata_3   ), 
        .ovalid_3( n9_ovalid_3  ), 
        .ovch_3  ( n9_ovch_3    ), 
        .iack_3  ( n5_oack_1    ), 
        .ilck_3  ( n5_olck_1    ),  

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 13, 3, 1 ) n13 ( 
        .idata_4 ( n13_idata_p0  ), 
        .ivalid_4( n13_ivalid_p0 ), 
        .ivch_4  ( n13_ivch_p0   ), 
        .ordy_4  ( n13_ordy_p0   ), 
        .odata_4 ( n13_odata_p0  ), 
        .ovalid_4( n13_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n12_odata_2   ), 
        .ivalid_0( n12_ovalid_2  ), 
        .ivch_0  ( n12_ovch_2    ), 
        .oack_0  ( n13_oack_0    ), 
        .olck_0  ( n13_olck_0    ), 
        .odata_0 ( n13_odata_0   ), 
        .ovalid_0( n13_ovalid_0  ), 
        .ovch_0  ( n13_ovch_0    ), 
        .iack_0  ( n12_oack_2    ), 
        .ilck_0  ( n12_olck_2    ), 

        .idata_1 ( n17_odata_3   ), 
        .ivalid_1( n17_ovalid_3  ), 
        .ivch_1  ( n17_ovch_3    ), 
        .oack_1  ( n13_oack_1    ), 
        .olck_1  ( n13_olck_1    ), 
        .odata_1 ( n13_odata_1   ), 
        .ovalid_1( n13_ovalid_1  ), 
        .ovch_1  ( n13_ovch_1    ), 
        .iack_1  ( n17_oack_3    ), 
        .ilck_1  ( n17_olck_3    ), 

        .idata_2 ( n14_odata_0   ), 
        .ivalid_2( n14_ovalid_0  ), 
        .ivch_2  ( n14_ovch_0    ), 
        .oack_2  ( n13_oack_2    ), 
        .olck_2  ( n13_olck_2    ), 
        .odata_2 ( n13_odata_2   ), 
        .ovalid_2( n13_ovalid_2  ), 
        .ovch_2  ( n13_ovch_2    ), 
        .iack_2  ( n14_oack_0    ), 
        .ilck_2  ( n14_olck_0    ), 

        .idata_3 ( n9_odata_1   ), 
        .ivalid_3( n9_ovalid_1  ), 
        .ivch_3  ( n9_ovch_1    ), 
        .oack_3  ( n13_oack_3    ), 
        .olck_3  ( n13_olck_3    ), 
        .odata_3 ( n13_odata_3   ), 
        .ovalid_3( n13_ovalid_3  ), 
        .ovch_3  ( n13_ovch_3    ), 
        .iack_3  ( n9_oack_1    ), 
        .ilck_3  ( n9_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
);

router #( 17, 4, 1 ) n17 ( 
        .idata_4 ( n17_idata_p0  ), 
        .ivalid_4( n17_ivalid_p0 ), 
        .ivch_4  ( n17_ivch_p0   ), 
        .ordy_4  ( n17_ordy_p0   ), 
        .odata_4 ( n17_odata_p0  ), 
        .ovalid_4( n17_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n16_odata_2   ), 
        .ivalid_0( n16_ovalid_2  ), 
        .ivch_0  ( n16_ovch_2    ), 
        .oack_0  ( n17_oack_0    ), 
        .olck_0  ( n17_olck_0    ), 
        .odata_0 ( n17_odata_0   ), 
        .ovalid_0( n17_ovalid_0  ), 
        .ovch_0  ( n17_ovch_0    ), 
        .iack_0  ( n16_oack_2    ), 
        .ilck_0  ( n16_olck_2    ), 

        .idata_1 ( `DATAW_P1'b0 ),  
        .ivalid_1( 1'b0         ),  
        .ivch_1  ( `VCHW_P1'b0  ),  
        .iack_1  ( `VCH_P1'b0   ),  
        .ilck_1  ( `VCH_P1'b0   ),  

        .idata_2 ( n18_odata_0   ), 
        .ivalid_2( n18_ovalid_0  ), 
        .ivch_2  ( n18_ovch_0    ), 
        .oack_2  ( n17_oack_2    ), 
        .olck_2  ( n17_olck_2    ), 
        .odata_2 ( n17_odata_2   ), 
        .ovalid_2( n17_ovalid_2  ), 
        .ovch_2  ( n17_ovch_2    ), 
        .iack_2  ( n18_oack_0    ), 
        .ilck_2  ( n18_olck_0    ), 

        .idata_3 ( n13_odata_1   ), 
        .ivalid_3( n13_ovalid_1  ), 
        .ivch_3  ( n13_ovch_1    ), 
        .oack_3  ( n17_oack_3    ), 
        .olck_3  ( n17_olck_3    ), 
        .odata_3 ( n17_odata_3   ), 
        .ovalid_3( n17_ovalid_3  ), 
        .ovch_3  ( n17_ovch_3    ), 
        .iack_3  ( n13_oack_1    ), 
        .ilck_3  ( n13_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 2, 0, 2 ) n2 ( 
        .idata_4 ( n2_idata_p0  ), 
        .ivalid_4( n2_ivalid_p0 ), 
        .ivch_4  ( n2_ivch_p0   ), 
        .ordy_4  ( n2_ordy_p0   ), 
        .odata_4 ( n2_odata_p0  ), 
        .ovalid_4( n2_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n1_odata_2   ), 
        .ivalid_0( n1_ovalid_2  ), 
        .ivch_0  ( n1_ovch_2    ), 
        .oack_0  ( n2_oack_0    ), 
        .olck_0  ( n2_olck_0    ), 
        .odata_0 ( n2_odata_0   ), 
        .ovalid_0( n2_ovalid_0  ), 
        .ovch_0  ( n2_ovch_0    ), 
        .iack_0  ( n1_oack_2    ), 
        .ilck_0  ( n1_olck_2    ), 

        .idata_1 ( n6_odata_3   ), 
        .ivalid_1( n6_ovalid_3  ), 
        .ivch_1  ( n6_ovch_3    ), 
        .oack_1  ( n2_oack_1    ), 
        .olck_1  ( n2_olck_1    ), 
        .odata_1 ( n2_odata_1   ), 
        .ovalid_1( n2_ovalid_1  ), 
        .ovch_1  ( n2_ovch_1    ), 
        .iack_1  ( n6_oack_3    ), 
        .ilck_1  ( n6_olck_3    ), 

        .idata_2 ( n3_odata_0   ), 
        .ivalid_2( n3_ovalid_0  ), 
        .ivch_2  ( n3_ovch_0    ), 
        .oack_2  ( n2_oack_2    ), 
        .olck_2  ( n2_olck_2    ), 
        .odata_2 ( n2_odata_2   ), 
        .ovalid_2( n2_ovalid_2  ), 
        .ovch_2  ( n2_ovch_2    ), 
        .iack_2  ( n3_oack_0    ), 
        .ilck_2  ( n3_olck_0    ), 

        .idata_3 ( `DATAW_P1'b0 ),  
        .ivalid_3( 1'b0         ),  
        .ivch_3  ( `VCHW_P1'b0  ),  
        .iack_3  ( `VCH_P1'b0   ),  
        .ilck_3  ( `VCH_P1'b0   ),  

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 6, 1, 2 ) n6 ( 
        .idata_4 ( n6_idata_p0  ), 
        .ivalid_4( n6_ivalid_p0 ), 
        .ivch_4  ( n6_ivch_p0   ), 
        .ordy_4  ( n6_ordy_p0   ), 
        .odata_4 ( n6_odata_p0  ), 
        .ovalid_4( n6_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n5_odata_2   ), 
        .ivalid_0( n5_ovalid_2  ), 
        .ivch_0  ( n5_ovch_2    ), 
        .oack_0  ( n6_oack_0    ), 
        .olck_0  ( n6_olck_0    ), 
        .odata_0 ( n6_odata_0   ), 
        .ovalid_0( n6_ovalid_0  ), 
        .ovch_0  ( n6_ovch_0    ), 
        .iack_0  ( n5_oack_2    ), 
        .ilck_0  ( n5_olck_2    ), 

        .idata_1 ( n10_odata_3   ), 
        .ivalid_1( n10_ovalid_3  ), 
        .ivch_1  ( n10_ovch_3    ), 
        .oack_1  ( n6_oack_1    ), 
        .olck_1  ( n6_olck_1    ), 
        .odata_1 ( n6_odata_1   ), 
        .ovalid_1( n6_ovalid_1  ), 
        .ovch_1  ( n6_ovch_1    ), 
        .iack_1  ( n10_oack_3    ), 
        .ilck_1  ( n10_olck_3    ), 

        .idata_2 ( n7_odata_0   ), 
        .ivalid_2( n7_ovalid_0  ), 
        .ivch_2  ( n7_ovch_0    ), 
        .oack_2  ( n6_oack_2    ), 
        .olck_2  ( n6_olck_2    ), 
        .odata_2 ( n6_odata_2   ), 
        .ovalid_2( n6_ovalid_2  ), 
        .ovch_2  ( n6_ovch_2    ), 
        .iack_2  ( n7_oack_0    ), 
        .ilck_2  ( n7_olck_0    ), 

        .idata_3 ( n2_odata_1   ), 
        .ivalid_3( n2_ovalid_1  ), 
        .ivch_3  ( n2_ovch_1    ), 
        .oack_3  ( n6_oack_3    ), 
        .olck_3  ( n6_olck_3    ), 
        .odata_3 ( n6_odata_3   ), 
        .ovalid_3( n6_ovalid_3  ), 
        .ovch_3  ( n6_ovch_3    ), 
        .iack_3  ( n2_oack_1    ), 
        .ilck_3  ( n2_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 10, 2, 2 ) n10 ( 
        .idata_4 ( n10_idata_p0  ), 
        .ivalid_4( n10_ivalid_p0 ), 
        .ivch_4  ( n10_ivch_p0   ), 
        .ordy_4  ( n10_ordy_p0   ), 
        .odata_4 ( n10_odata_p0  ), 
        .ovalid_4( n10_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n9_odata_2   ), 
        .ivalid_0( n9_ovalid_2  ), 
        .ivch_0  ( n9_ovch_2    ), 
        .oack_0  ( n10_oack_0    ), 
        .olck_0  ( n10_olck_0    ), 
        .odata_0 ( n10_odata_0   ), 
        .ovalid_0( n10_ovalid_0  ), 
        .ovch_0  ( n10_ovch_0    ), 
        .iack_0  ( n9_oack_2    ), 
        .ilck_0  ( n9_olck_2    ), 

        .idata_1 ( n14_odata_3   ), 
        .ivalid_1( n14_ovalid_3  ), 
        .ivch_1  ( n14_ovch_3    ), 
        .oack_1  ( n10_oack_1    ), 
        .olck_1  ( n10_olck_1    ), 
        .odata_1 ( n10_odata_1   ), 
        .ovalid_1( n10_ovalid_1  ), 
        .ovch_1  ( n10_ovch_1    ), 
        .iack_1  ( n14_oack_3    ), 
        .ilck_1  ( n14_olck_3    ), 

        .idata_2 ( n11_odata_0   ), 
        .ivalid_2( n11_ovalid_0  ), 
        .ivch_2  ( n11_ovch_0    ), 
        .oack_2  ( n10_oack_2    ), 
        .olck_2  ( n10_olck_2    ), 
        .odata_2 ( n10_odata_2   ), 
        .ovalid_2( n10_ovalid_2  ), 
        .ovch_2  ( n10_ovch_2    ), 
        .iack_2  ( n11_oack_0    ), 
        .ilck_2  ( n11_olck_0    ), 

        .idata_3 ( n6_odata_1   ), 
        .ivalid_3( n6_ovalid_1  ), 
        .ivch_3  ( n6_ovch_1    ), 
        .oack_3  ( n10_oack_3    ), 
        .olck_3  ( n10_olck_3    ), 
        .odata_3 ( n10_odata_3   ), 
        .ovalid_3( n10_ovalid_3  ), 
        .ovch_3  ( n10_ovch_3    ), 
        .iack_3  ( n6_oack_1    ), 
        .ilck_3  ( n6_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 14, 3, 2 ) n14 ( 
        .idata_4 ( n14_idata_p0  ), 
        .ivalid_4( n14_ivalid_p0 ), 
        .ivch_4  ( n14_ivch_p0   ), 
        .ordy_4  ( n14_ordy_p0   ), 
        .odata_4 ( n14_odata_p0  ), 
        .ovalid_4( n14_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n13_odata_2   ), 
        .ivalid_0( n13_ovalid_2  ), 
        .ivch_0  ( n13_ovch_2    ), 
        .oack_0  ( n14_oack_0    ), 
        .olck_0  ( n14_olck_0    ), 
        .odata_0 ( n14_odata_0   ), 
        .ovalid_0( n14_ovalid_0  ), 
        .ovch_0  ( n14_ovch_0    ), 
        .iack_0  ( n13_oack_2    ), 
        .ilck_0  ( n13_olck_2    ), 

        .idata_1 ( n18_odata_3   ), 
        .ivalid_1( n18_ovalid_3  ), 
        .ivch_1  ( n18_ovch_3    ), 
        .oack_1  ( n14_oack_1    ), 
        .olck_1  ( n14_olck_1    ), 
        .odata_1 ( n14_odata_1   ), 
        .ovalid_1( n14_ovalid_1  ), 
        .ovch_1  ( n14_ovch_1    ), 
        .iack_1  ( n18_oack_3    ), 
        .ilck_1  ( n18_olck_3    ), 

        .idata_2 ( n15_odata_0   ), 
        .ivalid_2( n15_ovalid_0  ), 
        .ivch_2  ( n15_ovch_0    ), 
        .oack_2  ( n14_oack_2    ), 
        .olck_2  ( n14_olck_2    ), 
        .odata_2 ( n14_odata_2   ), 
        .ovalid_2( n14_ovalid_2  ), 
        .ovch_2  ( n14_ovch_2    ), 
        .iack_2  ( n15_oack_0    ), 
        .ilck_2  ( n15_olck_0    ), 

        .idata_3 ( n10_odata_1   ), 
        .ivalid_3( n10_ovalid_1  ), 
        .ivch_3  ( n10_ovch_1    ), 
        .oack_3  ( n14_oack_3    ), 
        .olck_3  ( n14_olck_3    ), 
        .odata_3 ( n14_odata_3   ), 
        .ovalid_3( n14_ovalid_3  ), 
        .ovch_3  ( n14_ovch_3    ), 
        .iack_3  ( n10_oack_1    ), 
        .ilck_3  ( n10_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
);

router #( 18, 4, 2 ) n18 ( 
        .idata_4 ( n18_idata_p0  ), 
        .ivalid_4( n18_ivalid_p0 ), 
        .ivch_4  ( n18_ivch_p0   ), 
        .ordy_4  ( n18_ordy_p0   ), 
        .odata_4 ( n18_odata_p0  ), 
        .ovalid_4( n18_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n17_odata_2   ), 
        .ivalid_0( n17_ovalid_2  ), 
        .ivch_0  ( n17_ovch_2    ), 
        .oack_0  ( n18_oack_0    ), 
        .olck_0  ( n18_olck_0    ), 
        .odata_0 ( n18_odata_0   ), 
        .ovalid_0( n18_ovalid_0  ), 
        .ovch_0  ( n18_ovch_0    ), 
        .iack_0  ( n17_oack_2    ), 
        .ilck_0  ( n17_olck_2    ), 

        .idata_1 ( `DATAW_P1'b0 ),  
        .ivalid_1( 1'b0         ),  
        .ivch_1  ( `VCHW_P1'b0  ),  
        .iack_1  ( `VCH_P1'b0   ),  
        .ilck_1  ( `VCH_P1'b0   ),  

        .idata_2 ( n19_odata_0   ), 
        .ivalid_2( n19_ovalid_0  ), 
        .ivch_2  ( n19_ovch_0    ), 
        .oack_2  ( n18_oack_2    ), 
        .olck_2  ( n18_olck_2    ), 
        .odata_2 ( n18_odata_2   ), 
        .ovalid_2( n18_ovalid_2  ), 
        .ovch_2  ( n18_ovch_2    ), 
        .iack_2  ( n19_oack_0    ), 
        .ilck_2  ( n19_olck_0    ), 

        .idata_3 ( n14_odata_1   ), 
        .ivalid_3( n14_ovalid_1  ), 
        .ivch_3  ( n14_ovch_1    ), 
        .oack_3  ( n18_oack_3    ), 
        .olck_3  ( n18_olck_3    ), 
        .odata_3 ( n18_odata_3   ), 
        .ovalid_3( n18_ovalid_3  ), 
        .ovch_3  ( n18_ovch_3    ), 
        .iack_3  ( n14_oack_1    ), 
        .ilck_3  ( n14_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 


router #( 3, 0, 3 ) n3 ( 
        .idata_4 ( n3_idata_p0  ), 
        .ivalid_4( n3_ivalid_p0 ), 
        .ivch_4  ( n3_ivch_p0   ), 
        .ordy_4  ( n3_ordy_p0   ), 
        .odata_4 ( n3_odata_p0  ), 
        .ovalid_4( n3_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n2_odata_2   ), 
        .ivalid_0( n2_ovalid_2  ), 
        .ivch_0  ( n2_ovch_2    ), 
        .oack_0  ( n3_oack_0    ), 
        .olck_0  ( n3_olck_0    ), 
        .odata_0 ( n3_odata_0   ), 
        .ovalid_0( n3_ovalid_0  ), 
        .ovch_0  ( n3_ovch_0    ), 
        .iack_0  ( n2_oack_2    ), 
        .ilck_0  ( n2_olck_2    ), 

        .idata_1 ( n7_odata_3   ), 
        .ivalid_1( n7_ovalid_3  ), 
        .ivch_1  ( n7_ovch_3    ), 
        .oack_1  ( n3_oack_1    ), 
        .olck_1  ( n3_olck_1    ), 
        .odata_1 ( n3_odata_1   ), 
        .ovalid_1( n3_ovalid_1  ), 
        .ovch_1  ( n3_ovch_1    ), 
        .iack_1  ( n7_oack_3    ), 
        .ilck_1  ( n7_olck_3    ), 

        .idata_2 ( `DATAW_P1'b0 ),  
        .ivalid_2( 1'b0         ),  
        .ivch_2  ( `VCHW_P1'b0  ),  
        .iack_2  ( `VCH_P1'b0   ),  
        .ilck_2  ( `VCH_P1'b0   ),  

        .idata_3 ( `DATAW_P1'b0 ),  
        .ivalid_3( 1'b0         ),  
        .ivch_3  ( `VCHW_P1'b0  ),  
        .iack_3  ( `VCH_P1'b0   ),  
        .ilck_3  ( `VCH_P1'b0   ),  

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 7, 1, 3 ) n7 ( 
        .idata_4 ( n7_idata_p0  ), 
        .ivalid_4( n7_ivalid_p0 ), 
        .ivch_4  ( n7_ivch_p0   ), 
        .ordy_4  ( n7_ordy_p0   ), 
        .odata_4 ( n7_odata_p0  ), 
        .ovalid_4( n7_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n6_odata_2   ), 
        .ivalid_0( n6_ovalid_2  ), 
        .ivch_0  ( n6_ovch_2    ), 
        .oack_0  ( n7_oack_0    ), 
        .olck_0  ( n7_olck_0    ), 
        .odata_0 ( n7_odata_0   ), 
        .ovalid_0( n7_ovalid_0  ), 
        .ovch_0  ( n7_ovch_0    ), 
        .iack_0  ( n6_oack_2    ), 
        .ilck_0  ( n6_olck_2    ), 

        .idata_1 ( n11_odata_3   ), 
        .ivalid_1( n11_ovalid_3  ), 
        .ivch_1  ( n11_ovch_3    ), 
        .oack_1  ( n7_oack_1    ), 
        .olck_1  ( n7_olck_1    ), 
        .odata_1 ( n7_odata_1   ), 
        .ovalid_1( n7_ovalid_1  ), 
        .ovch_1  ( n7_ovch_1    ), 
        .iack_1  ( n11_oack_3    ), 
        .ilck_1  ( n11_olck_3    ), 

        .idata_2 ( `DATAW_P1'b0 ),  
        .ivalid_2( 1'b0         ),  
        .ivch_2  ( `VCHW_P1'b0  ),  
        .iack_2  ( `VCH_P1'b0   ),  
        .ilck_2  ( `VCH_P1'b0   ),  

        .idata_3 ( n3_odata_1   ), 
        .ivalid_3( n3_ovalid_1  ), 
        .ivch_3  ( n3_ovch_1    ), 
        .oack_3  ( n7_oack_3    ), 
        .olck_3  ( n7_olck_3    ), 
        .odata_3 ( n7_odata_3   ), 
        .ovalid_3( n7_ovalid_3  ), 
        .ovch_3  ( n7_ovch_3    ), 
        .iack_3  ( n3_oack_1    ), 
        .ilck_3  ( n3_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 11, 2, 3 ) n11 ( 
        .idata_4 ( n11_idata_p0  ), 
        .ivalid_4( n11_ivalid_p0 ), 
        .ivch_4  ( n11_ivch_p0   ), 
        .ordy_4  ( n11_ordy_p0   ), 
        .odata_4 ( n11_odata_p0  ), 
        .ovalid_4( n11_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n10_odata_2   ), 
        .ivalid_0( n10_ovalid_2  ), 
        .ivch_0  ( n10_ovch_2    ), 
        .oack_0  ( n11_oack_0    ), 
        .olck_0  ( n11_olck_0    ), 
        .odata_0 ( n11_odata_0   ), 
        .ovalid_0( n11_ovalid_0  ), 
        .ovch_0  ( n11_ovch_0    ), 
        .iack_0  ( n10_oack_2    ), 
        .ilck_0  ( n10_olck_2    ), 

        .idata_1 ( n15_odata_3   ), 
        .ivalid_1( n15_ovalid_3  ), 
        .ivch_1  ( n15_ovch_3    ), 
        .oack_1  ( n11_oack_1    ), 
        .olck_1  ( n11_olck_1    ), 
        .odata_1 ( n11_odata_1   ), 
        .ovalid_1( n11_ovalid_1  ), 
        .ovch_1  ( n11_ovch_1    ), 
        .iack_1  ( n15_oack_3    ), 
        .ilck_1  ( n15_olck_3    ), 

        .idata_2 ( `DATAW_P1'b0 ),  
        .ivalid_2( 1'b0         ),  
        .ivch_2  ( `VCHW_P1'b0  ),  
        .iack_2  ( `VCH_P1'b0   ),  
        .ilck_2  ( `VCH_P1'b0   ),  

        .idata_3 ( n7_odata_1   ), 
        .ivalid_3( n7_ovalid_1  ), 
        .ivch_3  ( n7_ovch_1    ), 
        .oack_3  ( n11_oack_3    ), 
        .olck_3  ( n11_olck_3    ), 
        .odata_3 ( n11_odata_3   ), 
        .ovalid_3( n11_ovalid_3  ), 
        .ovch_3  ( n11_ovch_3    ), 
        .iack_3  ( n7_oack_1    ), 
        .ilck_3  ( n7_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 15, 3, 3 ) n15 ( 
        .idata_4 ( n15_idata_p0  ), 
        .ivalid_4( n15_ivalid_p0 ), 
        .ivch_4  ( n15_ivch_p0   ), 
        .ordy_4  ( n15_ordy_p0   ), 
        .odata_4 ( n15_odata_p0  ), 
        .ovalid_4( n15_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n14_odata_2   ), 
        .ivalid_0( n14_ovalid_2  ), 
        .ivch_0  ( n14_ovch_2    ), 
        .oack_0  ( n15_oack_0    ), 
        .olck_0  ( n15_olck_0    ), 
        .odata_0 ( n15_odata_0   ), 
        .ovalid_0( n15_ovalid_0  ), 
        .ovch_0  ( n15_ovch_0    ), 
        .iack_0  ( n14_oack_2    ), 
        .ilck_0  ( n14_olck_2    ), 

        .idata_1 ( n19_odata_3   ), 
        .ivalid_1( n19_ovalid_3  ), 
        .ivch_1  ( n19_ovch_3    ), 
        .oack_1  ( n15_oack_1    ), 
        .olck_1  ( n15_olck_1    ), 
        .odata_1 ( n15_odata_1   ), 
        .ovalid_1( n15_ovalid_1  ), 
        .ovch_1  ( n15_ovch_1    ), 
        .iack_1  ( n19_oack_3    ), 
        .ilck_1  ( n19_olck_3    ), 

        .idata_2 ( `DATAW_P1'b0 ),  
        .ivalid_2( 1'b0         ),  
        .ivch_2  ( `VCHW_P1'b0  ),  
        .iack_2  ( `VCH_P1'b0   ),  
        .ilck_2  ( `VCH_P1'b0   ),  

        .idata_3 ( n11_odata_1   ), 
        .ivalid_3( n11_ovalid_1  ), 
        .ivch_3  ( n11_ovch_1    ), 
        .oack_3  ( n15_oack_3    ), 
        .olck_3  ( n15_olck_3    ), 
        .odata_3 ( n15_odata_3   ), 
        .ovalid_3( n15_ovalid_3  ), 
        .ovch_3  ( n15_ovch_3    ), 
        .iack_3  ( n11_oack_1    ), 
        .ilck_3  ( n11_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

router #( 19, 4, 3 ) n19 ( 
        .idata_4 ( n19_idata_p0  ), 
        .ivalid_4( n19_ivalid_p0 ), 
        .ivch_4  ( n19_ivch_p0   ), 
        .ordy_4  ( n19_ordy_p0   ), 
        .odata_4 ( n19_odata_p0  ), 
        .ovalid_4( n19_ovalid_p0 ), 
        .iack_4  ( `VCH_P1'hff  ),  
        .ilck_4  ( `VCH_P1'h00  ),  

        .idata_0 ( n18_odata_2   ), 
        .ivalid_0( n18_ovalid_2  ), 
        .ivch_0  ( n18_ovch_2    ), 
        .oack_0  ( n19_oack_0    ), 
        .olck_0  ( n19_olck_0    ), 
        .odata_0 ( n19_odata_0   ), 
        .ovalid_0( n19_ovalid_0  ), 
        .ovch_0  ( n19_ovch_0    ), 
        .iack_0  ( n18_oack_2    ), 
        .ilck_0  ( n18_olck_2    ), 

        .idata_1 ( `DATAW_P1'b0 ),  
        .ivalid_1( 1'b0         ),  
        .ivch_1  ( `VCHW_P1'b0  ),  
        .iack_1  ( `VCH_P1'b0   ),  
        .ilck_1  ( `VCH_P1'b0   ),  

        .idata_2 ( `DATAW_P1'b0 ),  
        .ivalid_2( 1'b0         ),  
        .ivch_2  ( `VCHW_P1'b0  ),  
        .iack_2  ( `VCH_P1'b0   ),  
        .ilck_2  ( `VCH_P1'b0   ),  

        .idata_3 ( n15_odata_1   ), 
        .ivalid_3( n15_ovalid_1  ), 
        .ivch_3  ( n15_ovch_1    ), 
        .oack_3  ( n19_oack_3    ), 
        .olck_3  ( n19_olck_3    ), 
        .odata_3 ( n19_odata_3   ), 
        .ovalid_3( n19_ovalid_3  ), 
        .ovch_3  ( n19_ovch_3    ), 
        .iack_3  ( n15_oack_1    ), 
        .ilck_3  ( n15_olck_1    ), 

        .clk ( clk  ), 
        .rst_( rst_ )  
); 

endmodule 
