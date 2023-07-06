`include "define.h" 
module fifo (
	idata,
	odata,

	wr_en,
	rd_en,

	empty,
	full,

	ordy,

	clk,
	rst_
);

input	[`DATAW:0]	idata;
output	[`DATAW:0]	odata;

input			wr_en;
input			rd_en; 

output			empty;
output			full;

output			ordy;

input	clk, rst_;

reg	[`DATAW:0]	ram	[0:`FIFO]; // 67bit 저장할 수 있는 것 17개 존재(즉, 17 flit 저장 가능)

reg	[`FIFOD:0]	rd_addr, wr_addr; // 주소는 5bit 표현
reg	[`FIFOD_P1:0]	d_cnt; //6bit counter 설정
wire			set;
integer	i;

// empty, full 동작안하므로 무조건 0
/* Write address */
always @ (posedge clk) begin
	if (rst_ == `Enable_) // 초기설정
		wr_addr	<= 0;
	else if (set) // 전송 가능 상태
		if (wr_addr == `FIFO) // 꽉찬 상태 의미
			wr_addr	<= 0;
		else
			wr_addr	<= wr_addr + 1;
end

/* Read address */
always @ (posedge clk) begin
	if (rst_ == `Enable_) //초기설정
		rd_addr	<= 0;
	else if (~empty & rd_en) //read 가능상태
		if (rd_addr == `FIFO) // round 형식으로 16번 읽었으면 0번으로 돌아감
			rd_addr	<= 0;
		else
			rd_addr	<= rd_addr + 1;
end

/* Data counter */
always @ (posedge clk) begin // 쓰기 상황이면 d_cnt 증가, 읽기 상황이면 d_cnt 감소), 17까지 올라가는지 여부 감시
	if (rst_ == `Enable_) 
		d_cnt	<= 0;
	else if (~full  & wr_en & ~(rd_en & ~empty)) 
		d_cnt	<= d_cnt + 1;
	else if (~empty & rd_en & ~wr_en) 
		d_cnt	<= d_cnt - 1;
end

/* Full, Empty, Set */
assign	full	= (d_cnt == `FIFO_P1);
assign	empty	= (d_cnt == 0);
assign	set	= (~full | rd_en) & wr_en; //비어있고 send가능상황 + write도 가능한가? 여부

/* Empty space for a single packet */
// 한 packet이 들어갈 수 있는지 확인하여 ordy를 부여하므로 virtual cut through로 볼 수 있음
assign	ordy	= ((`FIFO_P1 - d_cnt) >= `PKTLEN_P1) ? `Enable : `Disable;

/* Memory I/O */
assign	odata	= ~empty ? ram[rd_addr] : 0; // 무조건 ram[rd_addr], 즉 data 무조건 빠져나감
always @ (posedge clk) begin
	if (rst_ == `Enable_) // ram 초기화
		for (i = 0; i < `FIFO_P1; i = i + 1)
			ram[i]	<= 0;
	else if (set) // memory 위치에 data 저장
		ram[wr_addr]	<= idata;
end

endmodule

