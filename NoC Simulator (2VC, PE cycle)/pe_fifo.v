`include "define.v"    
module pe_fifo (
    rd_en,
    grt,

    empty,
    odata,
    ovalid,
    ovch,

    clk,
    rst_
);

input rd_en;
input grt;          // from arbitrated crossbar
input clk, rst_;

output              empty;
output [`DATAW:0]   odata;
output              ovalid;
output [`VCHW:0]    ovch;


// Initialize memory at noc_test.v through $memreadb()
reg [`DATAW:0] memory [0:255];   // 256 flits (= 64 packets)
reg [8:0] rd_addr; 

integer i;

/* Read address */
always @(posedge clk) begin
    if (rst_ == `Enable_) 
        rd_addr <= 0;
    else if (rd_en & grt) begin
        if (rd_addr == 255)
            rd_addr <= 0;
        else
            rd_addr <= rd_addr + 1;
    end 
end

assign empty = (rd_addr == 255) ? 1 : 0;

/* Memory read */
assign odata    =   (rd_en & grt) ? memory[rd_addr] : `DATAW_P1'b0;
assign ovalid   =   (rd_en & grt); 

assign ovch     =   (odata[`MVCH_MSB:`MVCH_LSB] == 2'b00) ? `VCHW_P1'b0 :
                    (odata[`MVCH_MSB:`MVCH_LSB] == 2'b01) ? `VCHW_P1'b1 :
                    `VCHW_P1'b0;

endmodule