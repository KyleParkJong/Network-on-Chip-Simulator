`include "define.h" 
module arb ( 
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

// Fixed priority
always @(*) begin
        if ( |m_req ) begin     // 하나라도 m_req 존재할 경우, Multicast 우선순위에 둠
            grt0[4] <= ~multab_ct[4] &  m_req[4];
            grt0[3] <= ~multab_ct[3] & (m_req[4] == 0) & m_req[3];
            grt0[0] <= ~multab_ct[0] & (m_req[4] == 0 && m_req[3] == 0) & m_req[0];
            grt0[1] <= ~multab_ct[1] & (m_req[4] == 0 && m_req[3] == 0 && m_req[0] == 0) & m_req[1];  
            grt0[2] <= ~multab_ct[2] & (m_req[4] == 0 && m_req[3] == 0 && m_req[0] == 0 && m_req[1] == 0) & m_req[2]; 
        end 
        else begin
            grt0[4] <=  u_req[4];
            grt0[3] <= (u_req[4] == 0) & u_req[3];
            grt0[0] <= (u_req[4] == 0 && u_req[3] == 0) & u_req[0];
            grt0[1] <= (u_req[4] == 0 && u_req[3] == 0 && u_req[0] == 0) & u_req[1];  
            grt0[2] <= (u_req[4] == 0 && u_req[3] == 0 && u_req[0] == 0 && u_req[1] == 0) & u_req[2]; 
        end
end

assign grt = grt0;

endmodule


