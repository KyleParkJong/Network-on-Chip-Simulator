module pe_mux (
    req,

    grt,
    sel,
    
    clk,
    rst_
);

input [1:0] req;
input clk, rst_;

output [1:0] grt, sel;

reg [1:0] last;

wire [1:0]  grt0;
wire [1:0]  hold;
wire        anyhold;

assign  hold    = last & req; 
assign  anyhold = |hold;      
assign  sel     = last;       

/* First req, hold grt until ~req */
always @ (posedge clk) begin 
        if (rst_ == `Enable_) 
                last    <= 2'b0; 
        else if (last != grt)               
                last    <= grt;             
end

assign  grt[0]  = anyhold ? hold[0] : grt0[0]; 
assign  grt[1]  = anyhold ? hold[1] : grt0[1]; 

pe_arb arb0 (
    .req( req ), 
    .grt( grt0 )
);

endmodule