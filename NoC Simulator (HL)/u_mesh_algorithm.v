`include "define.v"
`include "parameters.v"

module u_mesh_algorithm(
    l1_dst,     
    l2_dst,
    mult_dst, 
    src_pos,
    src_dst,

    next_pos,      
    doc,
    state      
);

`include "functions.sv"

/* Paramters */
parameter MY_XPOS = 0;
parameter MY_YPOS = 0;

localparam SOURCE  = MY_XPOS*4+MY_YPOS;

/* I/O */
input [`MADDR:0] l1_dst; 
input [`MADDR:0] l2_dst;
input [`MADDR:0] mult_dst;
input [1:0] src_pos;           // Location in quadrants 1~4 of the initial source
input [`MSRC_BW:0] src_dst;

output [`NODEW:0] next_pos;    // Output the next destination's router number
output [`MADDR:0] doc;         // Dimension Order Chain (DOC) that need to send
output [1:0] state;

/* Variables */
integer i, j, k;
integer iter;
integer up, down;
integer cnt;

integer l1_num, l2_num;
integer left, right;
integer l1_left, l1_right;

reg [`NODEW:0] next_pos;
reg [`MADDR:0] doc;
reg [`MADDR:0] l2_doc;
reg [`MADDR:0] l2_remain;
reg [1:0] state;

always @(*) begin

    l1_num = count_dst(l1_dst);
    l2_num = count_dst(l2_dst);

    left   = find_left_bit(l2_dst);
    right  = find_right_bit(l2_dst);

    l1_left  = find_left_bit(l1_dst);
    l1_right  = find_right_bit(l1_dst);


    /* Determining current state of the 4 steps */
    if ( (l2_num == 1) && (l1_num > 1) && (l2_dst[SOURCE] == 1) )
        state = `UMESH_MULT_COL;
    else if ( (l2_num == 1) && (l1_num == 1) && (l2_dst[SOURCE] == 1) )
        state = `UMESH_MULT_ROW;            
    else if ( ((l2_num > 1) && (l2_dst[SOURCE] == 1)) || (src_dst == SOURCE) )
        state = `UMESH_UNI_CENTER;
    else 
        state = `UMESH_UNI;
    
    case (state) 
        `UMESH_UNI_CENTER : // Unicast center
            begin 
                doc = mult_dst; 
                l2_doc = l2_dst;
                l2_remain = l2_dst;     

                if ( SOURCE*2 < (right+left) ) begin      // send right
                    cnt = l2_num/2;
                    for (i = 0; (i < `ROUTER_NUM) && cnt; i = i + 1) begin // generate l2 HALF doc 
                        if(l2_dst[i] == 1) begin
                            l2_doc[i] = 0;
                            cnt = cnt - 1;
                        end
                    end
                    l2_remain = l2_remain ^ l2_doc;     // Other half l2 doc that are remaining
                    next_pos = find_right_bit(l2_doc); // LSB of 1s

                    /* Delete rows from the doc that correspond to the Other l2 half doc */
                    iter = count_dst(l2_remain);
                    // [1 Quadrant] : Top -> Down, Right -> Left
                    if ( src_pos == 2'b00 ) begin      
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin  
                                if (l1_dst[find_left_bit(l2_remain)+j] == 1 && l2_doc[find_left_bit(l2_remain)+j] == 0) begin   // Find L1 in the same column as L2
                                    for (k = find_left_bit(l2_remain)+j; k >= 0; k = k - `ROW)  // Remove by Row
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                    // [2 Quadrant] : Top -> Down, Left -> Right
                    else if ( src_pos == 2'b01 ) begin
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin
                                if (l1_dst[find_left_bit(l2_remain)+j] == 1 && l2_doc[find_left_bit(l2_remain)+j] == 0) begin
                                    for (k = find_left_bit(l2_remain)+j; k < `ROUTER_NUM; k = k + `ROW)
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                    // [3 Quadrant] : Down -> Top, Left -> Right
                    else if ( src_pos == 2'b10 ) begin
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin
                                if (l1_dst[find_left_bit(l2_remain)-j] == 1 && l2_doc[find_left_bit(l2_remain)-j] == 0) begin
                                    for (k = find_left_bit(l2_remain)-j; k < `ROUTER_NUM; k = k + `ROW)
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                    // [4 Quadrant] : Down -> Top, Right -> Left
                    else begin
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin
                                if (l1_dst[find_left_bit(l2_remain)-j] == 1 && l2_doc[find_left_bit(l2_remain)-j] == 0) begin
                                    for (k = find_left_bit(l2_remain)-j; k >= 0; k = k - `ROW)
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                end
                else if ( SOURCE*2 > (right+left) ) begin     // send left
                    cnt = l2_num/2;
                    for (i = 0; (i < `ROUTER_NUM) && cnt; i = i + 1) begin
                        if(l2_dst[`MAX_ROUTER - i] == 1) begin
                            l2_doc[`MAX_ROUTER - i] = 0;
                            cnt = cnt - 1;
                        end
                    end
                    l2_remain = l2_remain ^ l2_doc;
                    next_pos = find_left_bit(l2_doc);      // MSB of 1s
                    
                    /* Delete rows from the doc that correspond to the Other l2 half doc */
                    iter = count_dst(l2_remain);
                    // [1 Quadrant] : Top -> Down, Right -> Left
                    if ( src_pos == 2'b00 ) begin      
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin  
                                if (l1_dst[find_left_bit(l2_remain)+j] == 1 && l2_doc[find_left_bit(l2_remain)+j] == 0) begin   // Find L1 in the same column as L2
                                    for (k = find_left_bit(l2_remain)+j; k >= 0; k = k - `ROW)  // Remove by Row
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                    // [2 Quadrant] : Top -> Down, Left -> Right
                    else if ( src_pos == 2'b01 ) begin
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin
                                if (l1_dst[find_left_bit(l2_remain)+j] == 1 && l2_doc[find_left_bit(l2_remain)+j] == 0) begin
                                    for (k = find_left_bit(l2_remain)+j; k < `ROUTER_NUM; k = k + `ROW)
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                    // [3 Quadrant] : Down -> Top, Left -> Right
                    else if ( src_pos == 2'b10 ) begin
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin
                                if (l1_dst[find_left_bit(l2_remain)-j] == 1 && l2_doc[find_left_bit(l2_remain)-j] == 0) begin
                                    for (k = find_left_bit(l2_remain)-j; k < `ROUTER_NUM; k = k + `ROW)
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                    // [4 Quadrant] : Down -> Top, Right -> Left
                    else begin
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin
                                if (l1_dst[find_left_bit(l2_remain)-j] == 1 && l2_doc[find_left_bit(l2_remain)-j] == 0) begin
                                    for (k = find_left_bit(l2_remain)-j; k >= 0; k = k - `ROW)
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                end 
                else begin      // send left
                    cnt = l2_num/2;
                    for (i = 0; (i < `ROUTER_NUM) && cnt; i = i + 1) begin
                        if(l2_dst[i] == 1) begin
                            l2_doc[i] = 0;
                            cnt = cnt - 1;
                        end
                    end
                    l2_remain  = l2_doc;
                    l2_doc = l2_doc ^ l2_dst;
                    next_pos = find_left_bit(l2_doc);      // MSB of 1s
                    
                    /* Delete rows from the doc that correspond to the Other l2 half doc */
                    iter = count_dst(l2_remain);
                    // [1 Quadrant] : Top -> Down, Right -> Left
                    if ( src_pos == 2'b00 ) begin      
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin  
                                if (l1_dst[find_left_bit(l2_remain)+j] == 1 && l2_doc[find_left_bit(l2_remain)+j] == 0) begin   // Find L1 in the same column as L2
                                    for (k = find_left_bit(l2_remain)+j; k >= 0; k = k - `ROW)  // Remove by Row
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                    // [2 Quadrant] : Top -> Down, Left -> Right
                    else if ( src_pos == 2'b01 ) begin
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin
                                if (l1_dst[find_left_bit(l2_remain)+j] == 1 && l2_doc[find_left_bit(l2_remain)+j] == 0) begin
                                    for (k = find_left_bit(l2_remain)+j; k < `ROUTER_NUM; k = k + `ROW)
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                    // [3 Quadrant] : Down -> Top, Left -> Right
                    else if ( src_pos == 2'b10 ) begin
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin
                                if (l1_dst[find_left_bit(l2_remain)-j] == 1 && l2_doc[find_left_bit(l2_remain)-j] == 0) begin
                                    for (k = find_left_bit(l2_remain)-j; k < `ROUTER_NUM; k = k + `ROW)
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                    // [4 Quadrant] : Down -> Top, Right -> Left
                    else begin
                        for (i = 0; i < iter; i = i + 1) begin 
                            for (j = 0; j < `ROW-1; j = j + 1) begin
                                if (l1_dst[find_left_bit(l2_remain)-j] == 1 && l2_doc[find_left_bit(l2_remain)-j] == 0) begin
                                    for (k = find_left_bit(l2_remain)-j; k >= 0; k = k - `ROW)
                                        doc[k] = 0;
                                end
                            end
                            l2_remain[find_left_bit(l2_remain)] = 0;
                        end
                    end
                end
            end

        `UMESH_MULT_COL : 
            begin
                doc = mult_dst;
                next_pos = SOURCE;

                //  Data transfer direction depends on source's position in the quadrant
                case (src_pos) 
                    2'b00 :     // [1 Quadrant] : Top -> Down , Right -> Left
                        begin
                            cnt = 1;
                            for (i = 1; (i < `ROW) && cnt; i = i + 1) begin     // Find next dst bit (Top -> Down)
                                if ( l1_dst[SOURCE+i] == 1 ) begin
                                    next_pos = SOURCE + i;
                                    cnt = 0;
                                end 
                            end
                            
                            for (i = SOURCE; i >= 0 ; i = i - `ROW) begin   // Delete row  (Right -> Left)
                                    doc[i] = 0;
                            end
                        end
                    2'b01 :     // [2 Quadrant] : Top -> Down , Left -> Right
                        begin
                            cnt = 1;
                            for (i = 1; (i < `ROW) && cnt; i = i + 1) begin     // Find next dst bit (Top -> Down)
                                if ( l1_dst[SOURCE+i] == 1 ) begin
                                    next_pos = SOURCE + i;
                                    cnt = 0;
                                end 
                            end
                            
                            for (i = SOURCE; i < `ROUTER_NUM; i = i + `ROW) begin   // Delete row (Left -> Right)
                                    doc[i] = 0;
                            end
                        end
                    2'b10 :     // [3 Quadrant] : Down -> Top , Left -> Right
                        begin
                            cnt = 1;
                            for (i = 1; (i < `ROW) && cnt; i = i + 1) begin     // Find next dst bit (Down -> Top)
                                if ( l1_dst[SOURCE-i] == 1 ) begin
                                    next_pos = SOURCE - i;
                                    cnt = 0;
                                end 
                            end
                            
                            for (i = SOURCE; i < `ROUTER_NUM; i = i + `ROW) begin   // Delete row (Left -> Right)
                                    doc[i] = 0;
                            end
                        end
                    2'b11 :     // [4 Quadrant] : Down -> Top , Right -> Left
                        begin
                            cnt = 1;
                            for (i = 1; (i < `ROW) && cnt; i = i + 1) begin     // Find next dst bit (Down -> Top)
                                if ( l1_dst[SOURCE-i] == 1 ) begin
                                    next_pos = SOURCE - i;
                                    cnt = 0;
                                end 
                            end
                            
                            for (i = SOURCE; i >= 0 ; i = i - `ROW) begin   // Delete row (Right -> Left)
                                    doc[i] = 0;
                            end
                        end
                endcase
            end

        `UMESH_MULT_ROW : 
            begin
                if ( mult_dst[SOURCE] == 1 ) begin
                    doc = mult_dst; 
                    doc[SOURCE] = 0;
                end 
                else doc = mult_dst;

                next_pos = SOURCE;
            
                if ( (src_pos == 2'b00) || (src_pos == 2'b11) ) begin       // 1, 4 Quadrant : Right -> Left
                    cnt = 1;
                    for (i = SOURCE-`ROW; (i >= 0) && cnt; i = i - `ROW) begin     // Find next dst bit (Right -> Left)
                        if ( doc[i] == 1 ) begin
                            next_pos = i;
                            cnt = 0;
                        end 
                    end
                end
                else begin                                                  // 2, 3 Quadrant : Left -> Right
                    cnt = 1;
                    for (i = SOURCE+`ROW; (i < `ROUTER_NUM) && cnt; i = i + `ROW) begin     // Find next dst bit (Right -> Left)
                        if ( doc[i] == 1 ) begin
                            next_pos = i;
                            cnt = 0;
                        end
                    end
                end
            end
        `UMESH_UNI : 
            begin
                doc = mult_dst;     // Keep the previous doc

                cnt = 1;
                // Send to closest L2 dst
                if ( SOURCE*2 < (right+left) ) begin  // Case 1 : Send right
                    for (i = SOURCE+1; (i < `ROUTER_NUM) && cnt; i = i + 1) begin
                        if ( l2_dst[i] == 1) begin
                            next_pos = i;
                            cnt = 0;
                        end
                    end
                end
                else begin      // Case 2 : Send left
                    for (i = SOURCE-1; (i >= 0) && cnt; i = i - 1) begin
                        if ( l2_dst[i] == 1 ) begin  
                            next_pos = i;
                            cnt = 0;
                        end
                    end
                end

            end
    endcase
end

endmodule