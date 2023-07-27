`include "define.h" 
module muxcont ( 
        port_0,   
        req_0,    

        port_1,   
        req_1,    

        port_2,   
        req_2,    

        port_3,   
        req_3,    

        port_4,   
        req_4,    

        sel, 
        grt, 

        clk, 
        rst_ 
);
parameter       PORTID = 0;     // 고유 포트 번호

input  [`PORTW:0] port_0;   
input             req_0;    

input  [`PORTW:0] port_1;   
input             req_1;    

input  [`PORTW:0] port_2;   
input             req_2;    

input  [`PORTW:0] port_3;   
input             req_3;    

input  [`PORTW:0] port_4;   
input             req_4;    

<<<<<<< HEAD
<<<<<<< HEAD
input  [`DSTATUS:0] multab_0;
input  [`DSTATUS:0] multab_1;
input  [`DSTATUS:0] multab_2;
input  [`DSTATUS:0] multab_3;
input  [`DSTATUS:0] multab_4;

=======
>>>>>>> parent of 558ce32 (7.25 version)
output [`PORT:0]  sel;          
output [`PORT:0]  grt;          

input  [`PORT:0]  multab_ct;
=======
/* Output */
output [`PORT:0]  sel;          // MUX sel 신호 출력
output [`PORT:0]  grt;          // MUX grant 신호 출력
>>>>>>> parent of 66a1952 (7.20 version)

input             clk, rst_; 

reg    [`PORT:0]  last; 
wire   [`PORT:0]  req;  
wire   [`PORT:0]  grt0; 
wire   [`PORT:0]  hold; 
wire              anyhold;
<<<<<<< HEAD
<<<<<<< HEAD
wire              multab_en;

assign multab_en = ((multab_0[1]) |          // Multicast check
                    (multab_1[1]) |
                    (multab_2[1]) |
                    (multab_3[1]) |
                    (multab_4[1]) );
   
/* Request logic 
 * : Multicast 1st priority 
 */
assign  req[0]  = multab_en ? (multab_0[1] & req_0 & (port_0 == PORTID)) : (req_0 & (port_0 == PORTID)); 
assign  req[1]  = multab_en ? (multab_1[1] & req_1 & (port_1 == PORTID)) : (req_1 & (port_1 == PORTID)); 
assign  req[2]  = multab_en ? (multab_2[1] & req_2 & (port_2 == PORTID)) : (req_2 & (port_2 == PORTID)); 
assign  req[3]  = multab_en ? (multab_3[1] & req_3 & (port_3 == PORTID)) : (req_3 & (port_3 == PORTID)); 
assign  req[4]  = multab_en ? (multab_4[1] & req_4 & (port_4 == PORTID)) : (req_4 & (port_4 == PORTID));
=======
=======
   
/* Request */
assign  req[0]  = req_0 & (port_0 == PORTID); 
assign  req[1]  = req_1 & (port_1 == PORTID); 
assign  req[2]  = req_2 & (port_2 == PORTID); 
assign  req[3]  = req_3 & (port_3 == PORTID); 
assign  req[4]  = req_4 & (port_4 == PORTID); 
>>>>>>> parent of 558ce32 (7.25 version)


// 자기 PORTID 에 해당되는 포트만 req 확인
// One Hot Encoding : inject/서/남/동/북 ([4:0])       
/* Request */
assign  req[0]  = req_0 & (port_0 == PORTID); 
assign  req[1]  = req_1 & (port_1 == PORTID); 
assign  req[2]  = req_2 & (port_2 == PORTID); 
assign  req[3]  = req_3 & (port_3 == PORTID); 
assign  req[4]  = req_4 & (port_4 == PORTID); 
>>>>>>> parent of 66a1952 (7.20 version)

assign  hold    = last & req; // request, grant 둘 다 되었는지 확인 (bit 연산자 : 00001 -> 0번 포트 grt & req)
assign  anyhold = |hold;      // 하나라도 포트 hold 된 것이 있으면 anyhold = 1
assign  sel     = last;       // 직전에 grant된 포트

always @ (posedge clk) begin 
        if (rst_ == `Enable_) 
                last    <= `PORT_P1'b0; 
        else if (last != grt)       // 직전에 grant된 포트값 저장        
                last    <= grt;
        else
                last    <= last;     
end 

/* Grant */
// 한번 Granted 된 것은 Request가 종료될때까지 Grant 할당한다.
// Request가 종료 시 Arbiter로부터 결정된 새로운 Grant 사용
// 맨 처음에는 last=5'b00000 -> anyhold=5b'00000
assign  grt[0]  = anyhold ? hold[0] : grt0[0]; 
assign  grt[1]  = anyhold ? hold[1] : grt0[1]; 
assign  grt[2]  = anyhold ? hold[2] : grt0[2]; 
assign  grt[3]  = anyhold ? hold[3] : grt0[3]; 
assign  grt[4]  = anyhold ? hold[4] : grt0[4]; 

/*                     
 * Arbiter             
 */                    
arb a0 (               
        .req ( req  ),          // input
        .grt ( grt0 ),          // output
        .clk ( clk  ), 
        .rst_( rst_ )
);                     

endmodule
