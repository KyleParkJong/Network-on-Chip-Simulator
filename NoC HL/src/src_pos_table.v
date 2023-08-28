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
            5'd0  : src_pos = 2'b01;  
            5'd1  : src_pos = 2'b01;  
            5'd2  : src_pos = 2'b10;  
            5'd3  : src_pos = 2'b10;  
            5'd4  : src_pos = 2'b01;  
            5'd5  : src_pos = 2'b01;  
            5'd6  : src_pos = 2'b10;  
            5'd7  : src_pos = 2'b10;  
            5'd8  : src_pos = 2'b00;  
            5'd9  : src_pos = 2'b00;  
            5'd10 : src_pos = 2'b11;  
            5'd11 : src_pos = 2'b11;  
            5'd12 : src_pos = 2'b00;  
            5'd13 : src_pos = 2'b00;  
            5'd14 : src_pos = 2'b11;  
            5'd15 : src_pos = 2'b11;  
            5'd16 : src_pos = 2'b00;  
            5'd17 : src_pos = 2'b00;  
            5'd18 : src_pos = 2'b11;  
            5'd19 : src_pos = 2'b11;  
            default : src_pos = 2'b10;
        endcase    
    end

endmodule