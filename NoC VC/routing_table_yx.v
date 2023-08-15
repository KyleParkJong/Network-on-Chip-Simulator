`include "define.v" 
module routing_table_yx(
    mdst_xpos,
    mdst_ypos,
    port
    );

parameter MY_XPOS = 0;
parameter MY_YPOS = 0;

input   [2:0]   mdst_xpos;        
input   [1:0]   mdst_ypos;        
output	[`PORTW:0]	    port;
reg 	[`PORTW:0]	    port;

/* YX DOR */
generate
if (MY_XPOS == 0 && MY_YPOS == 0) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 4;
            5'b00001 : port = 2;
            5'b00010 : port = 2;
            5'b00011 : port = 2;
            5'b00100 : port = 1;
            5'b00101 : port = 2;
            5'b00110 : port = 2;
            5'b00111 : port = 2;
            5'b01000 : port = 1;
            5'b01001 : port = 2;
            5'b01010 : port = 2;
            5'b01011 : port = 2;
            5'b01100 : port = 1;
            5'b01101 : port = 2;
            5'b01110 : port = 2;
            5'b01111 : port = 2;
            5'b10000 : port = 1;
            5'b10001 : port = 2;
            5'b10010 : port = 2;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 0 && MY_YPOS == 1)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 4;
            5'b00010 : port = 2;
            5'b00011 : port = 2;
            5'b00100 : port = 0;
            5'b00101 : port = 1;
            5'b00110 : port = 2;
            5'b00111 : port = 2;
            5'b01000 : port = 0;
            5'b01001 : port = 1;
            5'b01010 : port = 2;
            5'b01011 : port = 2;
            5'b01100 : port = 0;
            5'b01101 : port = 1;
            5'b01110 : port = 2;
            5'b01111 : port = 2;
            5'b10000 : port = 0;
            5'b10001 : port = 1;
            5'b10010 : port = 2;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 0 && MY_YPOS == 2)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 0;
            5'b00010 : port = 4;
            5'b00011 : port = 2;
            5'b00100 : port = 0;
            5'b00101 : port = 0;
            5'b00110 : port = 1;
            5'b00111 : port = 2;
            5'b01000 : port = 0;
            5'b01001 : port = 0;
            5'b01010 : port = 1;
            5'b01011 : port = 2;
            5'b01100 : port = 0;
            5'b01101 : port = 0;
            5'b01110 : port = 1;
            5'b01111 : port = 2;
            5'b10000 : port = 0;
            5'b10001 : port = 0;
            5'b10010 : port = 1;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 0 && MY_YPOS == 3)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 0;
            5'b00010 : port = 0;
            5'b00011 : port = 4;
            5'b00100 : port = 0;
            5'b00101 : port = 0;
            5'b00110 : port = 0;
            5'b00111 : port = 1;
            5'b01000 : port = 0;
            5'b01001 : port = 0;
            5'b01010 : port = 0;
            5'b01011 : port = 1;
            5'b01100 : port = 0;
            5'b01101 : port = 0;
            5'b01110 : port = 0;
            5'b01111 : port = 1;
            5'b10000 : port = 0;
            5'b10001 : port = 0;
            5'b10010 : port = 0;
            5'b10011 : port = 1;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 1 && MY_YPOS == 0)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 3;
            5'b00001 : port = 2;
            5'b00010 : port = 2;
            5'b00011 : port = 2;
            5'b00100 : port = 4;
            5'b00101 : port = 2;
            5'b00110 : port = 2;
            5'b00111 : port = 2;
            5'b01000 : port = 1;
            5'b01001 : port = 2;
            5'b01010 : port = 2;
            5'b01011 : port = 2;
            5'b01100 : port = 1;
            5'b01101 : port = 2;
            5'b01110 : port = 2;
            5'b01111 : port = 2;
            5'b10000 : port = 1;
            5'b10001 : port = 2;
            5'b10010 : port = 2;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 1 && MY_YPOS == 1)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 3;
            5'b00010 : port = 2;
            5'b00011 : port = 2;
            5'b00100 : port = 0;
            5'b00101 : port = 4;
            5'b00110 : port = 2;
            5'b00111 : port = 2;
            5'b01000 : port = 0;
            5'b01001 : port = 1;
            5'b01010 : port = 2;
            5'b01011 : port = 2;
            5'b01100 : port = 0;
            5'b01101 : port = 1;
            5'b01110 : port = 2;
            5'b01111 : port = 2;
            5'b10000 : port = 0;
            5'b10001 : port = 1;
            5'b10010 : port = 2;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 1 && MY_YPOS == 2)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 0;
            5'b00010 : port = 3;
            5'b00011 : port = 2;
            5'b00100 : port = 0;
            5'b00101 : port = 0;
            5'b00110 : port = 4;
            5'b00111 : port = 2;
            5'b01000 : port = 0;
            5'b01001 : port = 0;
            5'b01010 : port = 1;
            5'b01011 : port = 2;
            5'b01100 : port = 0;
            5'b01101 : port = 0;
            5'b01110 : port = 1;
            5'b01111 : port = 2;
            5'b10000 : port = 0;
            5'b10001 : port = 0;
            5'b10010 : port = 1;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 1 && MY_YPOS == 3)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 0;
            5'b00010 : port = 0;
            5'b00011 : port = 3;
            5'b00100 : port = 0;
            5'b00101 : port = 0;
            5'b00110 : port = 0;
            5'b00111 : port = 4;
            5'b01000 : port = 0;
            5'b01001 : port = 0;
            5'b01010 : port = 0;
            5'b01011 : port = 1;
            5'b01100 : port = 0;
            5'b01101 : port = 0;
            5'b01110 : port = 0;
            5'b01111 : port = 1;
            5'b10000 : port = 0;
            5'b10001 : port = 0;
            5'b10010 : port = 0;
            5'b10011 : port = 1;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 2 && MY_YPOS == 0)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 3;
            5'b00001 : port = 2;
            5'b00010 : port = 2;
            5'b00011 : port = 2;
            5'b00100 : port = 3;
            5'b00101 : port = 2;
            5'b00110 : port = 2;
            5'b00111 : port = 2;
            5'b01000 : port = 4;
            5'b01001 : port = 2;
            5'b01010 : port = 2;
            5'b01011 : port = 2;
            5'b01100 : port = 1;
            5'b01101 : port = 2;
            5'b01110 : port = 2;
            5'b01111 : port = 2;
            5'b10000 : port = 1;
            5'b10001 : port = 2;
            5'b10010 : port = 2;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 2 && MY_YPOS == 1)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 3;
            5'b00010 : port = 2;
            5'b00011 : port = 2;
            5'b00100 : port = 0;
            5'b00101 : port = 3;
            5'b00110 : port = 2;
            5'b00111 : port = 2;
            5'b01000 : port = 0;
            5'b01001 : port = 4;
            5'b01010 : port = 2;
            5'b01011 : port = 2;
            5'b01100 : port = 0;
            5'b01101 : port = 1;
            5'b01110 : port = 2;
            5'b01111 : port = 2;
            5'b10000 : port = 0;
            5'b10001 : port = 1;
            5'b10010 : port = 2;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 2 && MY_YPOS == 2)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 0;
            5'b00010 : port = 3;
            5'b00011 : port = 2;
            5'b00100 : port = 0;
            5'b00101 : port = 0;
            5'b00110 : port = 3;
            5'b00111 : port = 2;
            5'b01000 : port = 0;
            5'b01001 : port = 0;
            5'b01010 : port = 4;
            5'b01011 : port = 2;
            5'b01100 : port = 0;
            5'b01101 : port = 0;
            5'b01110 : port = 1;
            5'b01111 : port = 2;
            5'b10000 : port = 0;
            5'b10001 : port = 0;
            5'b10010 : port = 1;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 2 && MY_YPOS == 3)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 0;
            5'b00010 : port = 0;
            5'b00011 : port = 3;
            5'b00100 : port = 0;
            5'b00101 : port = 0;
            5'b00110 : port = 0;
            5'b00111 : port = 3;
            5'b01000 : port = 0;
            5'b01001 : port = 0;
            5'b01010 : port = 0;
            5'b01011 : port = 4;
            5'b01100 : port = 0;
            5'b01101 : port = 0;
            5'b01110 : port = 0;
            5'b01111 : port = 1;
            5'b10000 : port = 0;
            5'b10001 : port = 0;
            5'b10010 : port = 0;
            5'b10011 : port = 1;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 3 && MY_YPOS == 0)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 3;
            5'b00001 : port = 2;
            5'b00010 : port = 2;
            5'b00011 : port = 2;
            5'b00100 : port = 3;
            5'b00101 : port = 2;
            5'b00110 : port = 2;
            5'b00111 : port = 2;
            5'b01000 : port = 3;
            5'b01001 : port = 2;
            5'b01010 : port = 2;
            5'b01011 : port = 2;
            5'b01100 : port = 4;
            5'b01101 : port = 2;
            5'b01110 : port = 2;
            5'b01111 : port = 2;
            5'b10000 : port = 1;
            5'b10001 : port = 2;
            5'b10010 : port = 2;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 3 && MY_YPOS == 1)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 3;
            5'b00010 : port = 2;
            5'b00011 : port = 2;
            5'b00100 : port = 0;
            5'b00101 : port = 3;
            5'b00110 : port = 2;
            5'b00111 : port = 2;
            5'b01000 : port = 0;
            5'b01001 : port = 3;
            5'b01010 : port = 2;
            5'b01011 : port = 2;
            5'b01100 : port = 0;
            5'b01101 : port = 4;
            5'b01110 : port = 2;
            5'b01111 : port = 2;
            5'b10000 : port = 0;
            5'b10001 : port = 1;
            5'b10010 : port = 2;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 3 && MY_YPOS == 2)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 0;
            5'b00010 : port = 3;
            5'b00011 : port = 2;
            5'b00100 : port = 0;
            5'b00101 : port = 0;
            5'b00110 : port = 3;
            5'b00111 : port = 2;
            5'b01000 : port = 0;
            5'b01001 : port = 0;
            5'b01010 : port = 3;
            5'b01011 : port = 2;
            5'b01100 : port = 0;
            5'b01101 : port = 0;
            5'b01110 : port = 4;
            5'b01111 : port = 2;
            5'b10000 : port = 0;
            5'b10001 : port = 0;
            5'b10010 : port = 1;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 3 && MY_YPOS == 3)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 0;
            5'b00010 : port = 0;
            5'b00011 : port = 3;
            5'b00100 : port = 0;
            5'b00101 : port = 0;
            5'b00110 : port = 0;
            5'b00111 : port = 3;
            5'b01000 : port = 0;
            5'b01001 : port = 0;
            5'b01010 : port = 0;
            5'b01011 : port = 3;
            5'b01100 : port = 0;
            5'b01101 : port = 0;
            5'b01110 : port = 0;
            5'b01111 : port = 4;
            5'b10000 : port = 0;
            5'b10001 : port = 0;
            5'b10010 : port = 0;
            5'b10011 : port = 1;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 4 && MY_YPOS == 0)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 3;
            5'b00001 : port = 2;
            5'b00010 : port = 2;
            5'b00011 : port = 2;
            5'b00100 : port = 3;
            5'b00101 : port = 2;
            5'b00110 : port = 2;
            5'b00111 : port = 2;
            5'b01000 : port = 3;
            5'b01001 : port = 2;
            5'b01010 : port = 2;
            5'b01011 : port = 2;
            5'b01100 : port = 3;
            5'b01101 : port = 2;
            5'b01110 : port = 2;
            5'b01111 : port = 2;
            5'b10000 : port = 4;
            5'b10001 : port = 2;
            5'b10010 : port = 2;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 4 && MY_YPOS == 1)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 3;
            5'b00010 : port = 2;
            5'b00011 : port = 2;
            5'b00100 : port = 0;
            5'b00101 : port = 3;
            5'b00110 : port = 2;
            5'b00111 : port = 2;
            5'b01000 : port = 0;
            5'b01001 : port = 3;
            5'b01010 : port = 2;
            5'b01011 : port = 2;
            5'b01100 : port = 0;
            5'b01101 : port = 3;
            5'b01110 : port = 2;
            5'b01111 : port = 2;
            5'b10000 : port = 0;
            5'b10001 : port = 4;
            5'b10010 : port = 2;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 4 && MY_YPOS == 2)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 0;
            5'b00010 : port = 3;
            5'b00011 : port = 2;
            5'b00100 : port = 0;
            5'b00101 : port = 0;
            5'b00110 : port = 3;
            5'b00111 : port = 2;
            5'b01000 : port = 0;
            5'b01001 : port = 0;
            5'b01010 : port = 3;
            5'b01011 : port = 2;
            5'b01100 : port = 0;
            5'b01101 : port = 0;
            5'b01110 : port = 3;
            5'b01111 : port = 2;
            5'b10000 : port = 0;
            5'b10001 : port = 0;
            5'b10010 : port = 4;
            5'b10011 : port = 2;
            default  : port = `PORT_P1'bx;
        endcase
    end
end else if ((MY_XPOS == 4 && MY_YPOS == 3)) begin
    always @(*) begin
        case ({mdst_xpos, mdst_ypos})
            5'b00000 : port = 0;
            5'b00001 : port = 0;
            5'b00010 : port = 0;
            5'b00011 : port = 3;
            5'b00100 : port = 0;
            5'b00101 : port = 0;
            5'b00110 : port = 0;
            5'b00111 : port = 3;
            5'b01000 : port = 0;
            5'b01001 : port = 0;
            5'b01010 : port = 0;
            5'b01011 : port = 3;
            5'b01100 : port = 0;
            5'b01101 : port = 0;
            5'b01110 : port = 0;
            5'b01111 : port = 3;
            5'b10000 : port = 0;
            5'b10001 : port = 0;
            5'b10010 : port = 0;
            5'b10011 : port = 4;
            default  : port = `PORT_P1'bx;
        endcase
    end
end
endgenerate
endmodule