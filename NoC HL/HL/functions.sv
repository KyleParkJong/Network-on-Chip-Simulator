`include "define.v"
`include "parameters.v"

/* Finding Level 1 destinations */
function automatic [`MADDR:0] find_l1 (   
    input [`MADDR:0] mult_dst,  // addr1
    input [1:0] src_pos
);
integer i, j;
integer flag;
reg [`MADDR:0] dst;
begin
    dst = 0; 
    if ( (src_pos == 2'b01) || (src_pos == 2'b10) ) begin        // 2, 3 사분면 (Left -> Right)
        for ( i = 0; i < `ROW; i = i + 1 ) begin
            flag = 1;
            for ( j = 0; (j < `COLUMN) && flag; j = j + 1 ) begin 
                if ( mult_dst[i+j*`ROW] == 1 ) begin
                    dst[i+j*`ROW] = 1;
                    flag = 0;
                end
            end
        end
    end 
    else begin      // 1, 4 사분면 (Right -> Left)
        for ( i = 0; i < `ROW; i = i + 1 ) begin
            flag = 1;
            for ( j = 0; (j < `COLUMN) && flag; j = j + 1 ) begin 
                if ( mult_dst[`MAX_ROUTER-(i+j*`ROW)] == 1 ) begin
                    dst[`MAX_ROUTER-(i+j*`ROW)] = 1;
                    flag = 0;
                end
            end
        end
    end
    find_l1 = dst;
end
endfunction

/* Find level 2 destinations */
function automatic [`MADDR:0] find_l2 (   
    input [`MADDR:0] l1_dst,  // Level 1 dst
    input [1:0] src_pos
);

integer i, j;
integer flag;
reg [`MADDR:0] dst;
begin
    dst = 0;
    if ( (src_pos == 2'b00) || (src_pos == 2'b01) ) begin    // 1, 2 사분면 (Top -> Bottom)
        for ( i = 0; i < `COLUMN; i = i + 1 ) begin
            flag = 1;
            for ( j = 0; (j < `ROW) && flag; j = j + 1 ) begin
                if ( l1_dst[i*`ROW+j] == 1) begin
                    dst[i*`ROW+j] = 1;
                    flag = 0;
                end
            end
        end
    end 
    else begin      // 3, 4 사분면 (Bottom -> Top)
        for ( i = 0; i < `COLUMN; i = i + 1 ) begin
            flag = 1;
            for ( j = 0; (j < `ROW) && flag; j = j + 1 ) begin
                if ( l1_dst[`MAX_ROUTER-(i*`ROW+j)] == 1) begin
                    dst[`MAX_ROUTER-(i*`ROW+j)] = 1;
                    flag = 0;
                end
            end
        end
    end 
    find_l2 = dst;
end
endfunction

function automatic integer find_left_bit(
    input [`MADDR:0] mult_dst
);
integer i;
begin
    for (i = 0; i < `MADDR+1; i = i + 1)
        if (mult_dst[i])
            find_left_bit = i;
end
endfunction

function automatic integer find_right_bit(
    input [`MADDR:0] mult_dst
);
integer i;
begin
    for (i = `MADDR; i >= 0 ; i = i - 1)
        if (mult_dst[i])
            find_right_bit = i;
end
endfunction

/* Count number of 1 */
function integer count_dst(input [`MADDR:0] dst);
integer i;
begin
    count_dst = 0;
    for ( i = dst; i > 0; i = i >> 1 )
        count_dst = count_dst + (i & 1);
end
endfunction

function automatic integer find_center_bit( 
    input [`MADDR:0] mult_dst,
    input integer ceiling       // 0:floor, 1:ceiling, 2:center==source
);
integer i;
integer dst_num;
integer left, right;
integer cnt;
begin
    dst_num = count_dst(mult_dst);
    left = find_left_bit(mult_dst);
    right = find_right_bit(mult_dst);

    if (ceiling == 2)
        cnt = dst_num/2;
    else
        cnt = dst_num/2 + (ceiling | (dst_num%2));

    for (i = right; (i < left+1) && cnt; i = i + 1) begin
        if (mult_dst[i])
            cnt = cnt - 1;
    end

    find_center_bit = i-1;
end
endfunction