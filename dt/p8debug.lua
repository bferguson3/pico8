//--p8debug.lua 
key=""
function pdbg()
	p(px.." "..py,0,0,7)
	p("mode "..mode,0,8)
	p(curmap.."["..xofs..","..yofs.."]")
	rf(20,24,28,30,0)
	color(7)
	p("cpu:%"..flr(stat(1)*100),0,24)
	if stat(30)then
	 key=stat(31)
	end
	p("key:"..key,0,120)
end
