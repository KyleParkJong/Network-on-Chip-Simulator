/* test module for noc.v */ 
`include "define.v"     
`timescale 1ns/10ps 

module noc_test; 

parameter STEP  = 5.0; 
parameter ARRAY = 4; 

integer counter, stop, total_sent, total_recv; 
reg clk, rst_, ready;

/* n0 */ 
reg     [`DATAW:0]      n0_idata_p0;  
reg                     n0_ivalid_p0; 
reg     [`VCHW:0]       n0_ivch_p0;   
wire    [`VCH:0]        n0_ordy_p0;   
wire    [`DATAW:0]      n0_odata_p0;  
wire                    n0_ovalid_p0;
integer                 n0_sent, n0_recv;

/* n1 */ 
reg     [`DATAW:0]      n1_idata_p0;  
reg                     n1_ivalid_p0; 
reg     [`VCHW:0]       n1_ivch_p0;   
wire    [`VCH:0]        n1_ordy_p0;   
wire    [`DATAW:0]      n1_odata_p0;  
wire                    n1_ovalid_p0; 
integer                 n1_sent, n1_recv;

/* n2 */ 
reg     [`DATAW:0]      n2_idata_p0;  
reg                     n2_ivalid_p0; 
reg     [`VCHW:0]       n2_ivch_p0;   
wire    [`VCH:0]        n2_ordy_p0;   
wire    [`DATAW:0]      n2_odata_p0;  
wire                    n2_ovalid_p0; 
integer                 n2_sent, n2_recv;

/* n3 */ 
reg     [`DATAW:0]      n3_idata_p0;  
reg                     n3_ivalid_p0; 
reg     [`VCHW:0]       n3_ivch_p0;   
wire    [`VCH:0]        n3_ordy_p0;   
wire    [`DATAW:0]      n3_odata_p0;  
wire                    n3_ovalid_p0;
integer                 n3_sent, n3_recv;

/* n4 */ 
reg     [`DATAW:0]      n4_idata_p0;  
reg                     n4_ivalid_p0; 
reg     [`VCHW:0]       n4_ivch_p0;   
wire    [`VCH:0]        n4_ordy_p0;   
wire    [`DATAW:0]      n4_odata_p0;  
wire                    n4_ovalid_p0; 
integer                 n4_sent, n4_recv;

/* n5 */ 
reg     [`DATAW:0]      n5_idata_p0;  
reg                     n5_ivalid_p0; 
reg     [`VCHW:0]       n5_ivch_p0;   
wire    [`VCH:0]        n5_ordy_p0;   
wire    [`DATAW:0]      n5_odata_p0;  
wire                    n5_ovalid_p0; 
integer                 n5_sent, n5_recv;

/* n6 */ 
reg     [`DATAW:0]      n6_idata_p0;  
reg                     n6_ivalid_p0; 
reg     [`VCHW:0]       n6_ivch_p0;   
wire    [`VCH:0]        n6_ordy_p0;   
wire    [`DATAW:0]      n6_odata_p0;  
wire                    n6_ovalid_p0;
integer                 n6_sent, n6_recv;

/* n7 */ 
reg     [`DATAW:0]      n7_idata_p0;  
reg                     n7_ivalid_p0; 
reg     [`VCHW:0]       n7_ivch_p0;   
wire    [`VCH:0]        n7_ordy_p0;   
wire    [`DATAW:0]      n7_odata_p0;  
wire                    n7_ovalid_p0; 
integer                 n7_sent, n7_recv;

/* n8 */ 
reg     [`DATAW:0]      n8_idata_p0;  
reg                     n8_ivalid_p0; 
reg     [`VCHW:0]       n8_ivch_p0;   
wire    [`VCH:0]        n8_ordy_p0;   
wire    [`DATAW:0]      n8_odata_p0;  
wire                    n8_ovalid_p0; 
integer                 n8_sent, n8_recv;

/* n9 */ 
reg     [`DATAW:0]      n9_idata_p0;  
reg                     n9_ivalid_p0; 
reg     [`VCHW:0]       n9_ivch_p0;   
wire    [`VCH:0]        n9_ordy_p0;   
wire    [`DATAW:0]      n9_odata_p0;  
wire                    n9_ovalid_p0; 
integer                 n9_sent, n9_recv;

/* n10 */ 
reg     [`DATAW:0]      n10_idata_p0;  
reg                     n10_ivalid_p0; 
reg     [`VCHW:0]       n10_ivch_p0;   
wire    [`VCH:0]        n10_ordy_p0;   
wire    [`DATAW:0]      n10_odata_p0;  
wire                    n10_ovalid_p0; 
integer                 n10_sent, n10_recv;

/* n11 */ 
reg     [`DATAW:0]      n11_idata_p0;  
reg                     n11_ivalid_p0; 
reg     [`VCHW:0]       n11_ivch_p0;   
wire    [`VCH:0]        n11_ordy_p0;   
wire    [`DATAW:0]      n11_odata_p0;  
wire                    n11_ovalid_p0;
integer                 n11_sent, n11_recv;

/* n12 */ 
reg     [`DATAW:0]      n12_idata_p0;  
reg                     n12_ivalid_p0; 
reg     [`VCHW:0]       n12_ivch_p0;   
wire    [`VCH:0]        n12_ordy_p0;   
wire    [`DATAW:0]      n12_odata_p0;  
wire                    n12_ovalid_p0; 
integer                 n12_sent, n12_recv;

/* n13 */ 
reg     [`DATAW:0]      n13_idata_p0;  
reg                     n13_ivalid_p0; 
reg     [`VCHW:0]       n13_ivch_p0;   
wire    [`VCH:0]        n13_ordy_p0;   
wire    [`DATAW:0]      n13_odata_p0;  
wire                    n13_ovalid_p0; 
integer                 n13_sent, n13_recv;

/* n14 */ 
reg     [`DATAW:0]      n14_idata_p0;  
reg                     n14_ivalid_p0; 
reg     [`VCHW:0]       n14_ivch_p0;   
wire    [`VCH:0]        n14_ordy_p0;   
wire    [`DATAW:0]      n14_odata_p0;  
wire                    n14_ovalid_p0; 
integer                 n14_sent, n14_recv;

/* n15 */ 
reg     [`DATAW:0]      n15_idata_p0;  
reg                     n15_ivalid_p0; 
reg     [`VCHW:0]       n15_ivch_p0;   
wire    [`VCH:0]        n15_ordy_p0;   
wire    [`DATAW:0]      n15_odata_p0;  
wire                    n15_ovalid_p0;
integer                 n15_sent, n15_recv;

/* n16 */ 
reg     [`DATAW:0]      n16_idata_p0;  
reg                     n16_ivalid_p0; 
reg     [`VCHW:0]       n16_ivch_p0;   
wire    [`VCH:0]        n16_ordy_p0;   
wire    [`DATAW:0]      n16_odata_p0;  
wire                    n16_ovalid_p0;
integer                 n16_sent, n16_recv;

/* n17 */ 
reg     [`DATAW:0]      n17_idata_p0;  
reg                     n17_ivalid_p0; 
reg     [`VCHW:0]       n17_ivch_p0;   
wire    [`VCH:0]        n17_ordy_p0;   
wire    [`DATAW:0]      n17_odata_p0;  
wire                    n17_ovalid_p0; 
integer                 n17_sent, n17_recv;

/* n18 */ 
reg     [`DATAW:0]      n18_idata_p0;  
reg                     n18_ivalid_p0; 
reg     [`VCHW:0]       n18_ivch_p0;   
wire    [`VCH:0]        n18_ordy_p0;   
wire    [`DATAW:0]      n18_odata_p0;  
wire                    n18_ovalid_p0; 
integer                 n18_sent, n18_recv;

/* n19 */ 
reg     [`DATAW:0]      n19_idata_p0;  
reg                     n19_ivalid_p0; 
reg     [`VCHW:0]       n19_ivch_p0;   
wire    [`VCH:0]        n19_ordy_p0;   
wire    [`DATAW:0]      n19_odata_p0;  
wire                    n19_ovalid_p0;
integer                 n19_sent, n19_recv;

