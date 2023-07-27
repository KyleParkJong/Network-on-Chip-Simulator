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

input  [`PORT:0]  multab_ct;
input             clk, rst_; 

output [`PORT:0]  sel;          
output [`PORT:0]  grt;          

reg    [`PORT:0]  last; 
wire   [`PORT:0]  u_req;  
wire   [`PORT:0]  m_req;  
wire   [`PORT:0]  grt0; 
wire   [`PORT:0]  hold; 
wire              anyhold;
   
/* Unicast request */
assign  u_req[0]  = ~multab_0[1] & req_0 & (port_0 == PORTID);     
assign  u_req[1]  = ~multab_1[1] & req_1 & (port_1 == PORTID); 
assign  u_req[2]  = ~multab_2[1] & req_2 & (port_2 == PORTID); 
assign  u_req[3]  = ~multab_3[1] & req_3 & (port_3 == PORTID); 
assign  u_req[4]  = ~multab_4[1] & req_4 & (port_4 == PORTID); 

/* Multicast request */
assign  m_req[0]  = multab_0[1] & req_0 & (port_0 == PORTID); 
assign  m_req[1]  = multab_1[1] & req_1 & (port_1 == PORTID); 
assign  m_req[2]  = multab_2[1] & req_2 & (port_2 == PORTID); 
assign  m_req[3]  = multab_3[1] & req_3 & (port_3 == PORTID); 
assign  m_req[4]  = multab_4[1] & req_4 & (port_4 == PORTID); 

assign  hold    = (last & u_req) | (last & m_req); 
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

/* Arbiter */                    
arb a0 (               
        .u_req       ( u_req ),        // input
        .m_req       ( m_req ),        // input
        .grt         ( grt0 ),         // output
        .multab_ct   ( multab_ct ),    // input
        .clk ( clk  ), 
        .rst_( rst_ )
);                     

endmodule
