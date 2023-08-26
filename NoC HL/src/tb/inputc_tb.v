`timescale 1ns/1ps
`include "define.v"
`include "parameters.v"
module inputc_tb ();


    reg clk, rst_;

    always #5 clk <= ~clk;

    reg   [`DATAW:0]      idata;  
    reg                   ivalid; 
    reg   [`VCHW:0]       ivch;   
    wire  [`VCH:0]        oack;   
    wire  [`VCH:0]        ordy;   
    wire  [`VCH:0]        olck;   

    wire  [`DATAW:0]      odata;  
    wire                  ovalid; 
    wire  [`VCHW:0]       ovch;   

    reg   [`VCH:0]        irdy_0; 
    reg   [`VCH:0]        irdy_1; 
    reg   [`VCH:0]        irdy_2; 
    reg   [`VCH:0]        irdy_3; 
    reg   [`VCH:0]        irdy_4; 

    reg   [`VCH:0]        ilck_0; 
    reg   [`VCH:0]        ilck_1; 
    reg   [`VCH:0]        ilck_2; 
    reg   [`VCH:0]        ilck_3; 
    reg   [`VCH:0]        ilck_4; 

    reg                   grt_0; 
    reg                   grt_1; 
    reg                   grt_2; 
    reg                   grt_3; 
    reg                   grt_4; 

    wire  [`PORTW:0]      port;   
    wire                  req;    
    wire  [`DSTATUS:0]    multab_en;

    inputc #(
        .ROUTERID(4),
        .PCHID(0),
        .MY_XPOS(1),
        .MY_YPOS(0)
    ) in0 (
        .idata(idata),  
        .ivalid(ivalid), 
        .ivch(ivch),   
        .oack(oack),   
        .ordy(ordy),   
        .olck(olck),   
 
        .odata(odata),  
        .ovalid(ovalid), 
        .ovch(ovch),   
 
        .irdy_0(irdy_0), 
        .irdy_1(irdy_1), 
        .irdy_2(irdy_2), 
        .irdy_3(irdy_3), 
        .irdy_4(irdy_4), 
        .ilck_0(ilck_0), 
        .ilck_1(ilck_1), 
        .ilck_2(ilck_2), 
        .ilck_3(ilck_3), 
        .ilck_4(ilck_4), 
 
        .grt_0(grt_0), 
        .grt_1(grt_1), 
        .grt_2(grt_2), 
        .grt_3(grt_3), 
        .grt_4(grt_4), 
 
        .port(port),  
        .req(req),   
        .multab_en(multab_en),
 
        .clk(clk), 
        .rst_(rst_) 
    );


    initial begin
        clk  = 0;
        rst_ = 1;
        #10
        rst_ = 0; 

        idata = {2'b01, 1'b1, 56'b10101001101010010000, 5'b00100, 2'b00};
        ivalid = 1'b1;
        ivch = 1'b0;

        irdy_0 = 1'b1;
        irdy_1 = 1'b1;
        irdy_2 = 1'b1;
        irdy_3 = 1'b1;
        irdy_4 = 1'b1;

        ilck_0 = 1'b0;
        ilck_1 = 1'b0;
        ilck_2 = 1'b0;
        ilck_3 = 1'b0;
        ilck_4 = 1'b0;

    end

endmodule