noc noc ( 
        /* n0 */ 
        .n0_idata_p0 ( n0_idata_p0  ), 
        .n0_ivalid_p0( n0_ivalid_p0 ), 
        .n0_ivch_p0  ( n0_ivch_p0   ), 
        .n0_ordy_p0  ( n0_ordy_p0   ), 
        .n0_odata_p0 ( n0_odata_p0  ), 
        .n0_ovalid_p0( n0_ovalid_p0 ),

        /* n1 */ 
        .n1_idata_p0 ( n1_idata_p0  ), 
        .n1_ivalid_p0( n1_ivalid_p0 ), 
        .n1_ivch_p0  ( n1_ivch_p0   ), 
        .n1_ordy_p0  ( n1_ordy_p0   ), 
        .n1_odata_p0 ( n1_odata_p0  ), 
        .n1_ovalid_p0( n1_ovalid_p0 ), 

        /* n2 */ 
        .n2_idata_p0 ( n2_idata_p0  ), 
        .n2_ivalid_p0( n2_ivalid_p0 ), 
        .n2_ivch_p0  ( n2_ivch_p0   ), 
        .n2_ordy_p0  ( n2_ordy_p0   ), 
        .n2_odata_p0 ( n2_odata_p0  ), 
        .n2_ovalid_p0( n2_ovalid_p0 ), 

        /* n3 */ 
        .n3_idata_p0 ( n3_idata_p0  ), 
        .n3_ivalid_p0( n3_ivalid_p0 ), 
        .n3_ivch_p0  ( n3_ivch_p0   ), 
        .n3_ordy_p0  ( n3_ordy_p0   ), 
        .n3_odata_p0 ( n3_odata_p0  ), 
        .n3_ovalid_p0( n3_ovalid_p0 ), 

        /* n4 */ 
        .n4_idata_p0 ( n4_idata_p0  ), 
        .n4_ivalid_p0( n4_ivalid_p0 ), 
        .n4_ivch_p0  ( n4_ivch_p0   ), 
        .n4_ordy_p0  ( n4_ordy_p0   ), 
        .n4_odata_p0 ( n4_odata_p0  ), 
        .n4_ovalid_p0( n4_ovalid_p0 ), 

        /* n5 */ 
        .n5_idata_p0 ( n5_idata_p0  ), 
        .n5_ivalid_p0( n5_ivalid_p0 ), 
        .n5_ivch_p0  ( n5_ivch_p0   ), 
        .n5_ordy_p0  ( n5_ordy_p0   ), 
        .n5_odata_p0 ( n5_odata_p0  ), 
        .n5_ovalid_p0( n5_ovalid_p0 ), 

        /* n6 */ 
        .n6_idata_p0 ( n6_idata_p0  ), 
        .n6_ivalid_p0( n6_ivalid_p0 ), 
        .n6_ivch_p0  ( n6_ivch_p0   ), 
        .n6_ordy_p0  ( n6_ordy_p0   ), 
        .n6_odata_p0 ( n6_odata_p0  ), 
        .n6_ovalid_p0( n6_ovalid_p0 ), 

        /* n7 */ 
        .n7_idata_p0 ( n7_idata_p0  ), 
        .n7_ivalid_p0( n7_ivalid_p0 ), 
        .n7_ivch_p0  ( n7_ivch_p0   ), 
        .n7_ordy_p0  ( n7_ordy_p0   ), 
        .n7_odata_p0 ( n7_odata_p0  ), 
        .n7_ovalid_p0( n7_ovalid_p0 ), 

        /* n8 */ 
        .n8_idata_p0 ( n8_idata_p0  ), 
        .n8_ivalid_p0( n8_ivalid_p0 ), 
        .n8_ivch_p0  ( n8_ivch_p0   ), 
        .n8_ordy_p0  ( n8_ordy_p0   ), 
        .n8_odata_p0 ( n8_odata_p0  ), 
        .n8_ovalid_p0( n8_ovalid_p0 ),

        /* n9 */ 
        .n9_idata_p0 ( n9_idata_p0  ), 
        .n9_ivalid_p0( n9_ivalid_p0 ), 
        .n9_ivch_p0  ( n9_ivch_p0   ), 
        .n9_ordy_p0  ( n9_ordy_p0   ), 
        .n9_odata_p0 ( n9_odata_p0  ), 
        .n9_ovalid_p0( n9_ovalid_p0 ), 

        /* n10 */ 
        .n10_idata_p0 ( n10_idata_p0  ), 
        .n10_ivalid_p0( n10_ivalid_p0 ), 
        .n10_ivch_p0  ( n10_ivch_p0   ), 
        .n10_ordy_p0  ( n10_ordy_p0   ), 
        .n10_odata_p0 ( n10_odata_p0  ), 
        .n10_ovalid_p0( n10_ovalid_p0 ), 

        /* n11 */ 
        .n11_idata_p0 ( n11_idata_p0  ), 
        .n11_ivalid_p0( n11_ivalid_p0 ), 
        .n11_ivch_p0  ( n11_ivch_p0   ), 
        .n11_ordy_p0  ( n11_ordy_p0   ), 
        .n11_odata_p0 ( n11_odata_p0  ), 
        .n11_ovalid_p0( n11_ovalid_p0 ), 

        /* n12 */ 
        .n12_idata_p0 ( n12_idata_p0  ), 
        .n12_ivalid_p0( n12_ivalid_p0 ), 
        .n12_ivch_p0  ( n12_ivch_p0   ), 
        .n12_ordy_p0  ( n12_ordy_p0   ), 
        .n12_odata_p0 ( n12_odata_p0  ), 
        .n12_ovalid_p0( n12_ovalid_p0 ),

        /* n13 */ 
        .n13_idata_p0 ( n13_idata_p0  ), 
        .n13_ivalid_p0( n13_ivalid_p0 ), 
        .n13_ivch_p0  ( n13_ivch_p0   ), 
        .n13_ordy_p0  ( n13_ordy_p0   ), 
        .n13_odata_p0 ( n13_odata_p0  ), 
        .n13_ovalid_p0( n13_ovalid_p0 ), 

        /* n14 */ 
        .n14_idata_p0 ( n14_idata_p0  ), 
        .n14_ivalid_p0( n14_ivalid_p0 ), 
        .n14_ivch_p0  ( n14_ivch_p0   ), 
        .n14_ordy_p0  ( n14_ordy_p0   ), 
        .n14_odata_p0 ( n14_odata_p0  ), 
        .n14_ovalid_p0( n14_ovalid_p0 ), 

        /* n15 */ 
        .n15_idata_p0 ( n15_idata_p0  ), 
        .n15_ivalid_p0( n15_ivalid_p0 ), 
        .n15_ivch_p0  ( n15_ivch_p0   ), 
        .n15_ordy_p0  ( n15_ordy_p0   ), 
        .n15_odata_p0 ( n15_odata_p0  ), 
        .n15_ovalid_p0( n15_ovalid_p0 ),

        /* n16 */ 
        .n16_idata_p0 ( n16_idata_p0  ), 
        .n16_ivalid_p0( n16_ivalid_p0 ), 
        .n16_ivch_p0  ( n16_ivch_p0   ), 
        .n16_ordy_p0  ( n16_ordy_p0   ), 
        .n16_odata_p0 ( n16_odata_p0  ), 
        .n16_ovalid_p0( n16_ovalid_p0 ), 

        /* n17 */ 
        .n17_idata_p0 ( n17_idata_p0  ), 
        .n17_ivalid_p0( n17_ivalid_p0 ), 
        .n17_ivch_p0  ( n17_ivch_p0   ), 
        .n17_ordy_p0  ( n17_ordy_p0   ), 
        .n17_odata_p0 ( n17_odata_p0  ), 
        .n17_ovalid_p0( n17_ovalid_p0 ), 

        /* n18 */ 
        .n18_idata_p0 ( n18_idata_p0  ), 
        .n18_ivalid_p0( n18_ivalid_p0 ), 
        .n18_ivch_p0  ( n18_ivch_p0   ), 
        .n18_ordy_p0  ( n18_ordy_p0   ), 
        .n18_odata_p0 ( n18_odata_p0  ), 
        .n18_ovalid_p0( n18_ovalid_p0 ), 

        /* n19 */ 
        .n19_idata_p0 ( n19_idata_p0  ), 
        .n19_ivalid_p0( n19_ivalid_p0 ), 
        .n19_ivch_p0  ( n19_ivch_p0   ), 
        .n19_ordy_p0  ( n19_ordy_p0   ), 
        .n19_odata_p0 ( n19_odata_p0  ), 
        .n19_ovalid_p0( n19_ovalid_p0 ), 

        .clk ( clk  ), 
        .rst_( rst_ )
); 

