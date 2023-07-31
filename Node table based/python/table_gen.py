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

for src_x in range(5):
    for src_y in range(4):
        if src_x == 0 and src_y == 0:
            str1 = f'(MY_XPOS == {src_x} && MY_YPOS == {src_y})'
            print("if", str1, "begin")
        else:
            str1 = f'(MY_XPOS == {src_x} && MY_YPOS == {src_y})'
            print(f"end else if ({str1}) begin")
        print("    always @(*) begin")
        print("        case ({mdst_xpos, mdst_ypos})")

        for mdst_x in range(5):
            for mdst_y in range(4):
                c = format(mdst_x, "03b")
                d = format(mdst_y, "02b")
                binary = "5'b"+c+d
                port = XY_DOR(src_x, src_y, mdst_x, mdst_y)
                print(f"            {binary} : port = {port};")

        print(f"            default  : port = `PORT_P1'bx;")
        print("        endcase")
        print("    end")
print("end")
        