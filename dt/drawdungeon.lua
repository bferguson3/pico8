//--drawdungeon.lua 
wall_a=1
wall_b=17
door_s=24
door_lx=64
door_ly=0
t={}

function tileit(start,nd,ofs,incr)
	local m=0
	for u=start,nd do 
		t[u]=pE(ofs+m)
		m+=incr
	end
end

function mb(base,x,y)
	return (base + ((py+y)*128)+(px+x))
end

function drawwalls()
	for i=0,18 do t[i]=0 end 
	mapbase=0x2000+(yofs*128)+xofs
	if dir==_n then
		//if py>2 then 
			_mo=mb(mapbase,-2,-3)
			tileit(0,4,_mo,1)
		//end
		//if py>1 then 
			_mo=mb(mapbase,-2,-2)
			tileit(5,9,_mo,1)
		//end 
		_mo=mb(mapbase,-2,-1)
		tileit(11,13,_mo+1,1)
		_mo=mb(mapbase,-2,0)
		tileit(16,18,_mo+1,1)
	elseif dir==_e then 
		//if px<17 then 
			_mo=mb(mapbase,3,-2)
			tileit(0,4,_mo,128)
		//end 
		//if px<18 then 
			_mo=mb(mapbase,2,-2)
			tileit(5,9,_mo,128)
		//end 
		_mo=mb(mapbase,1,-1)
		tileit(11,13,_mo,128)
		_mo=mb(mapbase,0,-1)
		tileit(16,18,_mo,128)
	elseif dir==_w then 
		//if px>3 then 
			_mo=mb(mapbase,-3,2)
			tileit(0,4,_mo,-128)
		//end 
		//if px>2 then 
			_mo=mb(mapbase,-2,2)
			tileit(5,9,_mo,-128)
		//end 
		_mo=mb(mapbase,-1,1)
		tileit(11,13,_mo,-128)
		_mo=mb(mapbase,0,1)
		tileit(16,18,_mo,-128)
	elseif dir==_s then 
		//if py<17 then 
			_mo=mb(mapbase,2,3)
			tileit(0,4,_mo,-1)
		//end
		//if py<18 then 
			_mo=mb(mapbase,2,2)
			tileit(5,9,_mo,-1)
		//end 
		_mo=mb(mapbase,2,1)
		tileit(11,13,_mo-1,-1)
		_mo=mb(mapbase,2,0)
		tileit(16,18,_mo-1,-1)
	end
	//-- t[] now contains the tile data in the view position array:
	//-- add 16 if x%2==0
	//-- back row 
	ab=0
	if t[0]==32 then 
		spr(wall_a,8,32)
		spr(wall_a,8,40)
	end 
	if t[4]==32 then 
		spr(wall_a,64,32)
		spr(wall_a,64,40)
	end 
	if t[1]==32 then 
		spr(wall_a,16,32)
		spr(wall_a,16,40)
		spr(wall_a,24,32)
		spr(wall_a,24,40)
		//--if t[1]==door_s then //--door
		//--	spr(door_s,20,39)
		//--end
	elseif t[1]==21 then 
		sspr(48,0,16,16,18,37,8,8)
	end
	 
	if t[3]==32 then 
		spr(wall_a,48,32)
		spr(wall_a,48,40)
		spr(wall_a,56,32)
		spr(wall_a,56,40)
		//--if t[3]==door_s then
		//--	spr(door_s,52,39)
		//--end
	elseif t[3]==21 then 
		sspr(48,0,16,16,54,37,8,8)
	end
	 
	if t[2]==32 then 
		spr(wall_a,32,32)
		spr(wall_a,32,40)
		spr(wall_a,40,32)
		spr(wall_a,40,40)
		//--if t[2]==door_s then
		//--	spr(door_s,36,39)
			//--end
	elseif t[2]==21 then 
		sspr(48,0,16,16,36,37,8,8)
	end
	//-- row 2
	if t[5]==32 then 
		spr(wall_a,8,32)
		spr(wall_a,8,40)
		spr(wall_a+4,8,24)
		spr(wall_a+1,8,48)
	end
	if t[9]==32 then 
		spr(wall_a,64,32)
		spr(wall_a,64,40)
		spr(wall_a+3,64,24)
		spr(wall_a+2,64,48)
	end
	if t[6]==32 then
		for y=24,40,16 do 
			for x=8,16,16 do 
				sspr(0,48,16,16,x,y)
			end 
		end 
		spr(wall_a,24,32,1,1,1) 
		spr(wall_a,24,40,1,1,1) 
		spr(wall_a+4,24,24)
		spr(wall_a+1,24,48)
	elseif t[6]==21 then 
		sspr(48,0,16,16,9,34)
	end
	if t[8]==32 then 
		for y=24,40,16 do 
			for x=56,64,16 do 
				sspr(0,48,16,16,x,y)
			end 
		end 
		spr(wall_a,48,32,1,1,1) 
		spr(wall_a,48,40,1,1,1) 
		spr(wall_a+2,48,48)
		spr(wall_a+3,48,24)
	elseif t[8]==21 then 
		sspr(48,0,16,16,55,34)
	end
	if t[7]==32 then 
		for y=24,40,16 do 
			for x=24,40,16 do 
				sspr(0,48,16,16,x,y)
			end 
		end 
	elseif t[7]==21 then 
		sspr(48,0,16,16,32,34)
	end
	//--
	if t[11]==32 then 
		spr(wall_a+4,16,16)
		spr(wall_a+1,16,56)
		for y=24,48,8 do 
			spr(wall_a,16,y) 
		end
		for y=16,48,16 do 
			sspr(112,0,8,16,8,y)
		end
	elseif t[11]==21 then 
		sspr(56,0,8,16,4,28,16,32)	
	end
	if t[13]==32 then 
		spr(wall_a+3,56,16)
		spr(wall_a+2,56,56)
		for y=24,48,8 do 
			spr(wall_a,56,y) 
		end
		for y=16,48,16 do 
			sspr(112,0,8,16,64,y)
		end
	elseif t[13]==21 then 
		sspr(48,0,8,16,60,28,16,32)
	end
	if t[12]==32 then 
		for y=0,2 do 
		    for x=0,2 do 
				if y==1 then aa=_t else aa=_f end 
				sspr(112,0,16,16,16+(x*16),16+(y*16),16,16,aa,bb)
			end
		end
		for y=16,48,16 do 
			//sspr(120,0,8,16,64,y)
		end
	elseif t[12]==21 then 
		sspr(48,0,16,16,24,28,32,32)
	end
	//-- row 0
	if t[16]==32 then 
		for y=16,48,16 do 
			sspr(120,0,8,16,8,y,8,16,_t,_f)
		end
		spr(wall_a+4,8,8)
		spr(wall_a+1,8,64)
	end
	if t[18]==32 then 
		for y=16,48,16 do 
			sspr(112,0,8,16,64,y,8,16,_t,_f)
		end
		spr(wall_a+3,64,8)
		spr(wall_a+2,64,64)
	end
	
end
//--01234
//--56789
//-- 123
//-- 6x8
