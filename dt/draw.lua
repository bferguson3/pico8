//--draw.lua
_symf=0
function ui()
	//-- faces:
	sspr(0,32,16,16,80,8)
	sspr(16,32,16,16,80,24)
	palt(0,_t)
	//-- border:
	for i=1,8 do
		spr(9,i*8,0)
		spr(9,i*8,72,1,1,0,1)
		spr(10,72,i*8,1,1,0,1)
	end
	for i=1,15 do
		spr(10,0,i*8)
		spr(9,i*8,69)
		spr(9,i*8,120)
	end
	spr(11,0,0,1,1,_t)
	spr(11,72)
	spr(11,72,69)
	spr(11,3,69)
	spr(11,3,120)
	//-- icons
	sspr(80,16,16,16,79,48)
	sspr(96,16,16,16,95,48)
	sspr(112,16,16,16,111,48)
	p("●  "..●,100,66,10)
	palt(0,_f)
	//-- hp/mp
	partyui()
end

function partyui()
	pal(8,6)
	for h=1,party.koni.mhp do spr(28,93+(h*2),25) end
	for m=1,party.koni.msp do spr(29,91+(m*2),32) end
	for h=1,party.sura.mhp do spr(28,93+(h*2),9) end
	for m=1,party.sura.msp do spr(29,91+(m*2),16) end
	pal(8,12)
	//sp
	for m=1,party.koni.sp do spr(29,91+(m*2),32) end
	for m=1,party.sura.sp do spr(29,91+(m*2),16) end
	pal(8,8)
	//hp
	for h=1,party.koni.hp do spr(28,93+(h*2),25) end
	for h=1,party.sura.hp do spr(28,93+(h*2),9) end
end

function i_off()
	for i=4,9 do
		for j=3,4 do
			spr(8,(i*8)+47,(j*8)+24)
		end
	end
end

function fog()
	for x=8,64,8 do
		spr(8,x,36)
	end 
end

_tpc=1
function tswap()
	if _tpc then 
		palt(0,_f)
		palt(14,_t)
		_tpc=nil 
	else 
		palt(0,_t)
		palt(14,_f)
		_tpc=1 
	end
end

//--spr19=sky decor, spr18=ground decor

function rnddecor()
	//--fixme
	local no=roll(1,3)
	for d=1,no do 
		local x=roll(1,8)
		local y=roll(1,4)
		spr(19,x*8,y*8)
	end
	no=roll(1,3)
	for d=1,no do 
		local x=roll(1,8)
		local y=roll(1,4)
		spr(18,x*8,36+(y*8))
	end
end

function _draw()
	if mapUpdated==_f then 
		palt(0,_f)
		palt(14,_t)
		rf(0,0,128,78,0)
		//-- fill with sky and grass 20/17
		for y=8,64,8 do 
			if y<33 then _s=20 else _s=17 end
			for x=8,64,8 do 
				spr(_s,x,y)
			end
		end
		rnddecor()
		fog()
		palt(14,_t)
		//--printh(mapUpdated)
		drawwalls()
		mapUpdated=_t
	end //--drawdungeon.lua 
	if _fctr==0 then 
		pal(10,7)
		drawwalls()
	end
	pal(10,10)
	if _fctr==5 then drawwalls() end 
	if _rstbox then 
		rf(0,78,128,128,0)
		_rstbox=false
	end
	ui()
	//-- combat draw
	if mode~="c"then i_off()
		else drawcombat()end 
	color(7)
	if debug then 
		pdbg()
	end
	//-- map mode draw
	if mode=="m"then
		ds=""
		if dir==_n then ds="nORTH"
			elseif dir==_s then ds="sOUTH"
			elseif dir==_e then ds="eAST"
			elseif dir==_w then ds="wEST"
		end
		p(ds,32,0)
	end
	
	//-- script engine
	if NEXTCHR then 
		p(NEXTCHR,txx,txy,_pcol)
	end 
	//-- script pause - show gem
	if mode=="sp" then flashgem(120,115)
		else rf(120,115,128,122,0)end
	
	//-- frame counter
	_fctr+=1; if _fctr>59 then _fctr=0 end
	dradar()
end

function dradar()
	//--radar 
	rx,ry=61,9
	base=mb(mapbase,-2,-2)
	rf(rx-1,ry-1,rx+10,ry+10,3)
	if _fctr % 2 == 0 then 
		rect(rx-1,ry-1,rx+10,ry+10,11) end 
	for j=0,4 do
		for i=0,4 do
			if pE(base+i)==32 then 
				rect(rx+(i*2),ry,rx+1+(i*2),ry+1,7)
			end	
		end
		base+=128
		ry+=2
	end
	rect(65,13,66,14,11)
end

function flashgem(x,y)
	if _fctr%10<5 then 
		spr(12,x,y)
	else 
		spr(13,x,y)
	end
end