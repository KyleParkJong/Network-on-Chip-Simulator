`include "define.v"
`include "parameters.v"
module arb_roundrobin ( 
        u_req,        
        m_req, 
        grt,
        multab_ct,    
        clk, 
        rst_ 
);

input  [`PORT:0]  u_req;      // Unicast request
input  [`PORT:0]  m_req;      // Multicast request
input  [`PORT:0]  multab_ct;  // Multicast & Absorb contention
input             clk, rst_;
output [`PORT:0]  grt;    

reg [`PORT:0] grt0;

wire    [`PORTW:0]  pri0id;         /* client ID of the no.1 priority */ 
wire    [`PORTW:0]  pri1id;         /* client ID of the no.2 priority */ 
wire    [`PORTW:0]  pri2id;         /* client ID of the no.3 priority */ 
wire    [`PORTW:0]  pri3id;         /* client ID of the no.4 priority */ 
wire    [`PORTW:0]  pri4id;         /* client ID of the no.5 priority */

reg                    u_pri0grt;        /* enabled if pri0 is granted */ 
reg                    u_pri1grt;        /* enabled if pri1 is granted */ 
reg                    u_pri2grt;        /* enabled if pri2 is granted */ 
reg                    u_pri3grt;        /* enabled if pri3 is granted */ 
reg                    u_pri4grt;        /* enabled if pri4 is granted */

reg                    m_pri0grt;        /* enabled if pri0 is granted */ 
reg                    m_pri1grt;        /* enabled if pri1 is granted */ 
reg                    m_pri2grt;        /* enabled if pri2 is granted */ 
reg                    m_pri3grt;        /* enabled if pri3 is granted */ 
reg                    m_pri4grt;        /* enabled if pri4 is granted */

reg     [`PORTW:0]  pri [0:`PORT]; 

assign  pri0id  = (pri[0] == 0) ? 0 : (pri[1] == 0) ? 1 : (pri[2] == 0) ? 2 : (pri[3] == 0) ? 3 : 4;	// 0순위 port
assign  pri1id  = (pri[0] == 1) ? 0 : (pri[1] == 1) ? 1 : (pri[2] == 1) ? 2 : (pri[3] == 1) ? 3 : 4;	// 1순위 port
assign  pri2id  = (pri[0] == 2) ? 0 : (pri[1] == 2) ? 1 : (pri[2] == 2) ? 2 : (pri[3] == 2) ? 3 : 4;	// 2순위 port
assign  pri3id  = (pri[0] == 3) ? 0 : (pri[1] == 3) ? 1 : (pri[2] == 3) ? 2 : (pri[3] == 3) ? 3 : 4;	// 3순위 port
assign  pri4id  = (pri[0] == 4) ? 0 : (pri[1] == 4) ? 1 : (pri[2] == 4) ? 2 : (pri[3] == 4) ? 3 : 4;	// 4순위 port

