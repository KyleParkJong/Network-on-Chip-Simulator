def write(mu, src, dst, vch, len):    
    if mu:
        lis = []
        for i in range(int(dst[-1])+1):
            if i in dst:
                lis.append(1)
            else:
                lis.append(0)
        lis.reverse()
        one_hot = "".join(map(str, lis))
        
        print(f'    $write("*** Send multicast (src: {src} dst: {",".join(map(str,dst))} vch: {vch} len: {len}) *** \\n");')
        print(f"    send_packet_m_{src} (56'b{one_hot}, {vch}, {len});")
    else:
        print(f'    $write("*** Send unicast (src: {src} dst: {dst[0]} vch: {vch} len: {len}) *** \\n");')
        print(f"    send_packet_u_{src} ({dst[0]}, {vch}, {len});")
        

src = list(map(int, input("Initial source (seperate by space): ").split()))

for src0 in src:
    print(f"/* packet generator for n{src0} */")
    mu = int(input("Multicast-1, Unicast-0 : "))
    dst = list(map(int, input("Destination (오름차순으로 입력) : ").split()))
    vch = int(input("Vch : "))
    len = int(input("Packet length : "))
    
    print("initial begin")
    print("    #(STEP / 2);")
    print("    #(STEP * 10);")
    print("    while (~ready) begin")
    print("        #(STEP);")
    print("    end")
    print("")
    write(mu, src0, dst, vch, len)
    print("end")
    print("")
    
