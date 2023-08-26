/* send_packet_u_src (num, dst, vch, len): send packets from router to dst (Unicast) */
task send_packet_u_0;
input [31:0] num_packets;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len0; 
reg [`DATAW:0] packets [0:64];    // packets (len * num_packets < 66)
integer id;
integer i;
integer len; 

begin    
        for ( len = 0; len < len0 ; len = len + 1 )   // len initialization

        n0_ivalid_p0 <= `Disable;
        /* Packets initialization */
        for ( i = 0; i < num_packets; i = i + 1 ) begin   
            for ( id = len*i; id < len*(i+1); id = id + 1 ) 
                    packets[id] <= 0; 
        end

        #(STEP)

        /* Header configuration */
        for ( i = 0; i < num_packets; i = i + 1 ) begin
            if (len == 1) 
                    packets[len*i][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
            else 
                    packets[len*i][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        end

        /* Other configurations */
        for ( i = 0; i < num_packets; i = i + 1 ) begin
            packets[len*i][`UM_TYPE] <= 0;                /* Multi/Uni */
            packets[len*i][`DST_MSB:`DST_LSB] <= dst;     /* Dest ID (11-bit) (62~52) */
            packets[len*i][`SRC_MSB:`SRC_LSB] <= 0;       /* Source ID (5-bit) (2~6)  */
            packets[len*i][`VCH_MSB:`VCH_LSB] <= vch;     /* Vch ID (2-bit)    (0~1)  */
            for ( id = 1; id < len; id = id + 1 ) begin  /* Body,Tail bit */
                    if ( id+len*i == len*(i+1) - 1 )
                            packets[id+len*i][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                    else 
                            packets[id+len*i][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                    /* Main data */
                    packets[id+len*i][15:12] <= id;
                    packets[id+len*i][31:16] <= counter;
            end
        end 
        /* Packet transfer */
            id = 0; i = num_packets;                                 
            while ( id < len*i ) begin                
                    #(STEP)                         
                    /* Packet level flow control */ 
                    if ( (id == 0 && n0_ordy_p0[vch]) || id > 0 ) begin 
                            n0_idata_p0 <= packets[id]; n0_ivalid_p0 <= `Enable; n0_ivch_p0 <= vch; id = id + 1; 
                    end else begin    
                            n0_idata_p0 <= `DATAW_P1'b0; n0_ivalid_p0 <= `Disable;  
                    end 
            end

        #(STEP) 
        n0_idata_p0 <= `DATAW_P1'b0; n0_ivalid_p0 <= `Disable;   
end             
endtask 