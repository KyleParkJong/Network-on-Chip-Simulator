`include "define.h" 
module arb ( 
        req, 
        grt,
        multab_ct,    // Multicast & Absorb contention
        clk, 
        rst_ 
);

input  [`PORT:0]  req;      
output [`PORT:0]  grt;    
input  [`PORT:0]  multab_ct;
input             clk, rst_;

// Fixed priority (Eject,West,North,East,South) 

assign  grt[4]   = ~multab_ct[4] & req[4];
assign  grt[3]   = ~multab_ct[3] & (req[4] == 0) & req[3];
assign  grt[0]   = ~multab_ct[0] & (req[4] == 0 && req[3] == 0) & req[0];
assign  grt[1]   = ~multab_ct[1] & (req[4] == 0 && req[3] == 0 && req[0] == 0) & req[1];  
assign  grt[2]   = ~multab_ct[2] & (req[4] == 0 && req[3] == 0 && req[0] == 0 && req[1] == 0) & req[2]; 

endmodule