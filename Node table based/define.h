/* Common definitions */           
`define Enable          1'b1       
`define Disable         1'b0       
`define Enable_         1'b0       
`define Disable_        1'b1       
`define High            1'b1       
`define Low             1'b0       
`define Write           1'b1       
`define Read            1'b0       
`define NULL            0   

/*packet generation*/
`define PCK_LEN			63
`define MDST_LEN    	55
`define UDST_LEN		10
`define CLEN			31

/* Data width (64-bit data + 2-bit type) */ 
`define DATAW           65                  
`define DATAW_P1        66 
`define UM_TYPE			63                 
`define MDST_LSB        7                  
`define MDST_MSB        62
`define MSRC_LSB        2                   
`define MSRC_MSB        6
`define MVCH_LSB        0                 
`define MVCH_MSB        1
`define DST_LSB         52                   
`define DST_MSB         62                 
`define SRC_LSB         2                  
`define SRC_MSB         6                  
`define VCH_LSB         0                  
`define VCH_MSB         1                  
`define TYPE_LSB        64                  
`define TYPE_MSB        65                 

/* Flit type */                 
`define TYPEW           1      
`define TYPEW_P1        2       
`define TYPE_HEAD       2'b01  
`define TYPE_TAIL       2'b10  
`define TYPE_HEADTAIL   2'b11  
`define TYPE_DATA       2'b00  
`define UM				0
`define	MADDR			55
`define	UADDR			10

/* Foward & abosrb */
`define	FWDAB			0
`define ADDR_LSB		0


/* Input FIFO (4-element) */ 
`define FIFO            16 
`define FIFO_P1         17 
`define FIFOD           4 
`define FIFOD_P1        5 
`define PKTLEN          8 
`define PKTLEN_P1       9 

/* Port number (5-port) */        
`define PORT            4         
`define PORT_P1         5         
`define PORTW           2         
`define PORTW_P1        3         

/* Vch number (1-VC) */   
`define VCH             0 
`define VCH_P1          1 
`define VCHW            0 
`define VCHW_P1         1 

/* Node number (16-node) */        
`define NODE            15         
`define NODE_P1         16         
`define NODEW           3         
`define NODEW_P1        4         

/* Dimenion-order routing */
`define ENTRYW          3         
`define ENTRYW_P1       4         
`define ARRAYW          3         
`define ARRAYW_P1       3               
`define ARRAY_DIV2      2         