always #( STEP / 2) begin      
        clk <= ~clk;           
end                            
always #(STEP) begin           
        counter = counter + 1; 
end                            

initial begin                   
        /* Initialization */    
        #0                      
        counter = 0;            
        stop    = 200; //stop signal 변경         
        clk     <= `High;       
        ready   <= `Disable;    
        /* Send/recv counters */
        n0_sent = 0; n0_recv = 0; 
        n1_sent = 0; n1_recv = 0; 
        n2_sent = 0; n2_recv = 0; 
        n3_sent = 0; n3_recv = 0; 
        n4_sent = 0; n4_recv = 0; 
        n5_sent = 0; n5_recv = 0; 
        n6_sent = 0; n6_recv = 0; 
        n7_sent = 0; n7_recv = 0; 
        n8_sent = 0; n8_recv = 0; 
        n9_sent = 0; n9_recv = 0; 
        n10_sent = 0; n10_recv = 0; 
        n11_sent = 0; n11_recv = 0; 
        n12_sent = 0; n12_recv = 0; 
        n13_sent = 0; n13_recv = 0; 
        n14_sent = 0; n14_recv = 0; 
        n15_sent = 0; n15_recv = 0; 
        n16_sent = 0; n16_recv = 0;
        n17_sent = 0; n17_recv = 0;
        n18_sent = 0; n18_recv = 0;
        n19_sent = 0; n19_recv = 0;

        #(STEP / 2)             
        noc_reset;              
        /* Now we can start simulation! */
        ready   <= `Enable;     

        /* Waiting for the end of the simulation */
        // stop logic 변경 필요(n4에서 조절 또는 timing diagram 참조
        while (counter < stop) begin
                #(STEP);        
        end

        /* Statistics */ 
        total_sent = n0_sent + n1_sent + n2_sent + n3_sent + n4_sent + n5_sent + n6_sent + n7_sent + n8_sent + n9_sent + n10_sent + n11_sent + n12_sent + n13_sent + n14_sent + n15_sent + n16_sent + n17_sent + n18_sent + n19_sent;
        total_recv = n0_recv + n1_recv + n2_recv + n3_recv + n4_recv + n5_recv + n6_recv + n7_recv + n8_recv + n9_recv + n10_recv + n11_recv + n12_recv + n13_recv + n14_recv + n15_recv + n16_recv + n17_recv + n18_recv + n19_recv;
        $write("\n\n");    
        $write("*** statistics (%d) *** \n", counter); 
        $write("n0_sent %d \t n0_recv %d \n", n0_sent, n0_recv);
        $write("n1_sent %d \t n1_recv %d \n", n1_sent, n1_recv);
        $write("n2_sent %d \t n2_recv %d \n", n2_sent, n2_recv);
        $write("n3_sent %d \t n3_recv %d \n", n3_sent, n3_recv);
        $write("n4_sent %d \t n4_recv %d \n", n4_sent, n4_recv);
        $write("n5_sent %d \t n5_recv %d \n", n5_sent, n5_recv);
        $write("n6_sent %d \t n6_recv %d \n", n6_sent, n6_recv);
        $write("n7_sent %d \t n7_recv %d \n", n7_sent, n7_recv);
        $write("n8_sent %d \t n8_recv %d \n", n8_sent, n8_recv);
        $write("n9_sent %d \t n9_recv %d \n", n9_sent, n9_recv);
        $write("n10_sent %d \t n10_recv %d \n", n10_sent, n10_recv);
        $write("n11_sent %d \t n11_recv %d \n", n11_sent, n11_recv);
        $write("n12_sent %d \t n12_recv %d \n", n12_sent, n12_recv);
        $write("n13_sent %d \t n13_recv %d \n", n13_sent, n13_recv);
        $write("n14_sent %d \t n14_recv %d \n", n14_sent, n14_recv);
        $write("n15_sent %d \t n15_recv %d \n", n15_sent, n15_recv);
        $write("n16_sent %d \t n16_recv %d \n", n16_sent, n16_recv);
        $write("n17_sent %d \t n17_recv %d \n", n17_sent, n17_recv);
        $write("n18_sent %d \t n18_recv %d \n", n18_sent, n18_recv);
        $write("n19_sent %d \t n19_recv %d \n", n19_sent, n19_recv);
        $write("total_sent %d \t total_recv %d \n", total_sent, total_recv);
        $write("\n\n");    
        $finish;                                 
end                             

/* packet generator for n16 */
initial begin
    #(STEP / 2);
    #(STEP * 10);
    while (~ready) begin
        #(STEP);
    end

    $write("*** Send multicast (src: 16 dst: 2,5,6,7,8,9,11,14,15,18 vch: 0 len: 9) *** \n");
    send_packet_m_16 (56'b0100_1100_1011_1110_0100, 0, 9);
end


/* Send/recv event monitor */ 
always @ (posedge clk) begin 
        if ( n0_ivalid_p0 == `Enable ) begin 
                $write("%d n0 send %x \n", counter, n0_idata_p0); 
                n0_sent = n0_sent + 1;
        end 
        if ( n1_ivalid_p0 == `Enable ) begin 
                $write("%d n1 send %x \n", counter, n1_idata_p0); 
                n1_sent = n1_sent + 1;
        end 
        if ( n2_ivalid_p0 == `Enable ) begin 
                $write("%d n2 send %x \n", counter, n2_idata_p0); 
                n2_sent = n2_sent + 1;
        end 
        if ( n3_ivalid_p0 == `Enable ) begin 
                $write("%d n3 send %x \n", counter, n3_idata_p0); 
                n3_sent = n3_sent + 1;
        end 
        if ( n4_ivalid_p0 == `Enable ) begin 
                $write("%d n4 send %x \n", counter, n4_idata_p0); 
                n4_sent = n4_sent + 1;
        end 
        if ( n5_ivalid_p0 == `Enable ) begin 
                $write("%d n5 send %x \n", counter, n5_idata_p0); 
                n5_sent = n5_sent + 1;
        end 
        if ( n6_ivalid_p0 == `Enable ) begin 
                $write("%d n6 send %x \n", counter, n6_idata_p0); 
                n6_sent = n6_sent + 1;
        end 
        if ( n7_ivalid_p0 == `Enable ) begin 
                $write("%d n7 send %x \n", counter, n7_idata_p0); 
                n7_sent = n7_sent + 1;
        end 
        if ( n8_ivalid_p0 == `Enable ) begin 
                $write("%d n8 send %x \n", counter, n8_idata_p0); 
                n8_sent = n8_sent + 1;
        end 
        if ( n9_ivalid_p0 == `Enable ) begin 
                $write("%d n9 send %x \n", counter, n9_idata_p0); 
                n9_sent = n9_sent + 1;
        end 
        if ( n10_ivalid_p0 == `Enable ) begin 
                $write("%d n10 send %x \n", counter, n10_idata_p0); 
                n10_sent = n10_sent + 1;
        end 
        if ( n11_ivalid_p0 == `Enable ) begin 
                $write("%d n11 send %x \n", counter, n11_idata_p0); 
                n11_sent = n11_sent + 1;
        end 
        if ( n12_ivalid_p0 == `Enable ) begin 
                $write("%d n12 send %x \n", counter, n12_idata_p0); 
                n12_sent = n12_sent + 1;
        end 
        if ( n13_ivalid_p0 == `Enable ) begin 
                $write("%d n13 send %x \n", counter, n13_idata_p0); 
                n13_sent = n13_sent + 1;
        end 
        if ( n14_ivalid_p0 == `Enable ) begin 
                $write("%d n14 send %x \n", counter, n14_idata_p0); 
                n14_sent = n14_sent + 1;
        end 
        if ( n15_ivalid_p0 == `Enable ) begin 
                $write("%d n15 send %x \n", counter, n15_idata_p0); 
                n15_sent = n15_sent + 1;
        end
        if ( n16_ivalid_p0 == `Enable ) begin 
                $write("%d n16 send %x \n", counter, n16_idata_p0); 
                n16_sent = n16_sent + 1;
        end
        if ( n17_ivalid_p0 == `Enable ) begin 
                $write("%d n17 send %x \n", counter, n17_idata_p0); 
                n17_sent = n17_sent + 1;
        end
        if ( n18_ivalid_p0 == `Enable ) begin 
                $write("%d n18 send %x \n", counter, n18_idata_p0); 
                n18_sent = n18_sent + 1;
        end
        if ( n19_ivalid_p0 == `Enable ) begin 
                $write("%d n19 send %x \n", counter, n19_idata_p0); 
                n19_sent = n19_sent + 1;
        end 
end 

always @ (posedge clk) begin 
        if ( n0_ovalid_p0 == `Enable ) begin 
                $write("        %d n0 recv %x \n", counter, n0_odata_p0); 
                n0_recv = n0_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n1_ovalid_p0 == `Enable ) begin 
                $write("        %d n1 recv %x \n", counter, n1_odata_p0); 
                n1_recv = n1_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n2_ovalid_p0 == `Enable ) begin 
                $write("        %d n2 recv %x \n", counter, n2_odata_p0); 
                n2_recv = n2_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n3_ovalid_p0 == `Enable ) begin 
                $write("        %d n3 recv %x \n", counter, n3_odata_p0); 
                n3_recv = n3_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n4_ovalid_p0 == `Enable ) begin 
                $write("        %d n4 recv %x \n", counter, n4_odata_p0); 
                n4_recv = n4_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n5_ovalid_p0 == `Enable ) begin 
                $write("        %d n5 recv %x \n", counter, n5_odata_p0); 
                n5_recv = n5_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n6_ovalid_p0 == `Enable ) begin 
                $write("        %d n6 recv %x \n", counter, n6_odata_p0); 
                n6_recv = n6_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n7_ovalid_p0 == `Enable ) begin 
                $write("        %d n7 recv %x \n", counter, n7_odata_p0); 
                n7_recv = n7_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n8_ovalid_p0 == `Enable ) begin 
                $write("        %d n8 recv %x \n", counter, n8_odata_p0); 
                n8_recv = n8_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n9_ovalid_p0 == `Enable ) begin 
                $write("        %d n9 recv %x \n", counter, n9_odata_p0); 
                n9_recv = n9_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n10_ovalid_p0 == `Enable ) begin 
                $write("        %d n10 recv %x \n", counter, n10_odata_p0); 
                n10_recv = n10_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n11_ovalid_p0 == `Enable ) begin 
                $write("        %d n11 recv %x \n", counter, n11_odata_p0); 
                n11_recv = n11_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n12_ovalid_p0 == `Enable ) begin 
                $write("        %d n12 recv %x \n", counter, n12_odata_p0); 
                n12_recv = n12_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n13_ovalid_p0 == `Enable ) begin 
                $write("        %d n13 recv %x \n", counter, n13_odata_p0); 
                n13_recv = n13_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n14_ovalid_p0 == `Enable ) begin 
                $write("        %d n14 recv %x \n", counter, n14_odata_p0); 
                n14_recv = n14_recv + 1; 
                stop     = counter + 200;
        end 
        if ( n15_ovalid_p0 == `Enable ) begin 
                $write("        %d n15 recv %x \n", counter, n15_odata_p0); 
                n15_recv = n15_recv + 1; 
                stop     = counter + 200;
        end
        if ( n16_ovalid_p0 == `Enable ) begin 
                $write("        %d n16 recv %x \n", counter, n16_odata_p0); 
                n16_recv = n16_recv + 1; 
                stop     = counter + 200;
        end
        if ( n17_ovalid_p0 == `Enable ) begin 
                $write("        %d n17 recv %x \n", counter, n17_odata_p0); 
                n17_recv = n17_recv + 1; 
                stop     = counter + 200;
        end
        if ( n18_ovalid_p0 == `Enable ) begin 
                $write("        %d n18 recv %x \n", counter, n18_odata_p0); 
                n18_recv = n18_recv + 1; 
                stop     = counter + 200;
        end
        if ( n19_ovalid_p0 == `Enable ) begin 
                $write("        %d n19 recv %x \n", counter, n19_odata_p0); 
                n19_recv = n19_recv + 1; 
                stop     = counter + 200;
        end 
end

/* Port 0 */ 
always @ (posedge clk) begin    
	if ( noc.n0.ovalid_0 == `Enable ) $write("                %d n0(0 %d) go thru %x \n", counter, noc.n0.ovch_0, noc.n0.odata_0); 
	if ( noc.n1.ovalid_0 == `Enable ) $write("                %d n1(0 %d) go thru %x \n", counter, noc.n1.ovch_0, noc.n1.odata_0); 
	if ( noc.n2.ovalid_0 == `Enable ) $write("                %d n2(0 %d) go thru %x \n", counter, noc.n2.ovch_0, noc.n2.odata_0); 
	if ( noc.n3.ovalid_0 == `Enable ) $write("                %d n3(0 %d) go thru %x \n", counter, noc.n3.ovch_0, noc.n3.odata_0); 
	if ( noc.n4.ovalid_0 == `Enable ) $write("                %d n4(0 %d) go thru %x \n", counter, noc.n4.ovch_0, noc.n4.odata_0); 
	if ( noc.n5.ovalid_0 == `Enable ) $write("                %d n5(0 %d) go thru %x \n", counter, noc.n5.ovch_0, noc.n5.odata_0); 
	if ( noc.n6.ovalid_0 == `Enable ) $write("                %d n6(0 %d) go thru %x \n", counter, noc.n6.ovch_0, noc.n6.odata_0); 
	if ( noc.n7.ovalid_0 == `Enable ) $write("                %d n7(0 %d) go thru %x \n", counter, noc.n7.ovch_0, noc.n7.odata_0); 
	if ( noc.n8.ovalid_0 == `Enable ) $write("                %d n8(0 %d) go thru %x \n", counter, noc.n8.ovch_0, noc.n8.odata_0); 
	if ( noc.n9.ovalid_0 == `Enable ) $write("                %d n9(0 %d) go thru %x \n", counter, noc.n9.ovch_0, noc.n9.odata_0); 
	if ( noc.n10.ovalid_0 == `Enable ) $write("                %d n10(0 %d) go thru %x \n", counter, noc.n10.ovch_0, noc.n10.odata_0); 
	if ( noc.n11.ovalid_0 == `Enable ) $write("                %d n11(0 %d) go thru %x \n", counter, noc.n11.ovch_0, noc.n11.odata_0); 
	if ( noc.n12.ovalid_0 == `Enable ) $write("                %d n12(0 %d) go thru %x \n", counter, noc.n12.ovch_0, noc.n12.odata_0); 
	if ( noc.n13.ovalid_0 == `Enable ) $write("                %d n13(0 %d) go thru %x \n", counter, noc.n13.ovch_0, noc.n13.odata_0); 
	if ( noc.n14.ovalid_0 == `Enable ) $write("                %d n14(0 %d) go thru %x \n", counter, noc.n14.ovch_0, noc.n14.odata_0); 
	if ( noc.n15.ovalid_0 == `Enable ) $write("                %d n15(0 %d) go thru %x \n", counter, noc.n15.ovch_0, noc.n15.odata_0); 
	if ( noc.n16.ovalid_0 == `Enable ) $write("                %d n16(0 %d) go thru %x \n", counter, noc.n16.ovch_0, noc.n16.odata_0); 
	if ( noc.n17.ovalid_0 == `Enable ) $write("                %d n17(0 %d) go thru %x \n", counter, noc.n17.ovch_0, noc.n17.odata_0); 
	if ( noc.n18.ovalid_0 == `Enable ) $write("                %d n18(0 %d) go thru %x \n", counter, noc.n18.ovch_0, noc.n18.odata_0); 
	if ( noc.n19.ovalid_0 == `Enable ) $write("                %d n19(0 %d) go thru %x \n", counter, noc.n19.ovch_0, noc.n19.odata_0); 
end 
/* Port 1 */ 
always @ (posedge clk) begin    
	if ( noc.n0.ovalid_1 == `Enable ) $write("                %d n0(1 %d) go thru %x \n", counter, noc.n0.ovch_1, noc.n0.odata_1); 
	if ( noc.n1.ovalid_1 == `Enable ) $write("                %d n1(1 %d) go thru %x \n", counter, noc.n1.ovch_1, noc.n1.odata_1); 
	if ( noc.n2.ovalid_1 == `Enable ) $write("                %d n2(1 %d) go thru %x \n", counter, noc.n2.ovch_1, noc.n2.odata_1); 
	if ( noc.n3.ovalid_1 == `Enable ) $write("                %d n3(1 %d) go thru %x \n", counter, noc.n3.ovch_1, noc.n3.odata_1); 
	if ( noc.n4.ovalid_1 == `Enable ) $write("                %d n4(1 %d) go thru %x \n", counter, noc.n4.ovch_1, noc.n4.odata_1); 
	if ( noc.n5.ovalid_1 == `Enable ) $write("                %d n5(1 %d) go thru %x \n", counter, noc.n5.ovch_1, noc.n5.odata_1); 
	if ( noc.n6.ovalid_1 == `Enable ) $write("                %d n6(1 %d) go thru %x \n", counter, noc.n6.ovch_1, noc.n6.odata_1); 
	if ( noc.n7.ovalid_1 == `Enable ) $write("                %d n7(1 %d) go thru %x \n", counter, noc.n7.ovch_1, noc.n7.odata_1); 
	if ( noc.n8.ovalid_1 == `Enable ) $write("                %d n8(1 %d) go thru %x \n", counter, noc.n8.ovch_1, noc.n8.odata_1); 
	if ( noc.n9.ovalid_1 == `Enable ) $write("                %d n9(1 %d) go thru %x \n", counter, noc.n9.ovch_1, noc.n9.odata_1); 
	if ( noc.n10.ovalid_1 == `Enable ) $write("                %d n10(1 %d) go thru %x \n", counter, noc.n10.ovch_1, noc.n10.odata_1); 
	if ( noc.n11.ovalid_1 == `Enable ) $write("                %d n11(1 %d) go thru %x \n", counter, noc.n11.ovch_1, noc.n11.odata_1); 
	if ( noc.n12.ovalid_1 == `Enable ) $write("                %d n12(1 %d) go thru %x \n", counter, noc.n12.ovch_1, noc.n12.odata_1); 
	if ( noc.n13.ovalid_1 == `Enable ) $write("                %d n13(1 %d) go thru %x \n", counter, noc.n13.ovch_1, noc.n13.odata_1); 
	if ( noc.n14.ovalid_1 == `Enable ) $write("                %d n14(1 %d) go thru %x \n", counter, noc.n14.ovch_1, noc.n14.odata_1); 
	if ( noc.n15.ovalid_1 == `Enable ) $write("                %d n15(1 %d) go thru %x \n", counter, noc.n15.ovch_1, noc.n15.odata_1); 
	if ( noc.n16.ovalid_1 == `Enable ) $write("                %d n16(1 %d) go thru %x \n", counter, noc.n16.ovch_1, noc.n16.odata_1); 
	if ( noc.n17.ovalid_1 == `Enable ) $write("                %d n17(1 %d) go thru %x \n", counter, noc.n17.ovch_1, noc.n17.odata_1); 
	if ( noc.n18.ovalid_1 == `Enable ) $write("                %d n18(1 %d) go thru %x \n", counter, noc.n18.ovch_1, noc.n18.odata_1); 
	if ( noc.n19.ovalid_1 == `Enable ) $write("                %d n19(1 %d) go thru %x \n", counter, noc.n19.ovch_1, noc.n19.odata_1); 
end 
/* Port 2 */ 
always @ (posedge clk) begin    
	if ( noc.n0.ovalid_2 == `Enable ) $write("                %d n0(2 %d) go thru %x \n", counter, noc.n0.ovch_2, noc.n0.odata_2); 
	if ( noc.n1.ovalid_2 == `Enable ) $write("                %d n1(2 %d) go thru %x \n", counter, noc.n1.ovch_2, noc.n1.odata_2); 
	if ( noc.n2.ovalid_2 == `Enable ) $write("                %d n2(2 %d) go thru %x \n", counter, noc.n2.ovch_2, noc.n2.odata_2); 
	if ( noc.n3.ovalid_2 == `Enable ) $write("                %d n3(2 %d) go thru %x \n", counter, noc.n3.ovch_2, noc.n3.odata_2); 
	if ( noc.n4.ovalid_2 == `Enable ) $write("                %d n4(2 %d) go thru %x \n", counter, noc.n4.ovch_2, noc.n4.odata_2); 
	if ( noc.n5.ovalid_2 == `Enable ) $write("                %d n5(2 %d) go thru %x \n", counter, noc.n5.ovch_2, noc.n5.odata_2); 
	if ( noc.n6.ovalid_2 == `Enable ) $write("                %d n6(2 %d) go thru %x \n", counter, noc.n6.ovch_2, noc.n6.odata_2); 
	if ( noc.n7.ovalid_2 == `Enable ) $write("                %d n7(2 %d) go thru %x \n", counter, noc.n7.ovch_2, noc.n7.odata_2); 
	if ( noc.n8.ovalid_2 == `Enable ) $write("                %d n8(2 %d) go thru %x \n", counter, noc.n8.ovch_2, noc.n8.odata_2); 
	if ( noc.n9.ovalid_2 == `Enable ) $write("                %d n9(2 %d) go thru %x \n", counter, noc.n9.ovch_2, noc.n9.odata_2); 
	if ( noc.n10.ovalid_2 == `Enable ) $write("                %d n10(2 %d) go thru %x \n", counter, noc.n10.ovch_2, noc.n10.odata_2); 
	if ( noc.n11.ovalid_2 == `Enable ) $write("                %d n11(2 %d) go thru %x \n", counter, noc.n11.ovch_2, noc.n11.odata_2); 
	if ( noc.n12.ovalid_2 == `Enable ) $write("                %d n12(2 %d) go thru %x \n", counter, noc.n12.ovch_2, noc.n12.odata_2); 
	if ( noc.n13.ovalid_2 == `Enable ) $write("                %d n13(2 %d) go thru %x \n", counter, noc.n13.ovch_2, noc.n13.odata_2); 
	if ( noc.n14.ovalid_2 == `Enable ) $write("                %d n14(2 %d) go thru %x \n", counter, noc.n14.ovch_2, noc.n14.odata_2); 
	if ( noc.n15.ovalid_2 == `Enable ) $write("                %d n15(2 %d) go thru %x \n", counter, noc.n15.ovch_2, noc.n15.odata_2); 
	if ( noc.n16.ovalid_2 == `Enable ) $write("                %d n16(2 %d) go thru %x \n", counter, noc.n16.ovch_2, noc.n16.odata_2); 
	if ( noc.n17.ovalid_2 == `Enable ) $write("                %d n17(2 %d) go thru %x \n", counter, noc.n17.ovch_2, noc.n17.odata_2); 
	if ( noc.n18.ovalid_2 == `Enable ) $write("                %d n18(2 %d) go thru %x \n", counter, noc.n18.ovch_2, noc.n18.odata_2); 
	if ( noc.n19.ovalid_2 == `Enable ) $write("                %d n19(2 %d) go thru %x \n", counter, noc.n19.ovch_2, noc.n19.odata_2); 
end 
/* Port 3 */ 
always @ (posedge clk) begin    
	if ( noc.n0.ovalid_3 == `Enable ) $write("                %d n0(3 %d) go thru %x \n", counter, noc.n0.ovch_3, noc.n0.odata_3); 
	if ( noc.n1.ovalid_3 == `Enable ) $write("                %d n1(3 %d) go thru %x \n", counter, noc.n1.ovch_3, noc.n1.odata_3); 
	if ( noc.n2.ovalid_3 == `Enable ) $write("                %d n2(3 %d) go thru %x \n", counter, noc.n2.ovch_3, noc.n2.odata_3); 
	if ( noc.n3.ovalid_3 == `Enable ) $write("                %d n3(3 %d) go thru %x \n", counter, noc.n3.ovch_3, noc.n3.odata_3); 
	if ( noc.n4.ovalid_3 == `Enable ) $write("                %d n4(3 %d) go thru %x \n", counter, noc.n4.ovch_3, noc.n4.odata_3); 
	if ( noc.n5.ovalid_3 == `Enable ) $write("                %d n5(3 %d) go thru %x \n", counter, noc.n5.ovch_3, noc.n5.odata_3); 
	if ( noc.n6.ovalid_3 == `Enable ) $write("                %d n6(3 %d) go thru %x \n", counter, noc.n6.ovch_3, noc.n6.odata_3); 
	if ( noc.n7.ovalid_3 == `Enable ) $write("                %d n7(3 %d) go thru %x \n", counter, noc.n7.ovch_3, noc.n7.odata_3); 
	if ( noc.n8.ovalid_3 == `Enable ) $write("                %d n8(3 %d) go thru %x \n", counter, noc.n8.ovch_3, noc.n8.odata_3); 
	if ( noc.n9.ovalid_3 == `Enable ) $write("                %d n9(3 %d) go thru %x \n", counter, noc.n9.ovch_3, noc.n9.odata_3); 
	if ( noc.n10.ovalid_3 == `Enable ) $write("                %d n10(3 %d) go thru %x \n", counter, noc.n10.ovch_3, noc.n10.odata_3); 
	if ( noc.n11.ovalid_3 == `Enable ) $write("                %d n11(3 %d) go thru %x \n", counter, noc.n11.ovch_3, noc.n11.odata_3); 
	if ( noc.n12.ovalid_3 == `Enable ) $write("                %d n12(3 %d) go thru %x \n", counter, noc.n12.ovch_3, noc.n12.odata_3); 
	if ( noc.n13.ovalid_3 == `Enable ) $write("                %d n13(3 %d) go thru %x \n", counter, noc.n13.ovch_3, noc.n13.odata_3); 
	if ( noc.n14.ovalid_3 == `Enable ) $write("                %d n14(3 %d) go thru %x \n", counter, noc.n14.ovch_3, noc.n14.odata_3); 
	if ( noc.n15.ovalid_3 == `Enable ) $write("                %d n15(3 %d) go thru %x \n", counter, noc.n15.ovch_3, noc.n15.odata_3); 
	if ( noc.n16.ovalid_3 == `Enable ) $write("                %d n16(3 %d) go thru %x \n", counter, noc.n16.ovch_3, noc.n16.odata_3); 
	if ( noc.n17.ovalid_3 == `Enable ) $write("                %d n17(3 %d) go thru %x \n", counter, noc.n17.ovch_3, noc.n17.odata_3); 
	if ( noc.n18.ovalid_3 == `Enable ) $write("                %d n18(3 %d) go thru %x \n", counter, noc.n18.ovch_3, noc.n18.odata_3); 
	if ( noc.n19.ovalid_3 == `Enable ) $write("                %d n19(3 %d) go thru %x \n", counter, noc.n19.ovch_3, noc.n19.odata_3); 
end 

initial begin                     
        $dumpfile("dump.vcd"); 
        $dumpvars(0,noc_test);   
        `ifdef __POST_PR__        
        $sdf_annotate("router.sdf", noc_test.noc.n0, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n1, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n2, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n3, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n4, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n5, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n6, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n7, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n8, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n9, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n10, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n11, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n12, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n13, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n14, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n15, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n16, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n17, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n18, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n19, , "sdf.log", "MAXIMUM");
        `endif                    
end                               


/* send_packet_m_0 (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_0;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n0_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 0;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n0_ordy_p0[vch]) || id > 0 ) begin 
                        n0_idata_p0 <= packet[id]; n0_ivalid_p0 <= `Enable; n0_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n0_idata_p0 <= `DATAW_P1'b0; n0_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n0_idata_p0 <= `DATAW_P1'b0; n0_ivalid_p0 <= `Disable;  
end             
endtask 

/* send_packet_m_1 (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_1;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n1_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 1;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n1_ordy_p0[vch]) || id > 0 ) begin 
                        n1_idata_p0 <= packet[id]; n1_ivalid_p0 <= `Enable; n1_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n1_idata_p0 <= `DATAW_P1'b0; n1_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n1_idata_p0 <= `DATAW_P1'b0; n1_ivalid_p0 <= `Disable;  
end             
endtask  

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_2;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n2_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 2;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n2_ordy_p0[vch]) || id > 0 ) begin 
                        n2_idata_p0 <= packet[id]; n2_ivalid_p0 <= `Enable; n2_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n2_idata_p0 <= `DATAW_P1'b0; n2_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n2_idata_p0 <= `DATAW_P1'b0; n2_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_3;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n3_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 3;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n3_ordy_p0[vch]) || id > 0 ) begin 
                        n3_idata_p0 <= packet[id]; n3_ivalid_p0 <= `Enable; n3_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n3_idata_p0 <= `DATAW_P1'b0; n3_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n3_idata_p0 <= `DATAW_P1'b0; n3_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_4;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n4_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 4;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n4_ordy_p0[vch]) || id > 0 ) begin 
                        n4_idata_p0 <= packet[id]; n4_ivalid_p0 <= `Enable; n4_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n4_idata_p0 <= `DATAW_P1'b0; n4_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n4_idata_p0 <= `DATAW_P1'b0; n4_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_5;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n5_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n5_ordy_p0[vch]) || id > 0 ) begin 
                        n5_idata_p0 <= packet[id]; n5_ivalid_p0 <= `Enable; n5_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n5_idata_p0 <= `DATAW_P1'b0; n5_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n5_idata_p0 <= `DATAW_P1'b0; n5_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_6;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n6_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n6_ordy_p0[vch]) || id > 0 ) begin 
                        n6_idata_p0 <= packet[id]; n6_ivalid_p0 <= `Enable; n6_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n6_idata_p0 <= `DATAW_P1'b0; n6_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n6_idata_p0 <= `DATAW_P1'b0; n6_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_7;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n7_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n7_ordy_p0[vch]) || id > 0 ) begin 
                        n7_idata_p0 <= packet[id]; n7_ivalid_p0 <= `Enable; n7_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n7_idata_p0 <= `DATAW_P1'b0; n7_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n7_idata_p0 <= `DATAW_P1'b0; n7_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_8;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n8_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n8_ordy_p0[vch]) || id > 0 ) begin 
                        n8_idata_p0 <= packet[id]; n8_ivalid_p0 <= `Enable; n8_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n8_idata_p0 <= `DATAW_P1'b0; n8_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n8_idata_p0 <= `DATAW_P1'b0; n8_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_9;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n9_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n9_ordy_p0[vch]) || id > 0 ) begin 
                        n9_idata_p0 <= packet[id]; n9_ivalid_p0 <= `Enable; n9_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n9_idata_p0 <= `DATAW_P1'b0; n9_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n9_idata_p0 <= `DATAW_P1'b0; n9_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_10;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n10_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n10_ordy_p0[vch]) || id > 0 ) begin 
                        n10_idata_p0 <= packet[id]; n10_ivalid_p0 <= `Enable; n10_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n10_idata_p0 <= `DATAW_P1'b0; n10_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n10_idata_p0 <= `DATAW_P1'b0; n10_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_11;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n11_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n11_ordy_p0[vch]) || id > 0 ) begin 
                        n11_idata_p0 <= packet[id]; n11_ivalid_p0 <= `Enable; n11_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n11_idata_p0 <= `DATAW_P1'b0; n11_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n11_idata_p0 <= `DATAW_P1'b0; n11_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_12;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n12_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n12_ordy_p0[vch]) || id > 0 ) begin 
                        n12_idata_p0 <= packet[id]; n12_ivalid_p0 <= `Enable; n12_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n12_idata_p0 <= `DATAW_P1'b0; n12_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n12_idata_p0 <= `DATAW_P1'b0; n12_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_13;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n13_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n13_ordy_p0[vch]) || id > 0 ) begin 
                        n13_idata_p0 <= packet[id]; n13_ivalid_p0 <= `Enable; n13_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n13_idata_p0 <= `DATAW_P1'b0; n13_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n13_idata_p0 <= `DATAW_P1'b0; n13_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_14;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n14_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n14_ordy_p0[vch]) || id > 0 ) begin 
                        n14_idata_p0 <= packet[id]; n14_ivalid_p0 <= `Enable; n14_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n14_idata_p0 <= `DATAW_P1'b0; n14_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n14_idata_p0 <= `DATAW_P1'b0; n14_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_15;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n15_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n15_ordy_p0[vch]) || id > 0 ) begin 
                        n15_idata_p0 <= packet[id]; n15_ivalid_p0 <= `Enable; n15_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n15_idata_p0 <= `DATAW_P1'b0; n15_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n15_idata_p0 <= `DATAW_P1'b0; n15_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_16;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n16_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 16;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n16_ordy_p0[vch]) || id > 0 ) begin 
                        n16_idata_p0 <= packet[id]; n16_ivalid_p0 <= `Enable; n16_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n16_idata_p0 <= `DATAW_P1'b0; n16_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n16_idata_p0 <= `DATAW_P1'b0; n16_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_17;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n17_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n17_ordy_p0[vch]) || id > 0 ) begin 
                        n17_idata_p0 <= packet[id]; n17_ivalid_p0 <= `Enable; n17_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n17_idata_p0 <= `DATAW_P1'b0; n17_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n17_idata_p0 <= `DATAW_P1'b0; n17_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_18;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n18_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 5;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
        end
        id = 0;                                 
        while ( id < len ) begin
                #(STEP)                         
                /* Packet level flow control */
                if ( (id == 0 && n18_ordy_p0[vch]) || id > 0 ) begin 
                        n18_idata_p0 <= packet[id]; n18_ivalid_p0 <= `Enable; n18_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n18_idata_p0 <= `DATAW_P1'b0; n18_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n18_idata_p0 <= `DATAW_P1'b0; n18_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_m_(num) (dst, vch, len): send a packet from src to dst (Multicast) */
task send_packet_m_19;
input [55:0] dst; //one-hot encoding
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0] packet [0:63]; //64bit data & 2bit type
integer id;
begin
        n19_ivalid_p0 <= `Disable;
        for (id = 0; id < len; id = id+1)
                packet[id] <= 0;
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 1; 
        packet[0][`MDST_MSB:`MDST_LSB] <= dst;    /* Dest ID - onehot encoding (56-bit) (62~7)*/
        packet[0][`MSRC_MSB:`MSRC_LSB] <= 19;     /* Source ID (5-bit) (2~6)*/
        packet[0][`MVCH_MSB:`MVCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Data (64-bit)*/ 
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
        n19_idata_p0 <= `DATAW_P1'b0; n19_ivalid_p0 <= `Disable;  
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from router to dst (Unicast) */
task send_packet_u_0;
input [10:0] dst; // binary_encoding
input [31:0] vch;
input [31:0] len; // packet length
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n0_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP)
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0; // Mul/Uni     
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (11-bit) (62~52)*/
        packet[0][`SRC_MSB:`SRC_LSB] <= 0;     /* Source ID (5-bit) (2~6)*/
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin // body,tail bit 
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit)*/ 
        end 
        id = 0;                                 
        while ( id < len ) begin                
                #(STEP)                         
                /* Packet level flow control */ 
                if ( (id == 0 && n0_ordy_p0[vch]) || id > 0 ) begin 
                        n0_idata_p0 <= packet[id]; n0_ivalid_p0 <= `Enable; n0_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n0_idata_p0 <= `DATAW_P1'b0; n0_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n0_idata_p0 <= `DATAW_P1'b0; n0_ivalid_p0 <= `Disable;   
end             
endtask  

/* send_packet_u_(num)(dst, vch, len): send a packet from router to dst (Unicast) */
task send_packet_u_1;
input [10:0] dst; // binary_encoding
input [31:0] vch;
input [31:0] len; // packet length
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n1_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) // # delay operator
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0; //Mul/Uni     
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (11-bit) (62~52)*/
        packet[0][`SRC_MSB:`SRC_LSB] <= 1;     /* Source ID (5-bit) (2~6)*/
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit 
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit)*/ 
        end 
        id = 0;                                 
        while ( id < len ) begin                
                #(STEP)                         
                /* Packet level flow control */ 
                if ( (id == 0 && n1_ordy_p0[vch]) || id > 0 ) begin 
                        n1_idata_p0 <= packet[id]; n1_ivalid_p0 <= `Enable; n1_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n1_idata_p0 <= `DATAW_P1'b0; n1_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n1_idata_p0 <= `DATAW_P1'b0; n1_ivalid_p0 <= `Disable;   