// Round-robin
always @(*) begin
        if ( |m_req ) begin     // 하나라도 m_req 존재할 경우, Multicast 우선순위에 둠
            m_pri0grt <=  m_req[pri0id];  						                                             // 0순위 req 신호
            m_pri1grt <= ~m_req[pri0id] &  m_req[pri1id];  		                                             // 1순위 req 신호
            m_pri2grt <= ~m_req[pri0id] & ~m_req[pri1id] &  m_req[pri2id];  								 // 2순위 req 신호
            m_pri3grt <= ~m_req[pri0id] & ~m_req[pri1id] & ~m_req[pri2id] &  m_req[pri3id]; 				 // 3순위 req 신호
            m_pri4grt <= ~m_req[pri0id] & ~m_req[pri1id] & ~m_req[pri2id] & ~m_req[pri3id] &  m_req[pri4id]; // 4순위 req 신호

            if (pri0id == 0)
                grt0[0] <= ~multab_ct[0] & m_pri0grt;
            else if (pri1id == 0)
                grt0[0] <= ~multab_ct[0] & ~m_pri0grt & m_pri1grt;
            else if (pri2id == 0)
                grt0[0] <= ~multab_ct[0] & ~m_pri0grt & ~m_pri1grt & m_pri2grt;
            else if (pri3id == 0)
                grt0[0] <= ~multab_ct[0] & ~m_pri0grt & ~m_pri1grt & ~m_pri2grt & m_pri3grt;
            else if (pri4id == 0)
                grt0[0] <= ~multab_ct[0] & ~m_pri0grt & ~m_pri1grt & ~m_pri2grt & ~m_pri3grt & m_pri4grt;
            else
                grt0[0] <= `Disable;

            if (pri0id == 1)
                grt0[1] <= ~multab_ct[1] & m_pri0grt;
            else if (pri1id == 1)
                grt0[1] <= ~multab_ct[1] & ~m_pri0grt & m_pri1grt;
            else if (pri2id == 1)
                grt0[1] <= ~multab_ct[1] & ~m_pri0grt & ~m_pri1grt & m_pri2grt;
            else if (pri3id == 1)
                grt0[1] <= ~multab_ct[1] & ~m_pri0grt & ~m_pri1grt & ~m_pri2grt & m_pri3grt;
            else if (pri4id == 1)
                grt0[1] <= ~multab_ct[1] & ~m_pri0grt & ~m_pri1grt & ~m_pri2grt & ~m_pri3grt & m_pri4grt;
            else
                grt0[1] <= `Disable;

            if (pri0id == 2)
                grt0[2] <= ~multab_ct[2] & m_pri0grt;
            else if (pri1id == 2)
                grt0[2] <= ~multab_ct[2] & ~m_pri0grt & m_pri1grt;
            else if (pri2id == 2)
                grt0[2] <= ~multab_ct[2] & ~m_pri0grt & ~m_pri1grt & m_pri2grt;
            else if (pri3id == 2)
                grt0[2] <= ~multab_ct[2] & ~m_pri0grt & ~m_pri1grt & ~m_pri2grt & m_pri3grt;
            else if (pri4id == 2)
                grt0[2] <= ~multab_ct[2] & ~m_pri0grt & ~m_pri1grt & ~m_pri2grt & ~m_pri3grt & m_pri4grt;
            else
                grt0[2] <= `Disable;

            if (pri0id == 3)
                grt0[3] <= ~multab_ct[3] & m_pri0grt;
            else if (pri1id == 3)
                grt0[3] <= ~multab_ct[3] & ~m_pri0grt & m_pri1grt;
            else if (pri2id == 3)
                grt0[3] <= ~multab_ct[3] & ~m_pri0grt & ~m_pri1grt & m_pri2grt;
            else if (pri3id == 3)
                grt0[3] <= ~multab_ct[3] & ~m_pri0grt & ~m_pri1grt & ~m_pri2grt & m_pri3grt;
            else if (pri4id == 3)
                grt0[3] <= ~multab_ct[3] & ~m_pri0grt & ~m_pri1grt & ~m_pri2grt & ~m_pri3grt & m_pri4grt;
            else
                grt0[3] <= `Disable;

            if (pri0id == 4)
                grt0[4] <= ~multab_ct[4] & m_pri0grt;
            else if (pri1id == 4)
                grt0[4] <= ~multab_ct[4] & ~m_pri0grt & m_pri1grt;
            else if (pri2id == 4)
                grt0[4] <= ~multab_ct[4] & ~m_pri0grt & ~m_pri1grt & m_pri2grt;
            else if (pri3id == 4)
                grt0[4] <= ~multab_ct[4] & ~m_pri0grt & ~m_pri1grt & ~m_pri2grt & m_pri3grt;
            else if (pri4id == 4)
                grt0[4] <= ~multab_ct[4] & ~m_pri0grt & ~m_pri1grt & ~m_pri2grt & ~m_pri3grt & m_pri4grt;
            else
                grt0[4] <= `Disable;

        end 
        else begin
            u_pri0grt <=  u_req[pri0id];  						                                                // 0순위 req 신호
            u_pri1grt <= ~u_req[pri0id] &  u_req[pri1id];                                                   	// 1순위 req 신호
            u_pri2grt <= ~u_req[pri0id] & ~u_req[pri1id] &  u_req[pri2id];  								    // 2순위 req 신호
            u_pri3grt <= ~u_req[pri0id] & ~u_req[pri1id] & ~u_req[pri2id] &  u_req[pri3id]; 					// 3순위 req 신호
            u_pri4grt <= ~u_req[pri0id] & ~u_req[pri1id] & ~u_req[pri2id] & ~u_req[pri3id] &  u_req[pri4id];	// 4순위 req 신호

            if (pri0id == 0)
                grt0[0] <= u_pri0grt;
            else if (pri1id == 0)
                grt0[0] <= ~u_pri0grt & u_pri1grt;
            else if (pri2id == 0)
                grt0[0] <= ~u_pri0grt & ~u_pri1grt & u_pri2grt;
            else if (pri3id == 0)
                grt0[0] <= ~u_pri0grt & ~u_pri1grt & ~u_pri2grt & u_pri3grt;
            else if (pri4id == 0)
                grt0[0] <= ~u_pri0grt & ~u_pri1grt & ~u_pri2grt & ~u_pri3grt & u_pri4grt;
            else
                grt0[0] <= `Disable;

            if (pri0id == 1)
                grt0[1] <= u_pri0grt;
            else if (pri1id == 1)
                grt0[1] <= ~u_pri0grt & u_pri1grt;
            else if (pri2id == 1)
                grt0[1] <= ~u_pri0grt & ~u_pri1grt & u_pri2grt;
            else if (pri3id == 1)
                grt0[1] <= ~u_pri0grt & ~u_pri1grt & ~u_pri2grt & u_pri3grt;
            else if (pri4id == 1)
                grt0[1] <= ~u_pri0grt & ~u_pri1grt & ~u_pri2grt & ~u_pri3grt & u_pri4grt;
            else
                grt0[1] <= `Disable;

            if (pri0id == 2)
                grt0[2] <= u_pri0grt;
            else if (pri1id == 2)
                grt0[2] <= ~u_pri0grt & u_pri1grt;
            else if (pri2id == 2)
                grt0[2] <= ~u_pri0grt & ~u_pri1grt & u_pri2grt;
            else if (pri3id == 2)
                grt0[2] <= ~u_pri0grt & ~u_pri1grt & ~u_pri2grt & u_pri3grt;
            else if (pri4id == 2)
                grt0[2] <= ~u_pri0grt & ~u_pri1grt & ~u_pri2grt & ~u_pri3grt & u_pri4grt;
            else
                grt0[2] <= `Disable;

            if (pri0id == 3)
                grt0[3] <= u_pri0grt;
            else if (pri1id == 3)
                grt0[3] <= ~u_pri0grt & u_pri1grt;
            else if (pri2id == 3)
                grt0[3] <= ~u_pri0grt & ~u_pri1grt & u_pri2grt;
            else if (pri3id == 3)
                grt0[3] <= ~u_pri0grt & ~u_pri1grt & ~u_pri2grt & u_pri3grt;
            else if (pri4id == 3)
                grt0[3] <= ~u_pri0grt & ~u_pri1grt & ~u_pri2grt & ~u_pri3grt & u_pri4grt;
            else
                grt0[3] <= `Disable;

            if (pri0id == 4)
                grt0[4] <= u_pri0grt;
            else if (pri1id == 4)
                grt0[4] <= ~u_pri0grt & u_pri1grt;
            else if (pri2id == 4)
                grt0[4] <= ~u_pri0grt & ~u_pri1grt & u_pri2grt;
            else if (pri3id == 4)
                grt0[4] <= ~u_pri0grt & ~u_pri1grt & ~u_pri2grt & u_pri3grt;
            else if (pri4id == 4)
                grt0[4] <= ~u_pri0grt & ~u_pri1grt & ~u_pri2grt & ~u_pri3grt & u_pri4grt;
            else
                grt0[4] <= `Disable;
        end
