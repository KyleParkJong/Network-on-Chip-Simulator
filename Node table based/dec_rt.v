`include "define.h" 
module dec_rt (
	um_type,
	addr0,
	addr1,
	port,
	addr1_rm,
	fwdab_en
);

/* Parameters */
parameter  MY_XPOS = 0;
parameter  MY_YPOS = 0;
localparam MY_POS  = MY_XPOS*4+MY_YPOS;

input	    		um_type;
input	[`UADDR:0]	addr0;
input	[`MADDR:0]	addr1;

output	[`PORTW:0]	port;
output	reg [`MADDR:0]	addr1_rm;
output	reg         	fwdab_en;

reg	    [2:0]	        dst_xpos;   // 3bits
reg	    [1:0]	        dst_ypos;   // 2bits
reg		[`NODEW_P1:0]	next_pos;

integer	i;
integer continue;

/* One-Hot encoding decoder */
always @ (*) begin
    if (um_type == 1) begin
        if (addr1[MY_POS] == 1) begin	// Absorb
            addr1_rm = addr1;
            addr1_rm[MY_POS] = 0;
            continue = 0;
            for(i = 4; ((i < 20) && (continue == 0)); i = i + 4) begin
                if((addr1[MY_POS+i] == 1)) begin    //  Forward & Absorb
                    fwdab_en = 1;
                    next_pos = MY_POS + i;
                    dst_xpos = next_pos[`NODEW_P1:2];
                    dst_ypos = next_pos[1:0];
                    continue = 1;
                end
                else begin
                    fwdab_en = 0;
                    dst_xpos = MY_XPOS;
                    dst_ypos = MY_YPOS;
                end
            end
        end
        else begin		// Forward
            fwdab_en = 0;
            continue = 0;
            addr1_rm = addr1;
            for(i = 1; (( i < 20) && (continue==0)); i = i+1) begin
                if((addr1[MY_POS+i] == 1) && (MY_POS < 20-i)) begin
                    next_pos = MY_POS+i;
                    dst_xpos = next_pos[`NODEW_P1:2];
                    dst_ypos = next_pos[1:0];
                    continue = 1;
                end
                else begin
                    dst_xpos = MY_XPOS;
                    dst_ypos = MY_YPOS;
                end
            end
        end
    end

/* Binary encoder (Unicast) */
	else begin      
        fwdab_en = 0;
        addr1_rm = 0;
        dst_xpos = addr0[`NODEW_P1:2];
        dst_ypos = addr0[1:0];
	end
end

routing_table #(MY_XPOS, MY_YPOS) u0(
    .mdst_xpos(dst_xpos),  // 3bits
    .mdst_ypos(dst_ypos),  // 2bits
    .port(port)            // output
);

endmodule