`include "define.h" 
module vc ( 
        bdata,  
        send,   
        olck,   

        irdy_0, 
        irdy_1, 
        irdy_2, 
        irdy_3, 
        irdy_4, 
        ilck_0, 
        ilck_1, 
        ilck_2, 
        ilck_3, 
        ilck_4, 

        grt_0, 
        grt_1, 
        grt_2, 
        grt_3, 
        grt_4,

        fwdab_en, 

        req,  
        port, 
        ovch, 

        clk, 
        rst_ 
);
parameter       ROUTERID= 0;
parameter       PCHID   = 0;
parameter       VCHID   = 0;

input   [`DATAW:0]      bdata;  
output                  send;   
output                  olck;   

input   [`VCH:0]        irdy_0; 
input   [`VCH:0]        irdy_1; 
input   [`VCH:0]        irdy_2; 
input   [`VCH:0]        irdy_3; 
input   [`VCH:0]        irdy_4; 
input   [`VCH:0]        ilck_0; 
input   [`VCH:0]        ilck_1; 
input   [`VCH:0]        ilck_2; 
input   [`VCH:0]        ilck_3; 
input   [`VCH:0]        ilck_4; 

input                   grt_0; 
input                   grt_1; 
input                   grt_2; 
input                   grt_3; 
input                   grt_4; 

<<<<<<< HEAD
input   [`DSTATUS:0]    multab_en;
=======
input   [`FWDAB:0]     fwdab_en;
>>>>>>> parent of 66a1952 (7.20 version)

output                  req;  
input   [`PORTW:0]      port; 
input   [`VCHW:0]       ovch;

input   clk, rst_;            


reg     [1:0]           state;
wire    [`TYPEW:0]      btype;  //2bit
reg                     req;     /* Request signal */
wire                    ilck;    /* 1: Next VC is locked by others */
wire                    grt;	 /* 1: Output channel is allocated */
wire                    irdy;	 /* 1: Next VC can receive a flit  */ 
reg                     send;


/*
 * State machine
 */
`define RC_STAGE      2'b00
`define VSA_STAGE     2'b01
`define ST_STAGE      2'b10

/*  
 * Input flit type 
 */ 
assign  btype   = bdata[`TYPE_MSB:`TYPE_LSB]; 

/*  
 * Packet-level arbitration 
 * ilck from outputc.v, 
 */ 
assign  ilck    = ( 
                   ((port == 0) && ilck_0[ovch]) || 
                   ((port == 1) && ilck_1[ovch]) || 
                   ((port == 2) && ilck_2[ovch]) || 
                   ((port == 3) && ilck_3[ovch]) || 
<<<<<<< HEAD
                   (((port == 4) || (multab_en == `MULTABS)) && ilck_4[ovch]) ); 
=======
                   ((port == 4) && ilck_4[ovch]) ||
                   (fwdab_en && ilck_4[ovch]) ); 
>>>>>>> parent of 66a1952 (7.20 version)

/*  
 * Flit-level transmission control
 * grt - from cb.v, ouputchannel allocation
 * irdy - VC lock? from outputc.v
 */ 
assign  grt     = ( 
                   ((port == 0) && grt_0) || 
                   ((port == 1) && grt_1) || 
                   ((port == 2) && grt_2) || 
                   ((port == 3) && grt_3) || 
                   ((port == 4) && grt_4) ); 
assign  irdy    = ( 
                   ((port == 0) && irdy_0[ovch]) || 
                   ((port == 1) && irdy_1[ovch]) || 
                   ((port == 2) && irdy_2[ovch]) || 
                   ((port == 3) && irdy_3[ovch]) || 
                   ((port == 4) && irdy_4[ovch]) ); 

assign  olck    = (state != `RC_STAGE); // VSA, ST


/*
 * State transition control
 */
always @ (posedge clk) begin
	if (rst_ == `Enable_) begin
		state	<= `RC_STAGE;
		send	<= `Disable;
		req	<= `Disable;
	end else begin
		case (state)

		/*
		 * State 1 : Routing computation
		 */
		`RC_STAGE: begin
			if (btype == `TYPE_HEAD ||
			    btype == `TYPE_HEADTAIL) begin
				state	<= `VSA_STAGE;
				send	<= `Disable;
				req	<= `Enable;
			end
		end

                /*
                 * State 2 : Virtual channel / switch allocation
                 */
                `VSA_STAGE: begin
			if (ilck == `Enable) begin
                        	/* Switch is locked (unable to start 
				   the arbitration) */
				req     <= `Disable;
			end if (grt == `Disable) begin
                        	/* Switch is not locked but it is not 
				   allocated */
				req     <= `Enable;
			end if (irdy == `Enable && grt == `Enable) begin
                        	/* Switch is allocated and it is free!  */
                                state   <= `ST_STAGE;
				send	<= `Enable;
				req     <= `Enable;
			end
                end

                /*
                 * State 3 : Switch Traversal,
                 */
		`ST_STAGE: begin
			if (btype == `TYPE_HEADTAIL || 
			    btype == `TYPE_TAIL) begin
				state	<= `RC_STAGE;
				send	<= `Disable;
				req	<= `Disable;
			end
		end
		endcase
	end
end

endmodule
