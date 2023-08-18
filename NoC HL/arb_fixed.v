`include "define.v"
`include "parameters.v"
module arb_fixed ( 
        u_req,        
        m_req, 
        grt,
        multab_ct   
);


input  [`PORT:0]  u_req;      // Unicast request
input  [`PORT:0]  m_req;      // Multicast request
input  [`PORT:0]  multab_ct;  // Multicast & Absorb contention
output [`PORT:0]  grt;    

reg [`PORT:0] grt0;

// Fixed priority
always @(*) begin
        if ( |m_req ) begin     // 하나라도 m_req 존재할 경우, Multicast 우선순위에 둠
            grt0[`PRI_0] <= ~multab_ct[`PRI_0] &  m_req[`PRI_0];
            grt0[`PRI_1] <= ~multab_ct[`PRI_1] & (m_req[`PRI_0] == 0) & m_req[`PRI_1];
            grt0[`PRI_2] <= ~multab_ct[`PRI_2] & (m_req[`PRI_0] == 0 && m_req[`PRI_1] == 0) & m_req[`PRI_2];
            grt0[`PRI_3] <= ~multab_ct[`PRI_3] & (m_req[`PRI_0] == 0 && m_req[`PRI_1] == 0 && m_req[`PRI_2] == 0) & m_req[`PRI_3];  
            grt0[`PRI_4] <= ~multab_ct[`PRI_4] & (m_req[`PRI_0] == 0 && m_req[`PRI_1] == 0 && m_req[`PRI_2] == 0 && m_req[`PRI_3] == 0) & m_req[`PRI_4]; 
        end 
        else begin
            grt0[`PRI_0] <=  u_req[`PRI_0];
            grt0[`PRI_1] <= (u_req[`PRI_0] == 0) & u_req[`PRI_1];
            grt0[`PRI_2] <= (u_req[`PRI_0] == 0 && u_req[`PRI_1] == 0) & u_req[`PRI_2];
            grt0[`PRI_3] <= (u_req[`PRI_0] == 0 && u_req[`PRI_1] == 0 && u_req[`PRI_2] == 0) & u_req[`PRI_3];  
            grt0[`PRI_4] <= (u_req[`PRI_0] == 0 && u_req[`PRI_1] == 0 && u_req[`PRI_2] == 0 && u_req[`PRI_3] == 0) & u_req[`PRI_4]; 
        end
end

assign grt = grt0;

endmodule