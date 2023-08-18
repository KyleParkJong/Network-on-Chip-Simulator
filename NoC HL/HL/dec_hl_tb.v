`timescale 1ns/1ps
`include "define.v"
`include "parameters.v"

module dec_hl_tb();

    `include "functions.sv"
    
	reg um_type;
	reg [4:0] uni_dst;
	reg [19:0] mult_dst;
	reg [1:0] src_pos;

	wire [2:0] port1;
	wire [19:0] doc_send1;
	wire [19:0] doc_remain1;
	wire [1:0] umesh_state1;
	wire [1:0] multab_en1;
    
    wire [2:0] port4;
	wire [19:0] doc_send4;
	wire [19:0] doc_remain4;
	wire [1:0] umesh_state4;
	wire [1:0] multab_en4;
    
    wire [2:0] port7;
	wire [19:0] doc_send7;
	wire [19:0] doc_remain7;
	wire [1:0] umesh_state7;
	wire [1:0] multab_en7;
    
    // Router 1 (0,1)
	dec_hl #(
		.MY_XPOS(0),
		.MY_YPOS(1)
	) dec1 (
		.um_type(um_type),
		.uni_dst(uni_dst),
		.mult_dst(mult_dst),
		.src_pos(src_pos),

		.port(port1),
		.doc_send(doc_send1),
		.doc_remain(doc_remain1),
		.umesh_state(umesh_state1),
		.multab_en(multab_en1)
	);
	
	// Router 4 (1,0)
	dec_hl #(
		.MY_XPOS(1),
		.MY_YPOS(0)
	) dec4 (
		.um_type(um_type),
		.uni_dst(uni_dst),
		.mult_dst(mult_dst),
		.src_pos(src_pos),

		.port(port4),
		.doc_send(doc_send4),
		.doc_remain(doc_remain4),
		.umesh_state(umesh_state4),
		.multab_en(multab_en4)
	);

	// Router 7 (1,3)
	dec_hl #(
		.MY_XPOS(1),
		.MY_YPOS(3)
	) dec7 (
		.um_type(um_type),
		.uni_dst(uni_dst),
		.mult_dst(mult_dst),
		.src_pos(src_pos),

		.port(port7),
		.doc_send(doc_send7),
		.doc_remain(doc_remain7),
		.umesh_state(umesh_state7),
		.multab_en(multab_en7)
	);


	initial begin
        
		um_type <= 1;
		uni_dst <= 0;
		mult_dst <= 20'b1010_1101_1110_1001_0100;
		src_pos <= 2'b01; // Qudrant 2
		
	   #5

		$write ("<< Phase 1 >> \n");
		$write ("dst port    : %d \n", port1);
		$write ("doc send    : %b \n\n", doc_send1);
		$write ("doc remain  : %b \n", doc_remain1);
		$write ("umesh state : %d \n", umesh_state1);
		$write ("multab_en   : %d \n", multab_en1);

        #5

		mult_dst <= doc_send1;

		$write ("<< Phase 2 >> \n");
		$write ("dst port    : %d \n", port4);
		$write ("doc send    : %b \n\n", doc_send4);
		$write ("doc remain  : %b \n", doc_remain4);
		$write ("umesh state : %d \n", umesh_state4);
		$write ("multab_en   : %d \n", multab_en4);

		#5

		mult_dst <= doc_remain4;
		
		$write ("<< Phase 3 >> \n");
		$write ("dst port    : %d \n", port4);
		$write ("doc send    : %b \n\n", doc_send4);
		$write ("doc remain  : %b \n", doc_remain4);
		$write ("umesh state : %d \n", umesh_state4);
		$write ("multab_en   : %d \n", multab_en4);

		#5

		mult_dst <= doc_send4;
		
		$write ("<< Phase 4 >> \n");
		$write ("dst port    : %d \n", port7);
		$write ("doc send    : %b \n\n", doc_send7);
		$write ("doc remain  : %b \n", doc_remain7);
		$write ("umesh state : %d \n", umesh_state7);
		$write ("multab_en   : %d \n", multab_en7);

		$finish;

	end


endmodule