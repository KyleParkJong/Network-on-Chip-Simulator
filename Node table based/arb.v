`include "define.h" 
module arb ( 
        req, 
        grt, 
        clk, 
        rst_ 
);

input  [`PORT:0]  req;      
output [`PORT:0]  grt;      
input             clk, rst_;

assign  grt[0]  =                   req[0]; 
assign  grt[1]  = (req[0]   == 0) & req[1]; 
assign  grt[2]  = (req[1:0] == 0) & req[2]; 
assign  grt[3]  = (req[2:0] == 0) & req[3]; 
assign  grt[4]  = (req[3:0] == 0) & req[4]; 

endmodule
