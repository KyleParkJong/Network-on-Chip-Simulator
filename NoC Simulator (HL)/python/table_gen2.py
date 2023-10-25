def XY_DOR(x1, y1, x2, y2):
    if x1 == x2 and y1 == y2: port = 4  # X
    elif x1 < x2 : port = 1             # E
    elif x1 > x2 : port = 3             # W
    elif y1 < y2 : port = 2             # S
    else: port = 0                      # N 
    
    return port

def YX_DOR(x1, y1, x2, y2):
    if x1 == x2 and y1 == y2: port = 4  # X
    elif y1 < y2 : port = 2             # S
    elif y1 > y2 : port = 0             # N
    elif x1 < x2 : port = 1             # E
    else: port = 3                      # W

    return port

row_num = int(input("Enter number of row : "))      # 4
col_num = int(input("Enter number of column : "))   # 5 

for src_x in range(col_num):
    for src_y in range(row_num):
        if src_x == 0 and src_y == 0:
            str1 = f'(MY_POS == {src_x * row_num + src_y})'
            print("if", str1, "begin")
        else:
            str1 = f'(MY_POS == {src_x * row_num + src_y})'
            print(f"end else if {str1} begin")
        print("    always @(*) begin")
        print("        case (next_pos)")

        for mdst_x in range(col_num):
            for mdst_y in range(row_num):
                mdst = mdst_x * row_num + mdst_y
                c = format(mdst, "06b")
                binary = "6'b"+c            # <Node 개수에 맞게 비트 변경>
                port = YX_DOR(src_x, src_y, mdst_x, mdst_y)
                print(f"            {binary} : port = {port};")

        print(f"            default  : port = 6'bx;")   # <Node 개수에 맞게 비트 변경>
        print("        endcase")
        print("    end")
print("end")
        