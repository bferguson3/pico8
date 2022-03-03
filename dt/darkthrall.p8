pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
--dARKtHRALL
--(c)2021 @heroofalefgard
//--0
#include main.lua
#include dtobj.lua 
-->8
//--1
#include p8debug.lua 
-->8
//--2
#include combat.lua
-->8
//--3
#include strings.lua
#include scripts.lua 
-->
//--4
#include draw.lua 
#include drawdungeon.lua 
__gfx__
00000000066666606666661111655666eeeeeee111eeeeeeeeeeeee99eeeeeeee0e0e0e00000000000055945000000000003b3000003b30065d55d66d556d550
00000000606656656665d11ee11d5666eeeeeee6611eeeeeeeeeee9aa9eeeeee0e0e0e0e000000000004455500000000003b0b30003b0b305d5d666666d66666
007007006566666d656d11eeee11d656eeeee176621eeeeeeeeee9aaa79eeeeee0e0e0e000000000000549450000000003b037b303b007b30566666666666666
000770000dd66dd06d611eeeeee116d5eee1e6d66561eeeeeeee99a2aa79eeee0e0e0e0e5454545400045955494940000b03330b0b00000bd0d6666666666666
00077000666666606611eeeeeeee115deee16d666d65eeeeeeee9aa22aa9eeeee0e0e0e045444544000545459444900003b030b303b000b3d20d666666666666
00700700666666d5611eeeeeeeeee116ee1d6566656d111eeee99aa22aa79eee0e0e0e0e995595590004595544a44000003b0b30003b0b30d65d6666666d5d66
000000005666066611eeeeeeeeeeee1111d566666665d611eee9aaa22aaa9eeee0e0e0e09559559900054545944490000003b3000003b300d6d5666666650566
00000000566d56651eeeeeeeeeeeeee11657666666675661ee99aaa22aaa79ee0e0e0e0e4545454500044955494940000000000000000000566d6666d66d4666
000000003333333333333333cccccccccccccccc00099000ee99aaa22aaaa9ee00000000000000000000000000000000eeee85eeeeeeeeee0d66d5dd655d65d0
0005a0004533335333435354cccccccccccccccc009aa900e99aaaaaaaaaa79e00000000000000000000000000000000eeee85eeeeeee85e0666666d5d666666
005aaa003335333334453434777ccccccccccccc00922900e99aaaa22aaaa79e00000000000000000000000000000000eee85eeeeeeee85ed666d66505666666
05aaaaa033333333443444437777cc77cccccccc09a22a90e999aaaaaaaaa99e00000000000000000000000000000000eee85eeeeeee85ee5666566604666666
0005a0003333533343445544cc77cccccccccccc09a22a90ee999999999999ee00000000000000000000000000000000ee85eeeeeeee85ee5d66666665666666
0005a0003533333335333445cccccccccccccccc99aaaa99eeeeeeeeeeeeeeee00000000000000000000000000000000ee85eeeeeeee5eeed0d666666d666666
0005a0003333354343443443cccccccccccccccc9aa22aa9eeeeeeeeeeeeeeee00000000000000000000000000000000ee5eeeeeeeeeeeee5566666666666d0d
000000003353353334533533cccccccccccccccc99999999eeee00000000eeee00000000000000000000000000000000eeeeeeeeeeeeeeeed666666666666656
6666666628802880eeeeeeee2880288080000000cccccccc00000000000000000000000000000000666666699999999999999999999999999999999999999999
5600006600780078ee0000ee0878087878000000dc0000cc00000000000000000000000000000000667777760000000990000000000000099000000000000009
5060060600080008e0e00e0e0888088888000000d0c00c0c00000000000000000000000000000000666777760000000990000000000000095500005500000709
5006500600080008e00ee00e0888088888000000d00cc00c00000000000000000000000000000000666677776000000990002222500000095755556750007509
5005600600080008e00ee00e0888088888000000d00dc00c00000000000000000000000000000000666667776000000990004442555000095666667667776509
5050060600080008e0e00e0e0888088888000000d0d00c0c0000000000000000000000000000000066666677760d000990000444255500095666666666666509
5500006600080008ee0000ee0888088888000000dd0000cc000000000000000000000000000000006666666776dd000990946644422222095666667666666509
5555555628802880eeeeeeee2880288080000000dddddddc0000000000000000000000000000000090666666776d000954444666644442095666667666666509
00ccc7c0000cc00000cc7c0000cc7000000c7cc00cc7cc7000c7c7000c7cc7c700c7c700007cc70090006666677d000944444444666400095766657766667509
0cc0057c005cc0000cc7c7c00cc5c70000c75c705c7cc7c005cc7c00c7cc7ccc0c705c7007c05cc090000066667d400944444444446666099565557777675009
0cc005c700cc70000c005c7000005c00007057c057c000000c7000007c005c7007c057c00cc05c709000000d66d5540944444444544406099566657666665009
0c7005770057c000000057c00000c70007c05cc05cc7ccc057c00000c005cc0005cccc00007cc7c09000000d5d54440954444445454406099576667766665219
07c0057c005c700000057c00007c7cc00cc7ccc000005cc05cc7cc00005cc00000c7cc0000000cc09000000d5d14444954444454544500099057667666675221
0c7005cc0057c0000057c00000005cc000005c7000005cc05c705cc0005cc0000c705cc00000cc009000000dd000444995444545445500099005667666750225
07c005cc005c700005ccc0000c057cc0000057c00cc05c7007c05cc00057c0000cc05c700007c000900000000000041990544444554500099000566667500222
0077ccc00cccccc00cccccc000cccc0000005cc005ccc7c000cccc00000cc00005ccc7c0007c0000999999999999999999954455555999999999055555999121
99d1111999999999999d000000000d99000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9d1dccd111de1de99ed00000000000d9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d1dcddccddd111e99e00000053000009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dcdc111ccd1d1e99d00000bb3300009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d1d1ccddddc11e990030003bb503003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11ddd11ff111dde990030005bb3b3003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dcc11555555f11990050003b3073503000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dc1d777777751199000b003bb073339000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11d17777777755d99d00b00bbbbbb309000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1e5d555555555de99ed035bbbbbbb3e9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
de1dffffffff91e99ee503bb33bb3ee9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9e1dff555fff9d699e00053bbbb3eee9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9edcfff99ff911d9d00005053b30eee9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9ed1effff95de1d9000e05bbbbbb0ee9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9eeeed35555deee900e02226b3bb20e9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99999d53235d99990500222220222209000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ed666d66ed66dedd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5d5d666656d666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d5666666d65666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
666660665d6665660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
52666666d66666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dd5d6566555d55d60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66d66666d66665660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56066666566d4d660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06666666566666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
566666665d6666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56d55d55555d66560000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d6665666d66666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5d666666d66566660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
50d66566d66666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d566666656666d0d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
655d6d655d56d5560000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000
00000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020c00000000000000
02000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000
00000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020c00000000000000
02000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000
00000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020c00000000000000
02000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000
00000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020000000000000000
02000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000
00000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020000000000000000
02000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000
00000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020000000000000000
02000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000
00000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020000000000000000
02020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202
02020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020000000000000000
13431010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10531010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10631010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10731010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010ff
__label__
70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__map__
2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200000000000000000
2000002020001520000000201000000000001520200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000002020002015202020002020202020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000202020002000150020200000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000020202000000020200000000000202020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000200000152000000020200000150000201520200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000200000002000000020200000000000200020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000200020202000000020250000000020200020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000202020000020002020002020200000200020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000020000000000000202000200020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2020200020202020002020202020200000200020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000200020000000002000000020000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000020002020202000200020002020202020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2020200020002000002200200020002000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000020002000202000200020002015000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000202020002020202000200020002020200020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000020000000000000200020000000200020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2022200020202020202020000020202000200020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2015200000000000000000000020000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200000000000000000
2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
2000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000202000000000000000000000000000000000000020200000000000000000000000000000000000002020000000000000000000000000000000000000200000000000000000
__sfx__
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001e0301e01000000000001f0301f010000000000000000000001e0301e0101e0301e01000000000001f0301f01000000000001f0301f01000000000001e0301e0101e0301e01000000000000000000000
001000000000000000000000000004620000001061000000000000000000000000000c620000000c61000000000000000000000000000c620000000c61000000000000000000000000000c620000000c61000000
001000001177013770157700070011730137301573000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700
001000001077011770137700070010730117301373000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700
000300001d610000000000000000000000f6100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000c050000000c050000000c050000000c0500c050000000c050000000c0500e050000000f050000000c050000000c05000000000000c050000000c050000000c050000000c0500c0500e0500f05000000
001000000c750007000c750007000c750007000c7500c750007000c7500c7500c750007000070000700007000c750007000c750007000c750007000c7500c75000700007000c7500c7500c750007000070000700
__music__
00 01024344
01 01020344
00 01020444
00 01020444
02 01020344
01 06020344
00 06020344
00 06034344
02 07034344

