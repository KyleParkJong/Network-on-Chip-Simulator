/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_19;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n19_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 19;     
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    
        for ( id = 1; id < len; id = id + 1 ) begin 
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	
        end 
        id = 0;                                 
        while ( id < len ) begin                
                #(STEP)                         
                /* Packet level flow control */ 
                if ( (id == 0 && n19_ordy_p0[vch]) || id > 0 ) begin 
                        n19_idata_p0 <= packet[id]; n19_ivalid_p0 <= `Enable; n19_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n19_idata_p0 <= `DATAW_P1'b0; n19_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n19_ivalid_p0 <= `Disable;   
end             
endtask