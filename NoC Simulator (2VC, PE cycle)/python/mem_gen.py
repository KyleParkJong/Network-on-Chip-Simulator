def mem_gen (pe_num, dst):   # unicast, 1packet = 4flits, total 64 packets = 256 flits
    # flit type / um type / dst / ID / src / vch
    lis = ["01", "00", "00", "10"]
    um_type = "0"
    dst_bin = str(format(dst, "011b"))
    src_bin = str(format(pe_num, "05b"))
    k = 0
    for i in range(64):
        for j in range(4):
            flit_type = lis[j]
            id = str(format(k, "045b"))
            if i % 2: vch = "01"
            else: vch = "00" 
            k = k + 1
            
            flit = flit_type + um_type + dst_bin + id + src_bin + vch
            
            print(flit)
        print()        

pe_num = int(input("pe_num: "))
dst = int(input("dst: "))

packet_gen(pe_num, dst)

