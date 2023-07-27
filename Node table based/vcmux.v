`include "define.h" 
module vcmux ( 
        ovalid0, 

        odata0, 

        ovch0, 

        req0, 

        port0, 

        ovalid, 
        odata,  
        ovch,   
        req,    
        port,   
        vcsel,  

        clk,    
        rst_    
);
input                   ovalid0; 

input   [`DATAW:0]      odata0; 

input   [`VCHW:0]       ovch0; 

input                   req0; 

input   [`PORTW:0]      port0; 

output                  ovalid; 
output  [`DATAW:0]      odata;  
output  [`VCHW:0]       ovch;   
output                  req;    
output  [`PORTW:0]      port;   
output  [`VCH:0]        vcsel;  

input   clk, rst_; 

// VC안쓰므로 모두 1bit 표현
reg    [`VCH:0]         last;   
wire   [`VCH:0]         grt;    
wire   [`VCH:0]         hold;   
wire                    anyhold;

assign  hold    = last & {req0}; //request는 vc.v에서 들어옴(Enable되고 last가 1이라면 hold 동작)
assign  anyhold = |hold; //축약연산자로 or연산을 의미
assign  vcsel   = grt;  

// rst_는 전송시작되면 계속 1, 이후에는 last != grt만 동작
always @ (posedge clk) begin          
        if (rst_ == `Enable_)         
                last    <= `VCH_P1'b0; 
        else if (last != grt)         
                last    <= grt;       
end                                   

assign  grt[0]  = anyhold ? hold[0] : ( req0); //hold, anyhold 조절 위해 먼저 1로 바뀌는 역할

assign  ovalid  = ovalid0;
assign  req     = req0;

// 결국 last가 1이 되어야 각 data전송, vcsel(grt)를 통해 port0가 활성화(req0)신호와 거의 엇비슷하게 가므로 vc.v에서 전송 ok가 들어오면 port 선정해줌
// 전송이 불가능 할때는 무조건 다 0으로 통일되어 있음
assign  odata   = 
                  (last[0] == `Enable) ? odata0 : `DATAW_P1'b0;
assign  ovch    = 
                  (last[0] == `Enable) ? ovch0 : `VCHW_P1'b0;
assign  port    = 
                  (vcsel[0] == `Enable) ? port0 : `PORTW_P1'b0;
endmodule
