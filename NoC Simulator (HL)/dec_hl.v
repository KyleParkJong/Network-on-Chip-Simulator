`include "define.v"
`include "parameters.v"

module dec_hl (
	um_type,
	uni_dst,
	mult_dst,
    src_pos,
    src_dst,

	port,
    doc_send,      
    doc_remain,    
    umesh_state,   
	multab_en
);

`include "functions.sv"

/* Parameters */
parameter  MY_XPOS = 0;
parameter  MY_YPOS = 0;
localparam MY_POS  = MY_XPOS*`ROW+MY_YPOS;

/* I/O */
input um_type;
input [`NODEW:0] uni_dst;
input [`MADDR:0] mult_dst;
input [1:0] src_pos;
input [`MSRC_BW:0] src_dst;

output     [2:0]    port;
output reg [`MADDR:0]   doc_send;       // DOC sent to cb
output reg [`MADDR:0]   doc_remain;     // DOC sent to re_fifo
output reg [1:0]    umesh_state;        // control signal 
output reg [1:0]    multab_en;

/* Variables */
reg	    [2:0]	        dst_xpos;      
reg	    [1:0]	        dst_ypos;      

reg [`MADDR:0] l1_dst;        // L1 destinations
reg [`MADDR:0] l2_dst;
reg [`NODEW:0]  next_pos;

wire [`NODEW:0]  next_pos0;    // binary dst (Center of DOC)
wire [`MADDR:0] doc_send0;    // Dimension-Chain order (Half DOC to send)
wire [1:0] umesh_state0;

always @(*) begin
    if (um_type == 0) begin     /* Unicast */
        umesh_state = `UMESH_UNI;
        next_pos = uni_dst;
        multab_en = `UNICAST;
        doc_send = 0;
        doc_remain = 0;
    end
    else begin      /* Multicast */

        // Finding L1, L2 dst
        l1_dst = find_l1(mult_dst, src_pos);
        l2_dst = find_l2(l1_dst, src_pos);

        // From module : u_mesh_algorithm.v 
        next_pos = next_pos0;
        doc_send = doc_send0;
        umesh_state = umesh_state0;

        // DOC remain
        if ( umesh_state0 == `UMESH_MULT_ROW) 
            doc_remain = 0;
        else 
            doc_remain = doc_send0 ^ mult_dst;


        // multab_en signal
        if ((mult_dst[MY_POS] == 1) && (umesh_state0 == `UMESH_MULT_ROW))
            multab_en = `MULTABS;
        else
            multab_en = `MULTFWD;
        
    end
end 

u_mesh_algorithm #(MY_XPOS, MY_YPOS) u_mesh (
    .l1_dst(l1_dst),        
    .l2_dst(l2_dst),        
    .mult_dst(mult_dst),    
    .src_pos(src_pos),      
    .src_dst(src_dst),      

    .next_pos(next_pos0),   
    .doc(doc_send0),        
    .state(umesh_state0)    
);
    

/* Routing Algorithm */
generate
    case ( `ROUTING_ALGORITHM )
    `XY_DOR : 
        begin
            routing_table_xy #(MY_XPOS, MY_YPOS) rt0(
                .next_pos(next_pos),
                .port(port)           
            );
        end
    `YX_DOR :
        begin
            routing_table_yx #(MY_XPOS, MY_YPOS) rt1(
                .next_pos(next_pos),
                .port(port)            
            );
        end
    endcase
endgenerate

endmodule