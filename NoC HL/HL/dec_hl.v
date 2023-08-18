`include "define.v"
`include "parameters.v"

module dec_hl (
	um_type,
	uni_dst,
	mult_dst,
    src_pos,

	port,
    doc_send,      // send되는 doc 정보
    doc_remain,    // FIFO로 다시 들어가는 doc 정보
    umesh_state,   // Umesh state (4종류)
	multab_en
);

`include "functions.sv"

/* Parameters */
parameter  MY_XPOS = 0;
parameter  MY_YPOS = 0;
localparam MY_POS  = MY_XPOS*4+MY_YPOS;

/* I/O */
input um_type;
input [4:0] uni_dst;
input [19:0] mult_dst;
input [1:0] src_pos;

output     [2:0]    port;
output reg [19:0]   doc_send;
output reg [19:0]   doc_remain;
output reg [1:0]    umesh_state;
output reg [1:0]    multab_en;

/* Variables */
reg	    [2:0]	        dst_xpos;      
reg	    [1:0]	        dst_ypos;      
reg		[`NODEW:0]	    next_pos;

reg [19:0] l1_dst;        // L1 destinations
reg [19:0] l1_send;       // L1 destinations
reg [19:0] l2_dst;

wire [4:0]  next_pos0;    // binary dst (Center of doc)
wire [19:0] doc_send0;    // Dimension-Chain order (Half doc to be sent)
wire [1:0] umesh_state0;
 
integer l1_num, l2_num;
integer i;
integer flag;
integer up, down;

always @(*) begin
    if (um_type == 0) begin     /* Unicast */
        umesh_state = `UMESH_UNI;
        dst_xpos = uni_dst[`NODEW:2];
        dst_ypos = uni_dst[1:0];
        multab_en = `UNICAST;
        doc_send = 0;
        doc_remain = 0;
    end
    else begin      /* Multicast */

        // Finding L1, L2 dst
        l1_dst = find_l1(mult_dst, src_pos);
        l2_dst = find_l2(l1_dst, src_pos);
        l1_num = count_dst(l1_dst);
        l2_num = count_dst(l2_dst);

        // From module : u_mesh_algorithm.v 
        dst_xpos = next_pos0[`NODEW:2];
        dst_ypos = next_pos0[1:0];
        doc_send = doc_send0;
        doc_remain = doc_send0 ^ mult_dst;      // MULT_ROW 일 경우 의미 X
        umesh_state = umesh_state0;

        // multab_en signal
        if ((mult_dst[MY_POS] == 1) && (umesh_state0 == `UMESH_MULT_ROW))   // Row로 뿌려줄때만 MULTABS 
            multab_en = `MULTABS;
        else
            multab_en = `MULTFWD;
        
    end
end 

u_mesh_algorithm #(MY_XPOS, MY_YPOS) u_mesh (
    .l1_dst(l1_dst),        // input 
    .l2_dst(l2_dst),        // input
    .mult_dst(mult_dst),    // input
    .src_pos(src_pos),      // input
    .next_pos(next_pos0),   // output : Half doc 정보를 Unicast로 보낼 dst 정보
    .doc(doc_send0),        // output : Half doc to send
    .state(umesh_state0)    // output : 현재 단계
);
    

/* Routing Algorithm */
generate
    case ( `ROUTING_ALGORITHM )
    `XY_DOR : 
        begin
            routing_table_xy #(MY_XPOS, MY_YPOS) rt0(
                .mdst_xpos(dst_xpos),  // 3bits
                .mdst_ypos(dst_ypos),  // 2bits
                .port(port)            // output
            );
        end
    `YX_DOR :
        begin
            routing_table_yx #(MY_XPOS, MY_YPOS) rt0(
                .mdst_xpos(dst_xpos),  
                .mdst_ypos(dst_ypos),  
                .port(port)            
            );
        end
    endcase
endgenerate

endmodule