end


always @ (posedge clk) begin 
	if (rst_ == `Enable_) begin 
		pri[`PRI_0]  <= 0;           /* client0's initial priority */  // Left:port, Right:priority
		pri[`PRI_1]  <= 1;           /* client1's initial priority */ 
		pri[`PRI_2]  <= 2;           /* client2's initial priority */ 
		pri[`PRI_3]  <= 3;           /* client3's initial priority */ 
		pri[`PRI_4]  <= 4;           /* client4's initial priority */ 
	end else if (grt[0]) begin 
		pri[0]  <= `PORT;  // `PORT = 4
		if (pri[1] > pri[0]) pri[1]     <= pri[1] - 1; 
		if (pri[2] > pri[0]) pri[2]     <= pri[2] - 1; 
		if (pri[3] > pri[0]) pri[3]     <= pri[3] - 1; 
		if (pri[4] > pri[0]) pri[4]     <= pri[4] - 1; 
	end else if (grt[1]) begin 
		if (pri[0] > pri[1]) pri[0]     <= pri[0] - 1; 
		pri[1]  <= `PORT;
		if (pri[2] > pri[1]) pri[2]     <= pri[2] - 1; 
		if (pri[3] > pri[1]) pri[3]     <= pri[3] - 1; 
		if (pri[4] > pri[1]) pri[4]     <= pri[4] - 1; 
	end else if (grt[2]) begin 
		if (pri[0] > pri[2]) pri[0]     <= pri[0] - 1; 
		if (pri[1] > pri[2]) pri[1]     <= pri[1] - 1; 
		pri[2]  <= `PORT;
		if (pri[3] > pri[2]) pri[3]     <= pri[3] - 1; 
		if (pri[4] > pri[2]) pri[4]     <= pri[4] - 1; 
	end else if (grt[3]) begin 
		if (pri[0] > pri[3]) pri[0]     <= pri[0] - 1; 
		if (pri[1] > pri[3]) pri[1]     <= pri[1] - 1; 
		if (pri[2] > pri[3]) pri[2]     <= pri[2] - 1; 
		pri[3]  <= `PORT;
		if (pri[4] > pri[3]) pri[4]     <= pri[4] - 1; 
	end else if (grt[4]) begin 
		if (pri[0] > pri[4]) pri[0]     <= pri[0] - 1; 
		if (pri[1] > pri[4]) pri[1]     <= pri[1] - 1; 
		if (pri[2] > pri[4]) pri[2]     <= pri[2] - 1; 
		if (pri[3] > pri[4]) pri[3]     <= pri[3] - 1; 
		pri[4]  <= `PORT;
	end 
end 

assign grt = grt0;

endmodule