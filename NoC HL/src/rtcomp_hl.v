`include "define.v" 
`include "parameters.v" 
module rtcomp_hl (
	bdata0,
	en,

	ovch,
	port,
	doc_send,
	doc_remain,
	umesh_state,
	multab_en,

	clk,
	rst_
);

parameter MY_XPOS = 0;
parameter MY_YPOS = 0;

input	[`DATAW:0]	bdata0;
input				en;

output	[`VCHW:0]		ovch;
output	[`PORTW:0]		port;
output	[`MADDR:0]		doc_send;
output	[`MADDR:0]		doc_remain;
output 	[1:0]			umesh_state;
output	[`DSTATUS:0]	multab_en;	// 2bits

input	clk;
input	rst_;

wire	[`PORTW:0]		port0;
reg		[`PORTW:0]		port1;

wire	[`VCHW:0]		ovch0;
reg		[`VCHW:0]		ovch1;

wire	[`DSTATUS:0]	multab_en0;
reg		[`DSTATUS:0]	multab_en1;

wire [1:0] umesh_state0;
reg  [1:0] umesh_state1;

wire				um_type;
wire	[`UADDR:0]	addr0;
wire	[`MADDR:0]	addr1;
wire 	[`MSRC_BW:0] src_dst;
wire 	[1:0]		src_pos;

/* Data Split */
assign	um_type = bdata0[`UM_TYPE];
assign	addr0 = bdata0[`UM_TYPE] ? `DATAW_P1'b0 : bdata0[`DST_LSB+4:`DST_LSB];
assign	addr1 = bdata0[`UM_TYPE] ? bdata0[`MDST_MSB:`MDST_LSB] : `DATAW_P1'b0;
assign  src_dst = bdata0[`MSRC_MSB:`MSRC_LSB];

/* Source Position table */
src_pos_table u1 (
	.src_dst(src_dst),
	.src_pos(src_pos)
);

/* Binary & One-hot Decoder*/
dec_hl #(MY_XPOS, MY_YPOS) d0 (
		.um_type(um_type),
		.uni_dst(addr0),
		.mult_dst(addr1),
		.src_pos(src_pos),

		.port(port0),
		.doc_send(doc_send),
		.doc_remain(doc_remain),
		.umesh_state(umesh_state0),
		.multab_en(multab_en0)
);

/* Port Out*/
assign	port		= en ? port0 : port1;
assign	ovch		= en ? ovch0 : ovch1;
assign  multab_en 	= en ? multab_en0 : multab_en1;
assign  umesh_state = en ? umesh_state0 : umesh_state1;

/* The same virtual channel is used. */
assign ovch0	= bdata0[`VCH_MSB:`VCH_LSB];

/* Sequence Logic */
always @ (posedge clk) begin
	if (rst_ == `Enable_) begin 
		port1	<= 0;
		ovch1	<= 0;
		multab_en1 <= 0;
		umesh_state1 <= 0;
	end else if (en) begin
		port1	<= port0;
		ovch1	<= ovch0;
		multab_en1 <= multab_en0;
		umesh_state1 <= umesh_state0;
	end
end

endmodule