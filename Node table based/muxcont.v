`include "define.h" 
module muxcont ( 
        port_0,   
        req_0,    

        port_1,   
        req_1,    

        port_2,   
        req_2,    

        port_3,   
        req_3,    

        port_4,   
        req_4,    

        sel, 
        grt,

        multab_0,
        multab_1,
        multab_2,
        multab_3,
        multab_4, 

        multab_ct,        

        clk, 
        rst_ 
);
parameter       PORTID = 0;     

input  [`PORTW:0] port_0;   
input             req_0;    

input  [`PORTW:0] port_1;   
input             req_1;    

input  [`PORTW:0] port_2;   
input             req_2;    

input  [`PORTW:0] port_3;   
input             req_3;    

input  [`PORTW:0] port_4;   
input             req_4;    

input  [`DSTATUS:0] multab_0;
input  [`DSTATUS:0] multab_1;
input  [`DSTATUS:0] multab_2;
input  [`DSTATUS:0] multab_3;
input  [`DSTATUS:0] multab_4;

output [`PORT:0]  sel;          
output [`PORT:0]  grt;          

input  [`PORT:0]  multab_ct;

input             clk, rst_; 

reg    [`PORT:0]  last; 
wire   [`PORT:0]  req;  
wire   [`PORT:0]  grt0; 
wire   [`PORT:0]  hold; 
wire              anyhold;
wire              multab_en;

assign multab_en = ((multab_0[1]) |          // Multicast check
                    (multab_1[1]) |
                    (multab_2[1]) |
                    (multab_3[1]) |
                    (multab_4[1]) );
   
/* Request logic 
 * : Multicast 1st priority 
 */
assign  req[0]  = multab_en ? (multab_0[1] & req_0 & (port_0 == PORTID)) : (req_0 & (port_0 == PORTID)); 
assign  req[1]  = multab_en ? (multab_1[1] & req_1 & (port_1 == PORTID)) : (req_1 & (port_1 == PORTID)); 
assign  req[2]  = multab_en ? (multab_2[1] & req_2 & (port_2 == PORTID)) : (req_2 & (port_2 == PORTID)); 
assign  req[3]  = multab_en ? (multab_3[1] & req_3 & (port_3 == PORTID)) : (req_3 & (port_3 == PORTID)); 
assign  req[4]  = multab_en ? (multab_4[1] & req_4 & (port_4 == PORTID)) : (req_4 & (port_4 == PORTID));

assign  hold    = last & req; 
assign  anyhold = |hold;      
assign  sel     = last;       

always @ (posedge clk) begin 
        if (rst_ == `Enable_) 
                last    <= `PORT_P1'b0; 
        else if (last != grt)               
                last    <= grt;
        else
                last    <= last;     
end 

/* Grant */
assign  grt[0]  = anyhold ? hold[0] : grt0[0]; 
assign  grt[1]  = anyhold ? hold[1] : grt0[1]; 
assign  grt[2]  = anyhold ? hold[2] : grt0[2]; 
assign  grt[3]  = anyhold ? hold[3] : grt0[3]; 
assign  grt[4]  = anyhold ? hold[4] : grt0[4]; 

/*                     
 * Arbiter             
 */                    
arb a0 (               
        .req       ( req  ),          // input
        .grt       ( grt0 ),          // output
        .multab_ct ( multab_ct ),     // input
        .clk ( clk  ), 
        .rst_( rst_ )
);                     

endmodule
