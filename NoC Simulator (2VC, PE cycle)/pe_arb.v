`include "define.v" 
module pe_arb ( 
        req, 
        grt
);

input  [1:0]  req;      
output [1:0]  grt;      

assign  grt[0]  =                   req[0]; 
assign  grt[1]  = (req[0]   == 0) & req[1];

endmodule
