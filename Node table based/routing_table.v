`include "define.h" 
module routing_table(
    mdst_xpos,
    mdst_ypos,
    port
    );

parameter MY_XPOS = 0;
parameter MY_YPOS = 0;

input   [2:0]   mdst_xpos;        
input   [1:0]   mdst_ypos;        
output	[`PORTW:0]	    port;

reg     [`PORTW:0]      lut;   // LUT
reg 	[`PORTW:0]	    port;

reg [2:0] my_xpos;      // Verilog : case-sensitive
reg [1:0] my_ypos;

always @(*) begin
my_xpos = MY_XPOS;
my_ypos = MY_YPOS;
case ({my_xpos,my_ypos}) 
    5'b00000 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 4;
                5'b00001 : lut = 2;
                5'b00010 : lut = 2;
                5'b00011 : lut = 2;
                5'b00100 : lut = 1;
                5'b00101 : lut = 2;
                5'b00110 : lut = 2;
                5'b00111 : lut = 2;
                5'b01000 : lut = 1;
                5'b01001 : lut = 2;
                5'b01010 : lut = 2;
                5'b01011 : lut = 2;
                5'b01100 : lut = 1;
                5'b01101 : lut = 2;
                5'b01110 : lut = 2;
                5'b01111 : lut = 2;
                5'b10000 : lut = 1;
                5'b10001 : lut = 2;
                5'b10010 : lut = 2;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b00001 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 4;
                5'b00010 : lut = 2;
                5'b00011 : lut = 2;
                5'b00100 : lut = 0;
                5'b00101 : lut = 1;
                5'b00110 : lut = 2;
                5'b00111 : lut = 2;
                5'b01000 : lut = 0;
                5'b01001 : lut = 1;
                5'b01010 : lut = 2;
                5'b01011 : lut = 2;
                5'b01100 : lut = 0;
                5'b01101 : lut = 1;
                5'b01110 : lut = 2;
                5'b01111 : lut = 2;
                5'b10000 : lut = 0;
                5'b10001 : lut = 1;
                5'b10010 : lut = 2;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b00010 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 0;
                5'b00010 : lut = 4;
                5'b00011 : lut = 2;
                5'b00100 : lut = 0;
                5'b00101 : lut = 0;
                5'b00110 : lut = 1;
                5'b00111 : lut = 2;
                5'b01000 : lut = 0;
                5'b01001 : lut = 0;
                5'b01010 : lut = 1;
                5'b01011 : lut = 2;
                5'b01100 : lut = 0;
                5'b01101 : lut = 0;
                5'b01110 : lut = 1;
                5'b01111 : lut = 2;
                5'b10000 : lut = 0;
                5'b10001 : lut = 0;
                5'b10010 : lut = 1;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b00011 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 0;
                5'b00010 : lut = 0;
                5'b00011 : lut = 4;
                5'b00100 : lut = 0;
                5'b00101 : lut = 0;
                5'b00110 : lut = 0;
                5'b00111 : lut = 1;
                5'b01000 : lut = 0;
                5'b01001 : lut = 0;
                5'b01010 : lut = 0;
                5'b01011 : lut = 1;
                5'b01100 : lut = 0;
                5'b01101 : lut = 0;
                5'b01110 : lut = 0;
                5'b01111 : lut = 1;
                5'b10000 : lut = 0;
                5'b10001 : lut = 0;
                5'b10010 : lut = 0;
                5'b10011 : lut = 1;
                default  : lut = 4;
            endcase
            end
    5'b00100 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 3;
                5'b00001 : lut = 2;
                5'b00010 : lut = 2;
                5'b00011 : lut = 2;
                5'b00100 : lut = 4;
                5'b00101 : lut = 2;
                5'b00110 : lut = 2;
                5'b00111 : lut = 2;
                5'b01000 : lut = 1;
                5'b01001 : lut = 2;
                5'b01010 : lut = 2;
                5'b01011 : lut = 2;
                5'b01100 : lut = 1;
                5'b01101 : lut = 2;
                5'b01110 : lut = 2;
                5'b01111 : lut = 2;
                5'b10000 : lut = 1;
                5'b10001 : lut = 2;
                5'b10010 : lut = 2;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b00101 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 3;
                5'b00010 : lut = 2;
                5'b00011 : lut = 2;
                5'b00100 : lut = 0;
                5'b00101 : lut = 4;
                5'b00110 : lut = 2;
                5'b00111 : lut = 2;
                5'b01000 : lut = 0;
                5'b01001 : lut = 1;
                5'b01010 : lut = 2;
                5'b01011 : lut = 2;
                5'b01100 : lut = 0;
                5'b01101 : lut = 1;
                5'b01110 : lut = 2;
                5'b01111 : lut = 2;
                5'b10000 : lut = 0;
                5'b10001 : lut = 1;
                5'b10010 : lut = 2;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b00110 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 0;
                5'b00010 : lut = 3;
                5'b00011 : lut = 2;
                5'b00100 : lut = 0;
                5'b00101 : lut = 0;
                5'b00110 : lut = 4;
                5'b00111 : lut = 2;
                5'b01000 : lut = 0;
                5'b01001 : lut = 0;
                5'b01010 : lut = 1;
                5'b01011 : lut = 2;
                5'b01100 : lut = 0;
                5'b01101 : lut = 0;
                5'b01110 : lut = 1;
                5'b01111 : lut = 2;
                5'b10000 : lut = 0;
                5'b10001 : lut = 0;
                5'b10010 : lut = 1;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b00111 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 0;
                5'b00010 : lut = 0;
                5'b00011 : lut = 3;
                5'b00100 : lut = 0;
                5'b00101 : lut = 0;
                5'b00110 : lut = 0;
                5'b00111 : lut = 4;
                5'b01000 : lut = 0;
                5'b01001 : lut = 0;
                5'b01010 : lut = 0;
                5'b01011 : lut = 1;
                5'b01100 : lut = 0;
                5'b01101 : lut = 0;
                5'b01110 : lut = 0;
                5'b01111 : lut = 1;
                5'b10000 : lut = 0;
                5'b10001 : lut = 0;
                5'b10010 : lut = 0;
                5'b10011 : lut = 1;
                default  : lut = 4;
            endcase
            end
    5'b01000 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 3;
                5'b00001 : lut = 2;
                5'b00010 : lut = 2;
                5'b00011 : lut = 2;
                5'b00100 : lut = 3;
                5'b00101 : lut = 2;
                5'b00110 : lut = 2;
                5'b00111 : lut = 2;
                5'b01000 : lut = 4;
                5'b01001 : lut = 2;
                5'b01010 : lut = 2;
                5'b01011 : lut = 2;
                5'b01100 : lut = 1;
                5'b01101 : lut = 2;
                5'b01110 : lut = 2;
                5'b01111 : lut = 2;
                5'b10000 : lut = 1;
                5'b10001 : lut = 2;
                5'b10010 : lut = 2;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b01001 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 3;
                5'b00010 : lut = 2;
                5'b00011 : lut = 2;
                5'b00100 : lut = 0;
                5'b00101 : lut = 3;
                5'b00110 : lut = 2;
                5'b00111 : lut = 2;
                5'b01000 : lut = 0;
                5'b01001 : lut = 4;
                5'b01010 : lut = 2;
                5'b01011 : lut = 2;
                5'b01100 : lut = 0;
                5'b01101 : lut = 1;
                5'b01110 : lut = 2;
                5'b01111 : lut = 2;
                5'b10000 : lut = 0;
                5'b10001 : lut = 1;
                5'b10010 : lut = 2;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b01010 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 0;
                5'b00010 : lut = 3;
                5'b00011 : lut = 2;
                5'b00100 : lut = 0;
                5'b00101 : lut = 0;
                5'b00110 : lut = 3;
                5'b00111 : lut = 2;
                5'b01000 : lut = 0;
                5'b01001 : lut = 0;
                5'b01010 : lut = 4;
                5'b01011 : lut = 2;
                5'b01100 : lut = 0;
                5'b01101 : lut = 0;
                5'b01110 : lut = 1;
                5'b01111 : lut = 2;
                5'b10000 : lut = 0;
                5'b10001 : lut = 0;
                5'b10010 : lut = 1;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b01011 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 0;
                5'b00010 : lut = 0;
                5'b00011 : lut = 3;
                5'b00100 : lut = 0;
                5'b00101 : lut = 0;
                5'b00110 : lut = 0;
                5'b00111 : lut = 3;
                5'b01000 : lut = 0;
                5'b01001 : lut = 0;
                5'b01010 : lut = 0;
                5'b01011 : lut = 4;
                5'b01100 : lut = 0;
                5'b01101 : lut = 0;
                5'b01110 : lut = 0;
                5'b01111 : lut = 1;
                5'b10000 : lut = 0;
                5'b10001 : lut = 0;
                5'b10010 : lut = 0;
                5'b10011 : lut = 1;
                default  : lut = 4;
            endcase
            end
    5'b01100 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 3;
                5'b00001 : lut = 2;
                5'b00010 : lut = 2;
                5'b00011 : lut = 2;
                5'b00100 : lut = 3;
                5'b00101 : lut = 2;
                5'b00110 : lut = 2;
                5'b00111 : lut = 2;
                5'b01000 : lut = 3;
                5'b01001 : lut = 2;
                5'b01010 : lut = 2;
                5'b01011 : lut = 2;
                5'b01100 : lut = 4;
                5'b01101 : lut = 2;
                5'b01110 : lut = 2;
                5'b01111 : lut = 2;
                5'b10000 : lut = 1;
                5'b10001 : lut = 2;
                5'b10010 : lut = 2;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b01101 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 3;
                5'b00010 : lut = 2;
                5'b00011 : lut = 2;
                5'b00100 : lut = 0;
                5'b00101 : lut = 3;
                5'b00110 : lut = 2;
                5'b00111 : lut = 2;
                5'b01000 : lut = 0;
                5'b01001 : lut = 3;
                5'b01010 : lut = 2;
                5'b01011 : lut = 2;
                5'b01100 : lut = 0;
                5'b01101 : lut = 4;
                5'b01110 : lut = 2;
                5'b01111 : lut = 2;
                5'b10000 : lut = 0;
                5'b10001 : lut = 1;
                5'b10010 : lut = 2;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b01110 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 0;
                5'b00010 : lut = 3;
                5'b00011 : lut = 2;
                5'b00100 : lut = 0;
                5'b00101 : lut = 0;
                5'b00110 : lut = 3;
                5'b00111 : lut = 2;
                5'b01000 : lut = 0;
                5'b01001 : lut = 0;
                5'b01010 : lut = 3;
                5'b01011 : lut = 2;
                5'b01100 : lut = 0;
                5'b01101 : lut = 0;
                5'b01110 : lut = 4;
                5'b01111 : lut = 2;
                5'b10000 : lut = 0;
                5'b10001 : lut = 0;
                5'b10010 : lut = 1;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b01111 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 0;
                5'b00010 : lut = 0;
                5'b00011 : lut = 3;
                5'b00100 : lut = 0;
                5'b00101 : lut = 0;
                5'b00110 : lut = 0;
                5'b00111 : lut = 3;
                5'b01000 : lut = 0;
                5'b01001 : lut = 0;
                5'b01010 : lut = 0;
                5'b01011 : lut = 3;
                5'b01100 : lut = 0;
                5'b01101 : lut = 0;
                5'b01110 : lut = 0;
                5'b01111 : lut = 4;
                5'b10000 : lut = 0;
                5'b10001 : lut = 0;
                5'b10010 : lut = 0;
                5'b10011 : lut = 1;
                default  : lut = 4;
            endcase
            end
    5'b10000 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 3;
                5'b00001 : lut = 2;
                5'b00010 : lut = 2;
                5'b00011 : lut = 2;
                5'b00100 : lut = 3;
                5'b00101 : lut = 2;
                5'b00110 : lut = 2;
                5'b00111 : lut = 2;
                5'b01000 : lut = 3;
                5'b01001 : lut = 2;
                5'b01010 : lut = 2;
                5'b01011 : lut = 2;
                5'b01100 : lut = 3;
                5'b01101 : lut = 2;
                5'b01110 : lut = 2;
                5'b01111 : lut = 2;
                5'b10000 : lut = 4;
                5'b10001 : lut = 2;
                5'b10010 : lut = 2;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b10001 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 3;
                5'b00010 : lut = 2;
                5'b00011 : lut = 2;
                5'b00100 : lut = 0;
                5'b00101 : lut = 3;
                5'b00110 : lut = 2;
                5'b00111 : lut = 2;
                5'b01000 : lut = 0;
                5'b01001 : lut = 3;
                5'b01010 : lut = 2;
                5'b01011 : lut = 2;
                5'b01100 : lut = 0;
                5'b01101 : lut = 3;
                5'b01110 : lut = 2;
                5'b01111 : lut = 2;
                5'b10000 : lut = 0;
                5'b10001 : lut = 4;
                5'b10010 : lut = 2;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b10010 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 0;
                5'b00010 : lut = 3;
                5'b00011 : lut = 2;
                5'b00100 : lut = 0;
                5'b00101 : lut = 0;
                5'b00110 : lut = 3;
                5'b00111 : lut = 2;
                5'b01000 : lut = 0;
                5'b01001 : lut = 0;
                5'b01010 : lut = 3;
                5'b01011 : lut = 2;
                5'b01100 : lut = 0;
                5'b01101 : lut = 0;
                5'b01110 : lut = 3;
                5'b01111 : lut = 2;
                5'b10000 : lut = 0;
                5'b10001 : lut = 0;
                5'b10010 : lut = 4;
                5'b10011 : lut = 2;
                default  : lut = 4;
            endcase
            end
    5'b10011 : begin
            case ({mdst_xpos, mdst_ypos})
                5'b00000 : lut = 0;
                5'b00001 : lut = 0;
                5'b00010 : lut = 0;
                5'b00011 : lut = 3;
                5'b00100 : lut = 0;
                5'b00101 : lut = 0;
                5'b00110 : lut = 0;
                5'b00111 : lut = 3;
                5'b01000 : lut = 0;
                5'b01001 : lut = 0;
                5'b01010 : lut = 0;
                5'b01011 : lut = 3;
                5'b01100 : lut = 0;
                5'b01101 : lut = 0;
                5'b01110 : lut = 0;
                5'b01111 : lut = 3;
                5'b10000 : lut = 0;
                5'b10001 : lut = 0;
                5'b10010 : lut = 0;
                5'b10011 : lut = 4;
                default  : lut = 4;
            endcase
            end
    default : lut = 4;
endcase
    port = lut;
end

endmodule