end             
endtask  

/* send_packet_u_(num)(dst, vch, len): send a packet from router to dst (Unicast) */
task send_packet_u_2;
input [10:0] dst; // binary_encoding
input [31:0] vch;
input [31:0] len; // packet length
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n2_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) // # delay operator
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0; //Mul/Uni     
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (11-bit) (62~52)*/
        packet[0][`SRC_MSB:`SRC_LSB] <= 2;     /* Source ID (5-bit) (2~6)*/
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit 
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit)*/ 
        end 
        id = 0;                                 
        while ( id < len ) begin                
                #(STEP)                         
                /* Packet level flow control */ 
                if ( (id == 0 && n2_ordy_p0[vch]) || id > 0 ) begin 
                        n2_idata_p0 <= packet[id]; n2_ivalid_p0 <= `Enable; n2_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n2_idata_p0 <= `DATAW_P1'b0; n2_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n2_idata_p0 <= `DATAW_P1'b0; n2_ivalid_p0 <= `Disable;   
end             
endtask  

/* send_packet_u_(num)(dst, vch, len): send a packet from router to dst unicast*/
task send_packet_u_3;
input [10:0] dst; // binary_encoding
input [31:0] vch;
input [31:0] len; // packet length
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n3_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) // # delay operator
        if (len == 1) // Header
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0; //Mul/Uni     
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (11-bit) (62~52)*/
        packet[0][`SRC_MSB:`SRC_LSB] <= 3;     /* Source ID (5-bit) (2~6)*/
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (2-bit)    (0~1)*/
        for ( id = 1; id < len; id = id + 1 ) begin //body,tail bit 
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL; 
                else 
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit)*/ 
        end 
        id = 0;                                 
        while ( id < len ) begin                
                #(STEP)                         
                /* Packet level flow control */ 
                if ( (id == 0 && n3_ordy_p0[vch]) || id > 0 ) begin 
                        n3_idata_p0 <= packet[id]; n3_ivalid_p0 <= `Enable; n3_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n3_idata_p0 <= `DATAW_P1'b0; n3_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n3_idata_p0 <= `DATAW_P1'b0; n3_ivalid_p0 <= `Disable;   
