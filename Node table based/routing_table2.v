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

reg     [`PORTW:0] rt [20:0];   // Routing Table 
reg 	[`PORTW:0]	    port;

genvar i;

generate
if (MY_XPOS == 0 && MY_YPOS == 0) begin
    always @(*) begin
        rt[0]  = 4;
        rt[1]  = 2;
        rt[2]  = 2;
        rt[3]  = 2;
        rt[4]  = 1;
        rt[5]  = 2;
        rt[6]  = 2;
        rt[7]  = 2;
        rt[8]  = 1;
        rt[9]  = 2;
        rt[10] = 2;
        rt[11] = 2;
        rt[12] = 1;
        rt[13] = 2;
        rt[14] = 2;
        rt[15] = 2;
        rt[16] = 1;
        rt[17] = 2;
        rt[18] = 2;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 0 && MY_YPOS == 1)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 4;
        rt[2]  = 2;
        rt[3]  = 2;
        rt[4]  = 0;
        rt[5]  = 1;
        rt[6]  = 2;
        rt[7]  = 2;
        rt[8]  = 0;
        rt[9]  = 1;
        rt[10] = 2;
        rt[11] = 2;
        rt[12] = 0;
        rt[13] = 1;
        rt[14] = 2;
        rt[15] = 2;
        rt[16] = 0;
        rt[17] = 1;
        rt[18] = 2;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 0 && MY_YPOS == 2)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 0;
        rt[2]  = 4;
        rt[3]  = 2;
        rt[4]  = 0;
        rt[5]  = 0;
        rt[6]  = 1;
        rt[7]  = 2;
        rt[8]  = 0;
        rt[9]  = 0;
        rt[10] = 1;
        rt[11] = 2;
        rt[12] = 0;
        rt[13] = 0;
        rt[14] = 1;
        rt[15] = 2;
        rt[16] = 0;
        rt[17] = 0;
        rt[18] = 1;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 0 && MY_YPOS == 3)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 0;
        rt[2]  = 0;
        rt[3]  = 4;
        rt[4]  = 0;
        rt[5]  = 0;
        rt[6]  = 0;
        rt[7]  = 1;
        rt[8]  = 0;
        rt[9]  = 0;
        rt[10] = 0;
        rt[11] = 1;
        rt[12] = 0;
        rt[13] = 0;
        rt[14] = 0;
        rt[15] = 1;
        rt[16] = 0;
        rt[17] = 0;
        rt[18] = 0;
        rt[19] = 1;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 1 && MY_YPOS == 0)) begin
    always @(*) begin
        rt[0]  = 3;
        rt[1]  = 2;
        rt[2]  = 2;
        rt[3]  = 2;
        rt[4]  = 4;
        rt[5]  = 2;
        rt[6]  = 2;
        rt[7]  = 2;
        rt[8]  = 1;
        rt[9]  = 2;
        rt[10] = 2;
        rt[11] = 2;
        rt[12] = 1;
        rt[13] = 2;
        rt[14] = 2;
        rt[15] = 2;
        rt[16] = 1;
        rt[17] = 2;
        rt[18] = 2;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 1 && MY_YPOS == 1)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 3;
        rt[2]  = 2;
        rt[3]  = 2;
        rt[4]  = 0;
        rt[5]  = 4;
        rt[6]  = 2;
        rt[7]  = 2;
        rt[8]  = 0;
        rt[9]  = 1;
        rt[10] = 2;
        rt[11] = 2;
        rt[12] = 0;
        rt[13] = 1;
        rt[14] = 2;
        rt[15] = 2;
        rt[16] = 0;
        rt[17] = 1;
        rt[18] = 2;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 1 && MY_YPOS == 2)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 0;
        rt[2]  = 3;
        rt[3]  = 2;
        rt[4]  = 0;
        rt[5]  = 0;
        rt[6]  = 4;
        rt[7]  = 2;
        rt[8]  = 0;
        rt[9]  = 0;
        rt[10] = 1;
        rt[11] = 2;
        rt[12] = 0;
        rt[13] = 0;
        rt[14] = 1;
        rt[15] = 2;
        rt[16] = 0;
        rt[17] = 0;
        rt[18] = 1;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 1 && MY_YPOS == 3)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 0;
        rt[2]  = 0;
        rt[3]  = 3;
        rt[4]  = 0;
        rt[5]  = 0;
        rt[6]  = 0;
        rt[7]  = 4;
        rt[8]  = 0;
        rt[9]  = 0;
        rt[10] = 0;
        rt[11] = 1;
        rt[12] = 0;
        rt[13] = 0;
        rt[14] = 0;
        rt[15] = 1;
        rt[16] = 0;
        rt[17] = 0;
        rt[18] = 0;
        rt[19] = 1;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 2 && MY_YPOS == 0)) begin
    always @(*) begin
        rt[0]  = 3;
        rt[1]  = 2;
        rt[2]  = 2;
        rt[3]  = 2;
        rt[4]  = 3;
        rt[5]  = 2;
        rt[6]  = 2;
        rt[7]  = 2;
        rt[8]  = 4;
        rt[9]  = 2;
        rt[10] = 2;
        rt[11] = 2;
        rt[12] = 1;
        rt[13] = 2;
        rt[14] = 2;
        rt[15] = 2;
        rt[16] = 1;
        rt[17] = 2;
        rt[18] = 2;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 2 && MY_YPOS == 1)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 3;
        rt[2]  = 2;
        rt[3]  = 2;
        rt[4]  = 0;
        rt[5]  = 3;
        rt[6]  = 2;
        rt[7]  = 2;
        rt[8]  = 0;
        rt[9]  = 4;
        rt[10] = 2;
        rt[11] = 2;
        rt[12] = 0;
        rt[13] = 1;
        rt[14] = 2;
        rt[15] = 2;
        rt[16] = 0;
        rt[17] = 1;
        rt[18] = 2;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 2 && MY_YPOS == 2)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 0;
        rt[2]  = 3;
        rt[3]  = 2;
        rt[4]  = 0;
        rt[5]  = 0;
        rt[6]  = 3;
        rt[7]  = 2;
        rt[8]  = 0;
        rt[9]  = 0;
        rt[10] = 4;
        rt[11] = 2;
        rt[12] = 0;
        rt[13] = 0;
        rt[14] = 1;
        rt[15] = 2;
        rt[16] = 0;
        rt[17] = 0;
        rt[18] = 1;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 2 && MY_YPOS == 3)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 0;
        rt[2]  = 0;
        rt[3]  = 3;
        rt[4]  = 0;
        rt[5]  = 0;
        rt[6]  = 0;
        rt[7]  = 3;
        rt[8]  = 0;
        rt[9]  = 0;
        rt[10] = 0;
        rt[11] = 4;
        rt[12] = 0;
        rt[13] = 0;
        rt[14] = 0;
        rt[15] = 1;
        rt[16] = 0;
        rt[17] = 0;
        rt[18] = 0;
        rt[19] = 1;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 3 && MY_YPOS == 0)) begin
    always @(*) begin
        rt[0]  = 3;
        rt[1]  = 2;
        rt[2]  = 2;
        rt[3]  = 2;
        rt[4]  = 3;
        rt[5]  = 2;
        rt[6]  = 2;
        rt[7]  = 2;
        rt[8]  = 3;
        rt[9]  = 2;
        rt[10] = 2;
        rt[11] = 2;
        rt[12] = 4;
        rt[13] = 2;
        rt[14] = 2;
        rt[15] = 2;
        rt[16] = 1;
        rt[17] = 2;
        rt[18] = 2;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 3 && MY_YPOS == 1)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 3;
        rt[2]  = 2;
        rt[3]  = 2;
        rt[4]  = 0;
        rt[5]  = 3;
        rt[6]  = 2;
        rt[7]  = 2;
        rt[8]  = 0;
        rt[9]  = 3;
        rt[10] = 2;
        rt[11] = 2;
        rt[12] = 0;
        rt[13] = 4;
        rt[14] = 2;
        rt[15] = 2;
        rt[16] = 0;
        rt[17] = 1;
        rt[18] = 2;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 3 && MY_YPOS == 2)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 0;
        rt[2]  = 3;
        rt[3]  = 2;
        rt[4]  = 0;
        rt[5]  = 0;
        rt[6]  = 3;
        rt[7]  = 2;
        rt[8]  = 0;
        rt[9]  = 0;
        rt[10] = 3;
        rt[11] = 2;
        rt[12] = 0;
        rt[13] = 0;
        rt[14] = 4;
        rt[15] = 2;
        rt[16] = 0;
        rt[17] = 0;
        rt[18] = 1;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 3 && MY_YPOS == 3)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 0;
        rt[2]  = 0;
        rt[3]  = 3;
        rt[4]  = 0;
        rt[5]  = 0;
        rt[6]  = 0;
        rt[7]  = 3;
        rt[8]  = 0;
        rt[9]  = 0;
        rt[10] = 0;
        rt[11] = 3;
        rt[12] = 0;
        rt[13] = 0;
        rt[14] = 0;
        rt[15] = 4;
        rt[16] = 0;
        rt[17] = 0;
        rt[18] = 0;
        rt[19] = 1;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 4 && MY_YPOS == 0)) begin
    always @(*) begin
        rt[0]  = 3;
        rt[1]  = 2;
        rt[2]  = 2;
        rt[3]  = 2;
        rt[4]  = 3;
        rt[5]  = 2;
        rt[6]  = 2;
        rt[7]  = 2;
        rt[8]  = 3;
        rt[9]  = 2;
        rt[10] = 2;
        rt[11] = 2;
        rt[12] = 3;
        rt[13] = 2;
        rt[14] = 2;
        rt[15] = 2;
        rt[16] = 4;
        rt[17] = 2;
        rt[18] = 2;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 4 && MY_YPOS == 1)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 3;
        rt[2]  = 2;
        rt[3]  = 2;
        rt[4]  = 0;
        rt[5]  = 3;
        rt[6]  = 2;
        rt[7]  = 2;
        rt[8]  = 0;
        rt[9]  = 3;
        rt[10] = 2;
        rt[11] = 2;
        rt[12] = 0;
        rt[13] = 3;
        rt[14] = 2;
        rt[15] = 2;
        rt[16] = 0;
        rt[17] = 4;
        rt[18] = 2;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 4 && MY_YPOS == 2)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 0;
        rt[2]  = 3;
        rt[3]  = 2;
        rt[4]  = 0;
        rt[5]  = 0;
        rt[6]  = 3;
        rt[7]  = 2;
        rt[8]  = 0;
        rt[9]  = 0;
        rt[10] = 3;
        rt[11] = 2;
        rt[12] = 0;
        rt[13] = 0;
        rt[14] = 3;
        rt[15] = 2;
        rt[16] = 0;
        rt[17] = 0;
        rt[18] = 4;
        rt[19] = 2;
    rt[20] = `PORT_P1'bx;
    end
end else if ((MY_XPOS == 4 && MY_YPOS == 3)) begin
    always @(*) begin
        rt[0]  = 0;
        rt[1]  = 0;
        rt[2]  = 0;
        rt[3]  = 3;
        rt[4]  = 0;
        rt[5]  = 0;
        rt[6]  = 0;
        rt[7]  = 3;
        rt[8]  = 0;
        rt[9]  = 0;
        rt[10] = 0;
        rt[11] = 3;
        rt[12] = 0;
        rt[13] = 0;
        rt[14] = 0;
        rt[15] = 3;
        rt[16] = 0;
        rt[17] = 0;
        rt[18] = 0;
        rt[19] = 4;
    rt[20] = `PORT_P1'bx;
    end
end
endgenerate

always @(*) begin
    case ({mdst_xpos, mdst_ypos})
              5'b00000 : port = rt[0];
              5'b00001 : port = rt[1];
              5'b00010 : port = rt[2];
              5'b00011 : port = rt[3];
              5'b00100 : port = rt[4];
              5'b00101 : port = rt[5];
              5'b00110 : port = rt[6];
              5'b00111 : port = rt[7];
              5'b01000 : port = rt[8];
              5'b01001 : port = rt[9];
              5'b01010 : port = rt[10];
              5'b01011 : port = rt[11];
              5'b01100 : port = rt[12];
              5'b01101 : port = rt[13];
              5'b01110 : port = rt[14];
              5'b01111 : port = rt[15];
              5'b10000 : port = rt[16];
              5'b10001 : port = rt[17];
              5'b10010 : port = rt[18];
              5'b10011 : port = rt[19];
              default  : port = rt[20];
          endcase
end
endmodule