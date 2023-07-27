`include "define.h" 
module outputc (
        idata,
        ivalid,
        ivch,

        odata,
        ovalid,
        ovch,

        iack,
        ordy,

        ilck,
        olck,

        clk,
        rst_
);
parameter       ROUTERID= 0;
parameter       PCHID   = 0;

input   [`DATAW:0]      idata;
input                   ivalid;
input   [`VCHW:0]       ivch;

output  [`DATAW:0]      odata;
output                  ovalid;
output  [`VCHW:0]       ovch;

input   [`VCH:0]        iack;
output  [`VCH:0]        ordy;

input   [`VCH:0]        ilck;
output  [`VCH:0]        olck;

input   clk, rst_;

reg     [`DATAW:0]      odata;
reg                     ovalid;
reg     [`VCHW:0]       ovch;

wire    [`TYPEW:0]      itype;
wire    [`TYPEW:0]      otype;

reg     [`VCH:0]        olck;

reg     [`FIFOD_P1:0]   cnt0; 

/*
 * Input/Output flit type
 */
assign  itype   = (ivalid == `Enable) ? idata[`TYPE_MSB:`TYPE_LSB] :
                                        0;
assign  otype   = (ovalid == `Enable) ? odata[`TYPE_MSB:`TYPE_LSB] :
                                        0;

/*
 * Output data
 */
always @ (posedge clk) begin
        if (rst_ == `Enable_) begin
                odata   <= `DATAW_P1'b0;
                ovalid  <= `Disable;
                ovch    <= `VCHW_P1'b0;
        end else if (ivalid) begin
                odata   <= idata;
                ovalid  <= ivalid;
                ovch    <= ivch;
        end else if (~ivalid & ovalid) begin
                odata   <= `DATAW_P1'b0;
                ovalid  <= `Disable;
                ovch    <= `VCHW_P1'b0;
        end
end

/*  
 * Virtual-channel status (lock) 
 */ 
always @ (posedge clk) begin                      
        if (rst_ == `Enable_)                     
                olck[0] <= `Disable;             
        else if ( (ivalid && ivch == 0) || (ovalid && ovch == 0) )
                olck[0] <= `Enable;              
        else if (olck[0] && ~ilck[0])           
                olck[0] <= `Disable;             
end                                               

/*  
 * Virtual-channel status (ready) 
 */ 
assign  ordy[0] = ((`FIFO_P1 - cnt0) >= `PKTLEN_P1) ? `Enable : `Disable;
always @ (posedge clk) begin                      
        if (rst_ == `Enable_)                     
                cnt0  <= 0;                      
        else if (iack[0] && ~(ivalid && ivch == 0) && cnt0 != 0) 
                cnt0  <= cnt0 - 1;              
        else if (~iack[0] && (ivalid && ivch == 0)) 
                cnt0  <= cnt0 + 1;              
end                                               

endmodule 
