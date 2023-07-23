`include "define.h" 
module rtcomp (
	bdata0,
	en,
	port,
	ovch,
	addr1_rm,
	multab_en,

	clk,
	rst_
);

parameter MY_XPOS = 0;
parameter MY_YPOS = 0;

input	[`DATAW:0]	bdata0;
input				en;

output	[`PORTW:0]	port;
output	[`VCHW:0]	ovch;
output	[`MADDR:0]	addr1_rm;
output				multab_en;

input	clk;
input	rst_;

wire	[`PORTW:0]	port0;
reg		[`PORTW:0]	port1;
wire	[`VCHW:0]	ovch0;
reg		[`VCHW:0]	ovch1;
wire				multab_en0;
reg					multab_en1;

wire				um_type;
wire	[`UADDR:0]	addr0;
wire	[`MADDR:0]	addr1;

/* Data Split*/
assign	um_type = bdata0[`UM_TYPE];
assign	addr0 = bdata0[`UM_TYPE] ? `DATAW_P1'b0 : bdata0[`DST_MSB:`DST_LSB];
assign	addr1 = bdata0[`UM_TYPE] ? bdata0[`MDST_MSB:`MDST_LSB] : `DATAW_P1'b0;

/* Binary & One-hot Decoder*/
dec_rt #(MY_XPOS, MY_YPOS) d0 (
		.um_type(um_type),
		.addr0(addr0),
		.addr1(addr1),
		.port(port0),
		.addr1_rm(addr1_rm),
		.multab_en(multab_en0)
);

/* Port Out*/
assign	port		= en ? port0 : port1;
assign	ovch		= en ? ovch0 : ovch1;
assign  multab_en 	= en ? multab_en0 : multab_en1;

/* The same virtual channel is used. */
assign ovch0	= bdata0[`VCH_MSB:`VCH_LSB];

/* Sequence Logic */
always @ (posedge clk) begin
	if (rst_ == `Enable_) begin 
		port1	<= 0;
		ovch1	<= 0;
		multab_en1 <= 0;
	end else if (en) begin
		port1	<= port0;
		ovch1	<= ovch0;
		multab_en1 <= multab_en0;
	end
end

endmodule
