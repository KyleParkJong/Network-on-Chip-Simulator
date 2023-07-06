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

        fwdab_0,
        fwdab_1,
        fwdab_2,
        fwdab_3,
        fwdab_4,    

        sel, 
        grt, 

        clk, 
        rst_ 
);
parameter       PORTID = 0; 

//input
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

// muxcont_4에서 inputc0~4에서 들어오는 fwdab 신호 종합
input             fwdab_0;
input             fwdab_1;
input             fwdab_2;
input             fwdab_3;
input             fwdab_4;

//out
output [`PORT:0]  sel; 
output [`PORT:0]  grt; 

input             clk, rst_; 

reg    [`PORT:0]  last; 
wire   [`PORT:0]  req;  
wire   [`PORT:0]  grt0; 
wire   [`PORT:0]  hold; 
wire              anyhold;

// request logic
assign  req[0]  = (fwdab_0 & req_0) || (req_0 & (port_0 == PORTID)); 
assign  req[1]  = (fwdab_1 & req_1) || (req_1 & (port_1 == PORTID)); 
assign  req[2]  = (fwdab_2 & req_2) || (req_2 & (port_2 == PORTID)); 
assign  req[3]  = (fwdab_3 & req_3) || (req_3 & (port_3 == PORTID)); 
assign  req[4]  = (fwdab_4 & req_4) || (req_4 & (port_4 == PORTID));

// grt, sel logic
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

assign  grt[0]  = anyhold ? hold[0] : grt0[0]; 
assign  grt[1]  = anyhold ? hold[1] : grt0[1]; 
assign  grt[2]  = anyhold ? hold[2] : grt0[2]; 
assign  grt[3]  = anyhold ? hold[3] : grt0[3]; 
assign  grt[4]  = anyhold ? hold[4] : grt0[4]; 

/*                     
 * Arbiter             
 */                    
arb a0 (               
        .req ( req  ), 
        .grt ( grt0 ),
        .clk ( clk  ), 
        .rst_( rst_ )  
);                     

endmodule
