module src_pos_table(
    src_dst,
    src_pos
);

    /*
        2'b00 : 1 Quadrant
        2'b01 : 2 Quadrant
        2'b10 : 3 Quadrant
        2'b11 : 4 Quadrant
    */

    input [4:0] src_dst;
    output reg [1:0] src_pos;

    always @(*) begin
        case(src_dst) 
            5'b00000  : src_pos = 2'b01;  
            5'b00001  : src_pos = 2'b01;  
            5'b00010  : src_pos = 2'b10;  
            5'b00011  : src_pos = 2'b10;  
            5'b00100  : src_pos = 2'b01;  
            5'b00101  : src_pos = 2'b01;  
            5'b00110  : src_pos = 2'b10;  
            5'b00111  : src_pos = 2'b10;  
            5'b01000  : src_pos = 2'b00;  
            5'b01001  : src_pos = 2'b00;  
            5'b01010 : src_pos = 2'b11;  
            5'b01011 : src_pos = 2'b11;  
            5'b01100 : src_pos = 2'b00;  
            5'b01101 : src_pos = 2'b00;  
            5'b01110 : src_pos = 2'b11;  
            5'b01111 : src_pos = 2'b11;  
            5'b10000 : src_pos = 2'b00;  
            5'b10001 : src_pos = 2'b00;  
            5'b10010 : src_pos = 2'b11;  
            5'b10011 : src_pos = 2'b11;  
            default : src_pos = 2'b10;
        endcase    
    end


endmodule