end             
endtask  

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_4;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n4_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 4;     
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
                if ( (id == 0 && n4_ordy_p0[vch]) || id > 0 ) begin 
                        n4_idata_p0 <= packet[id]; n4_ivalid_p0 <= `Enable; n4_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n4_idata_p0 <= `DATAW_P1'b0; n4_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n4_idata_p0 <= `DATAW_P1'b0; n4_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_5;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n5_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 5;     
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
                if ( (id == 0 && n5_ordy_p0[vch]) || id > 0 ) begin 
                        n5_idata_p0 <= packet[id]; n5_ivalid_p0 <= `Enable; n5_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n5_idata_p0 <= `DATAW_P1'b0; n5_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n5_idata_p0 <= `DATAW_P1'b0; n5_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_6;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n6_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 6;     
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
                if ( (id == 0 && n6_ordy_p0[vch]) || id > 0 ) begin 
                        n6_idata_p0 <= packet[id]; n6_ivalid_p0 <= `Enable; n6_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n6_idata_p0 <= `DATAW_P1'b0; n6_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n6_idata_p0 <= `DATAW_P1'b0; n6_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_7;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n7_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 7;     
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
                if ( (id == 0 && n7_ordy_p0[vch]) || id > 0 ) begin 
                        n7_idata_p0 <= packet[id]; n7_ivalid_p0 <= `Enable; n7_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n7_idata_p0 <= `DATAW_P1'b0; n7_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n7_idata_p0 <= `DATAW_P1'b0; n7_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_8;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n8_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 8;     
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
                if ( (id == 0 && n8_ordy_p0[vch]) || id > 0 ) begin 
                        n8_idata_p0 <= packet[id]; n8_ivalid_p0 <= `Enable; n8_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n8_idata_p0 <= `DATAW_P1'b0; n8_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n8_idata_p0 <= `DATAW_P1'b0; n8_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_9;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n9_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 9;     
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
                if ( (id == 0 && n9_ordy_p0[vch]) || id > 0 ) begin 
                        n9_idata_p0 <= packet[id]; n9_ivalid_p0 <= `Enable; n9_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n9_idata_p0 <= `DATAW_P1'b0; n9_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n9_idata_p0 <= `DATAW_P1'b0; n9_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_10;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n10_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 10;     
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
                if ( (id == 0 && n10_ordy_p0[vch]) || id > 0 ) begin 
                        n10_idata_p0 <= packet[id]; n10_ivalid_p0 <= `Enable; n10_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n10_idata_p0 <= `DATAW_P1'b0; n10_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n10_idata_p0 <= `DATAW_P1'b0; n10_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_11;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n11_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 11;     
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
                if ( (id == 0 && n11_ordy_p0[vch]) || id > 0 ) begin 
                        n11_idata_p0 <= packet[id]; n11_ivalid_p0 <= `Enable; n11_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n11_idata_p0 <= `DATAW_P1'b0; n11_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n11_idata_p0 <= `DATAW_P1'b0; n11_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_12;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n12_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 12;     
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
                if ( (id == 0 && n12_ordy_p0[vch]) || id > 0 ) begin 
                        n12_idata_p0 <= packet[id]; n12_ivalid_p0 <= `Enable; n12_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n12_idata_p0 <= `DATAW_P1'b0; n12_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n12_idata_p0 <= `DATAW_P1'b0; n12_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_13;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n13_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 13;     
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
                if ( (id == 0 && n13_ordy_p0[vch]) || id > 0 ) begin 
                        n13_idata_p0 <= packet[id]; n13_ivalid_p0 <= `Enable; n13_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n13_idata_p0 <= `DATAW_P1'b0; n13_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n13_idata_p0 <= `DATAW_P1'b0; n13_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_14;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n14_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 14;     
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
                if ( (id == 0 && n14_ordy_p0[vch]) || id > 0 ) begin 
                        n14_idata_p0 <= packet[id]; n14_ivalid_p0 <= `Enable; n14_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n14_idata_p0 <= `DATAW_P1'b0; n14_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n14_idata_p0 <= `DATAW_P1'b0; n14_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_15;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n15_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 15;     
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
                if ( (id == 0 && n15_ordy_p0[vch]) || id > 0 ) begin 
                        n15_idata_p0 <= packet[id]; n15_ivalid_p0 <= `Enable; n15_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n15_idata_p0 <= `DATAW_P1'b0; n15_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n15_idata_p0 <= `DATAW_P1'b0; n15_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_16;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n16_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 16;     
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
                if ( (id == 0 && n16_ordy_p0[vch]) || id > 0 ) begin 
                        n16_idata_p0 <= packet[id]; n16_ivalid_p0 <= `Enable; n16_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n16_idata_p0 <= `DATAW_P1'b0; n16_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n16_idata_p0 <= `DATAW_P1'b0; n16_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_17;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n17_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 17;     
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
                if ( (id == 0 && n17_ordy_p0[vch]) || id > 0 ) begin 
                        n17_idata_p0 <= packet[id]; n17_ivalid_p0 <= `Enable; n17_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n17_idata_p0 <= `DATAW_P1'b0; n17_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n17_idata_p0 <= `DATAW_P1'b0; n17_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from src to dst unicast*/
