import sys 
f=open(sys.argv[1],"r")
instr=f.read()
f.close()
instr.encode(encoding="ascii")
out=[]
for c in instr:
    if c == '\n':
        out.append(ord('\\'))
        out.append(ord('\\'))
    else:
        o = ord(c)
        out.append(o)
f=open("input.bin","wb")
for b in out:
    f.write(bytes([b]))
print("input.bin written:",len(out) ,"bytes")