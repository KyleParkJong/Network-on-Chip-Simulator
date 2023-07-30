`include "define.h" 
module muxcont4 ( 
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

        multab_0,
        multab_1,
        multab_2,
        multab_3,
        multab_4,

        multab_ct,    

        sel, 
        grt, 

        clk, 
        rst_ 
);

parameter        PORTID = 4;               

/* input */
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
output [`PORT:0]  multab_ct;

input             clk, rst_; 

reg    [`PORT:0]  last; 
wire   [`PORT:0]  u_req;  
wire   [`PORT:0]  m_req;  
wire   [`PORT:0]  grt0; 
wire   [`PORT:0]  hold; 
wire              anyhold;

/* Unicast request */
assign  u_req[0]  = req_0 & (multab_0 == `UNICAST) & (port_0 == PORTID); 
assign  u_req[1]  = req_1 & (multab_1 == `UNICAST) & (port_1 == PORTID); 
assign  u_req[2]  = req_2 & (multab_2 == `UNICAST) & (port_2 == PORTID); 
assign  u_req[3]  = req_3 & (multab_3 == `UNICAST) & (port_3 == PORTID); 
assign  u_req[4]  = req_4 & (multab_4 == `UNICAST) & (port_4 == PORTID);

/* Multicast request */
assign  m_req[0]  = req_0 & (multab_0 == `MULTABS); 
assign  m_req[1]  = req_1 & (multab_1 == `MULTABS); 
assign  m_req[2]  = req_2 & (multab_2 == `MULTABS); 
assign  m_req[3]  = req_3 & (multab_3 == `MULTABS); 
assign  m_req[4]  = req_4 & (multab_4 == `MULTABS);

/* Grant, Sel logic */
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

assign  grt[0]  = anyhold ? hold[0] : grt0[0]; 
assign  grt[1]  = anyhold ? hold[1] : grt0[1]; 
assign  grt[2]  = anyhold ? hold[2] : grt0[2]; 
assign  grt[3]  = anyhold ? hold[3] : grt0[3]; 
assign  grt[4]  = anyhold ? hold[4] : grt0[4]; 

/* Multicast & Absorb contention logic */
assign  multab_ct[0] = m_req[0] & (~grt[0]);
assign  multab_ct[1] = m_req[1] & (~grt[1]);
assign  multab_ct[2] = m_req[2] & (~grt[2]);
assign  multab_ct[3] = m_req[3] & (~grt[3]);
assign  multab_ct[4] = m_req[4] & (~grt[4]);


/* Arbiter */
generate
    if ( `ARBITER_TYPE == `FIXED_PRIORITY ) begin           
        arb_fixed a0 (               
            .u_req       ( u_req ),         // input
            .m_req       ( m_req ),         // input
            .grt         ( grt0 ),          // output
            .multab_ct   ( `PORT_P1'b0 )
        );           
    end
    else if ( `ARBITER_TYPE == `ROUND_ROBIN ) begin
        arb_roundrobin a0 (
            .u_req       ( u_req ),         
            .m_req       ( m_req ),         
            .grt         ( grt0 ),          
            .multab_ct   ( `PORT_P1'b0 ),
            .clk         ( clk ),
            .rst_        ( rst_ )
        );
    end 
    else begin  // Default
        arb_fixed a0 (               
            .u_req       ( u_req ),         
            .m_req       ( m_req ),         
            .grt         ( grt0 ),          
            .multab_ct   ( `PORT_P1'b0 )
        );
    end 
endgenerate

endmodule