task send_packet_u_18;
input [10:0] dst; 
input [31:0] vch;
input [31:0] len; 
reg [`DATAW:0]  packet [0:63];
integer id; 
begin      
        n18_ivalid_p0 <= `Disable;   
        for ( id = 0; id < len; id = id + 1 ) 
                packet[id] <= 0; 
        #(STEP) 
        if (len == 1) 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL; 
        else 
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`UM_TYPE] <= 0;   
        packet[0][`DST_MSB:`DST_LSB] <= dst;    
        packet[0][`SRC_MSB:`SRC_LSB] <= 18;     
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
                if ( (id == 0 && n18_ordy_p0[vch]) || id > 0 ) begin 
                        n18_idata_p0 <= packet[id]; n18_ivalid_p0 <= `Enable; n18_ivch_p0 <= vch; id = id + 1; 
                end else begin    
                        n18_idata_p0 <= `DATAW_P1'b0; n18_ivalid_p0 <= `Disable;  
                end 
        end 
        #(STEP) 
        n18_idata_p0 <= `DATAW_P1'b0; n18_ivalid_p0 <= `Disable;   
end             
endtask

/* send_packet_u_(num)(dst, vch, len): send a packet from router to dst (Unicast) */
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
        n19_idata_p0 <= `DATAW_P1'b0; n19_ivalid_p0 <= `Disable;   
end             
endtask


/* noc_reset(): Reset all routers. */ 
task noc_reset; 
begin           
        rst_    <= `Enable_;   
        #(STEP)                
        n0_idata_p0 <= `DATAW_P1'h0; n0_ivalid_p0 <= `Disable; n0_ivch_p0 <= `VCHW_P1'h0;
        n1_idata_p0 <= `DATAW_P1'h0; n1_ivalid_p0 <= `Disable; n1_ivch_p0 <= `VCHW_P1'h0;
        n2_idata_p0 <= `DATAW_P1'h0; n2_ivalid_p0 <= `Disable; n2_ivch_p0 <= `VCHW_P1'h0;
        n3_idata_p0 <= `DATAW_P1'h0; n3_ivalid_p0 <= `Disable; n3_ivch_p0 <= `VCHW_P1'h0;
        n4_idata_p0 <= `DATAW_P1'h0; n4_ivalid_p0 <= `Disable; n4_ivch_p0 <= `VCHW_P1'h0;
        n5_idata_p0 <= `DATAW_P1'h0; n5_ivalid_p0 <= `Disable; n5_ivch_p0 <= `VCHW_P1'h0;
        n6_idata_p0 <= `DATAW_P1'h0; n6_ivalid_p0 <= `Disable; n6_ivch_p0 <= `VCHW_P1'h0;
        n7_idata_p0 <= `DATAW_P1'h0; n7_ivalid_p0 <= `Disable; n7_ivch_p0 <= `VCHW_P1'h0;
        n8_idata_p0 <= `DATAW_P1'h0; n8_ivalid_p0 <= `Disable; n8_ivch_p0 <= `VCHW_P1'h0;
        n9_idata_p0 <= `DATAW_P1'h0; n9_ivalid_p0 <= `Disable; n9_ivch_p0 <= `VCHW_P1'h0;
        n10_idata_p0 <= `DATAW_P1'h0; n10_ivalid_p0 <= `Disable; n10_ivch_p0 <= `VCHW_P1'h0;
        n11_idata_p0 <= `DATAW_P1'h0; n11_ivalid_p0 <= `Disable; n11_ivch_p0 <= `VCHW_P1'h0;
        n12_idata_p0 <= `DATAW_P1'h0; n12_ivalid_p0 <= `Disable; n12_ivch_p0 <= `VCHW_P1'h0;
        n13_idata_p0 <= `DATAW_P1'h0; n13_ivalid_p0 <= `Disable; n13_ivch_p0 <= `VCHW_P1'h0;
        n14_idata_p0 <= `DATAW_P1'h0; n14_ivalid_p0 <= `Disable; n14_ivch_p0 <= `VCHW_P1'h0;
        n15_idata_p0 <= `DATAW_P1'h0; n15_ivalid_p0 <= `Disable; n15_ivch_p0 <= `VCHW_P1'h0;
        n16_idata_p0 <= `DATAW_P1'h0; n16_ivalid_p0 <= `Disable; n16_ivch_p0 <= `VCHW_P1'h0;
        n17_idata_p0 <= `DATAW_P1'h0; n17_ivalid_p0 <= `Disable; n17_ivch_p0 <= `VCHW_P1'h0;
        n18_idata_p0 <= `DATAW_P1'h0; n18_ivalid_p0 <= `Disable; n18_ivch_p0 <= `VCHW_P1'h0;
        n19_idata_p0 <= `DATAW_P1'h0; n19_ivalid_p0 <= `Disable; n19_ivch_p0 <= `VCHW_P1'h0;
        #(STEP)                
        rst_    <= `Disable_;  

end             
endtask         

endmodule 
