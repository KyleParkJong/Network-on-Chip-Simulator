`include "define.v" 
module pe_fsm (
    idata,
    ivalid,
    grt,

    state,
    odata,
    ovalid,
    ovch,
    req,

    clk, 
    rst_
);

localparam IDLE=2'b00, MAC=2'b01, SEND=2'b10;

input	[`DATAW:0]	idata;
input               ivalid; 
input               grt;
input               clk, rst_;       

output      [1:0]       state;
output	reg [`DATAW:0]	odata;
output  reg             ovalid;
output  reg [`VCHW:0]   ovch;
output                  req;

reg [1:0] state, nstate;
reg m_set, wr_en;
reg [3:0] m_cnt;
reg [7:0] a_cnt;

wire empty;

wire [`DATAW:0] odata0;
wire            ovalid0;
wire [`VCHW:0]  ovch0;

always @(*) begin
    nstate = state;
    case (state)
    IDLE: begin
        nstate = (idata[`UM_TYPE] == 1 && ivalid) ? MAC : (idata[`UM_TYPE] == 0 && ivalid) ? SEND : IDLE;
    end
    MAC: begin
        nstate = (a_cnt == 128) ? SEND : MAC;
    end
    SEND: begin
        nstate = (empty) ? IDLE : SEND;  // if FIFO is empty, change state to IDLE
    end
    default: 
        nstate = IDLE;
    endcase
end

always @(posedge clk) begin
    if (rst_ == `Enable_)
        state <= IDLE;
    else
        state <= nstate;
end

/*-----------------*/
/*--- MAC stage ---*/

/* Packet Counter */
always @(posedge clk) begin
    if (rst_ == `Enable_) begin
        m_set <= 0;
    end
    else if (state == MAC) begin
        if(idata[`TYPE_MSB:`TYPE_LSB] == `TYPE_TAIL && ivalid)
            m_set <= 1;
        else if (m_cnt == 8)
            m_set <= 0;
    end
end

/* MAC Counter */
always @(posedge clk) begin
    if (rst_ == `Enable_)
        m_cnt <= 0;
    else if (state == MAC && m_set) begin
        if (m_cnt == 8)
            m_cnt <= 0;
        else
            m_cnt <= m_cnt + 1;
    end
end

/* Accumulation Counter */
always @(posedge clk) begin
    if (rst_ == `Enable_) begin
        a_cnt <= 0;
        wr_en <= 0;
    end
    else if (state == MAC && m_cnt == 8) begin
        if (a_cnt == 128) begin
            a_cnt <= 0;
            wr_en <= 0;
        end
        else begin
            a_cnt <= a_cnt + 1;
            wr_en <= 1;
        end
    end
end

assign req = (state == SEND) ? 1 : 0;

/*-----------------*/
/*--- SEND state ---*/

// if SEND State, send packets from .mem file
pe_fifo sram (
	.rd_en  ( state == SEND ? 1'b1 : 1'b0 ),
    .grt    ( grt ),

	.empty  ( empty ),
    .odata  ( odata0 ),
    .ovalid ( ovalid0 ),
    .ovch   ( ovch0 ),

	.clk    ( clk ),
	.rst_   ( rst_ ) 
);

/* 1 delay to match sel signal */
always @(posedge clk) begin
    if (rst_ == `Enable_) begin
        odata <= 0;
        ovalid <= 0;
        ovch <= 0;
    end
    else begin
        odata <= odata0;
        ovalid <= ovalid0;
        ovch <= ovch0;
    end
end

endmodule