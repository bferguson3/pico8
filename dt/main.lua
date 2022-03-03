//--main.lua
rf,p=rectfill,print
pE,pO=peek,poke 
_f,_t=false,true
debug=_t
_n,_s,_e,_w=0,1,2,3
px,py,●,dir,lx=14,5,0,_n,0
xofs,yofs=0,0
curmap,mode,_fctr=0,"m",0
//-- m move c combat s script sp script pause

mapUpdated=_f

function roll(no,d,md)
	md=md or 0
	local r=0
	for y=1,no do 
		r+=flr(rnd(d)+1)
	end
	r+=md
	//--printh("roll:"..r)
	return r
end

function loadscr(scrno)
	reload(0x1400,scrlocs[scrno],1024,"data0.p8")
	txx,txy,_cursc,_pcol=6,79,scrno,7
	_loc=0
end

function _init()
	mapUpdated=_f
	cls()
	strinit()
	setmap(0)
	if mode=="c" then music(5)else 
		music(0)end
	pO(0x5f5c,255)
	//-- !!DEVELOPER MODE!!
	pO(0x5f2d,1)
	//-- !
	makeparty()
	loadscr(0)
	reload(0x1800,0,0x800,"data1.p8")
	cls()
end

party={}
function makeparty()
	party.sura=dtobj:new("sURA",3,1)
	party.koni=dtobj:new("kONI",2,3)
end

function setmap()
	if curmap>11 then curmap=0
	elseif curmap<0 then curmap=11
	end
	if curmap<6 then xofs=curmap*20
	else xofs,yofs=(curmap-6)*20,20 end
end

function moveinput()
	if btnp(⬅️)then 
		if dir==_n then dir=_w; ;mapUpdated=_f
			elseif dir==_w then dir=_s; ;mapUpdated=_f
			elseif dir==_s then dir=_e; ;mapUpdated=_f
			elseif dir==_e then dir=_n; ;mapUpdated=_f
		end
	elseif btnp(➡️)then 
		if dir==_n then dir=_e; mapUpdated=_f
			elseif dir==_e then dir=_s; mapUpdated=_f
			elseif dir==_s then dir=_w; mapUpdated=_f
			elseif dir==_w then dir=_n; mapUpdated=_f
		end
	elseif btnp(⬆️)then 
		if dir==_n and py>0 and nowall()then py-=1; sfx(5);mapUpdated=_f
			elseif dir==_w and px>0 and nowall()then px-=1; sfx(5);mapUpdated=_f
			elseif dir==_s and py<20 and nowall()then py+=1; sfx(5);mapUpdated=_f
			elseif dir==_e and px<20 and nowall()then px+=1; sfx(5);mapUpdated=_f
		end
	end
end

function scrinput()
	if btnp(🅾️)then
		rsttxt()
		if mode == "sp" then mode='s' end 
	end 
end
//--testguy={}
function _update60()
	
    if mode=="m"then 
		moveinput()
	end
	if mode=="s" then 
		doscr()
	elseif mode=="sp" then 
		scrinput()
	end
    if mode=="c"then 
        docombat()
    end

	//--! DEVELOPER MODE !
	if key=="+"then
		 curmap+=1;setmap()
	 elseif key=="-"then
		 curmap-=1;setmap()
	end
    t=dtobj:new("wIZBORG",1,2,3)
	if key=="m"then mode="m"
		_init()
	elseif key=="s"then mode="s"
		_init()
	elseif key=="c"then mode="c"
		_init()
		initcombat({t})
	end
	if key=="~"then
	  debug=false;_init()end
	key=""
	//-- !
end

function nowall()
	//-- make sure there is no wall in front of blob
	mapbase=0x2000+(yofs*128)+xofs
	_of=0
	if dir==_n then 
		_of=mb(mapbase,0,-1)
	elseif dir==_e then 
		_of=mb(mapbase,1,0)
	elseif dir==_s then 
		_of=mb(mapbase,0,1)
	elseif dir==_w then 
		_of=mb(mapbase,-1,0)
	end
	if pE(_of)==32 then return _f end
	return _t
end