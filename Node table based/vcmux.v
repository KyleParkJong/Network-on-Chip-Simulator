`include "define.h" 
module vcmux ( 
        ovalid0, 

        odata0, 

        ovch0, 

        req0, 

        port0, 

        ovalid, 
        odata,  
        ovch,   
        req,    
        port,   
        vcsel,  

        clk,    
        rst_    
);
input                   ovalid0; 

input   [`DATAW:0]      odata0; 

input   [`VCHW:0]       ovch0; 

input                   req0; 

input   [`PORTW:0]      port0; 

output                  ovalid; 
output  [`DATAW:0]      odata;  
output  [`VCHW:0]       ovch;   
output                  req;    
output  [`PORTW:0]      port;   
output  [`VCH:0]        vcsel;  

input   clk, rst_; 

reg    [`VCH:0]         last;   
wire   [`VCH:0]         grt;    
wire   [`VCH:0]         hold;   
wire                    anyhold;

assign  hold    = last & {req0}; 
assign  anyhold = |hold;
assign  vcsel   = grt;  

always @ (posedge clk) begin          
        if (rst_ == `Enable_)         
                last    <= `VCH_P1'b0; 
        else if (last != grt)         
                last    <= grt;       
end                                   

assign  grt[0]  = anyhold ? hold[0] : ( req0); 

assign  ovalid  = ovalid0;
assign  req     = req0;

assign  odata   = 
                  (last[0] == `Enable) ? odata0 : `DATAW_P1'b0;
assign  ovch    = 
                  (last[0] == `Enable) ? ovch0 : `VCHW_P1'b0;
assign  port    = 
                  (vcsel[0] == `Enable) ? port0 : `PORTW_P1'b0;
endmodule
