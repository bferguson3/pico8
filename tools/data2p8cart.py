cartridge_header="""pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
"""

#--__gfx__ : 8kB
#-- each byte is stored as a 2-character string in REVERSE 4-bit order, row by row
#-- e.g. HELLO = 48 45 4c 4c 4f = 8454c4c4f4
#-- Format is 64 bytes wide (128 chars), 128 rows
#-- Stored @ 0x0 to 0x1fff
#-- page 3: 1800+
#-- 32x32 spr is 16 bytes, skip 48, 16 bytes, skip 48...

#-- __map__ : 4kB
#-- stored as 2-character string in NORMAL order.
#-- Format is 128by wide (256 chars), 32 rows
#-- Stored @ 0x2000-2fff 

#--__gff__ : 0.25kb
#-- Stored @ 0x3000-30ff, but immediately after __gfx__ in the .p8 file
#-- same format as __gfx__
f = open('input.bin', 'rb')
inbytes = f.read()
f.close()
if len(inbytes) > 12543:
    print("Data won't fit on a cart. Reduce to <= 12,543 bytes")
    print("Only first 12.2kB of the file will be added to the cart!")
    #return 0

def procb(b):
    b = hex(b)
    f = b[2]
    if len(b) > 3:
        l = b[3]
    else:
        l = '0'
    bf = l + f
    return bf
    
def proca(b):
    b = hex(b)
    f = b[2]
    if len(b) > 3:
        l = b[3]
    else:
        l = '0'
    bf = f + l
    return bf 

def finrow(rowlen, outstr):
    if rowlen != 0:
        while rowlen != 0:
            outstr = outstr + '00'
            rowlen -= 2
    return rowlen, outstr


#__gfx__
outstr = cartridge_header + "__gfx__\n"

i = 0
h = len(inbytes)
if h > 8192:
    h = 8192
rowlen = 128
row = ''
while i < h:
    b = inbytes[i]
    b = procb(b)
    outstr = outstr + b
    rowlen -= 2
    if rowlen == 0:
        rowlen = 128
        outstr = outstr + '\n'
    i += 1
rowlen, outstr = finrow(rowlen, outstr)

#__gff__
outstr = outstr + "\n__gff__\n"

i = 0
h = len(inbytes)-8192
if h > 256:
    h = 256
rowlen = 128
row = ''
while i < h:
    b = inbytes[i+8192]
    b = procb(b)
    outstr = outstr + b
    rowlen -= 2
    if rowlen == 0:
        rowlen = 128
        outstr = outstr + '\n'
    i += 1
rowlen, outstr = finrow(rowlen, outstr)

#__map__
outstr = outstr + "\n__map__\n"

i = 0
h = len(inbytes)-(8192+256)
rowlen = 256
row = ''
while i < h:
    b = inbytes[i+(8192+256)]
    b = proca(b)
    outstr = outstr + b
    rowlen -= 2
    if rowlen == 0:
        rowlen = 128
        outstr = outstr + '\n'
    i += 1
rowlen, outstr = finrow(rowlen, outstr)

#print(outstr)
f = open('data0.p8', 'w')
f.write(outstr)
f.close()
print("data0.p8 written.")