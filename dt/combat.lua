//-- combat.lua
combatants={}
_cb=combatants
cbtstate="n" //-- n next i input w wait
nextc=nil

function initiative()
    for c=1,#_cb do 
        _cb[c].init=roll(1,20)
    end
end

function initcombat(cbts)
    for c=1,#cbts do 
        combatants[c]=cbts[c]
    end
    initiative()
end

function nextcturn()
    n=nil
    ::again::
    for c=1,#_cb do 
        if _cb[c].init~=0 then 
            _cb[c].init-=1
            if _cb[c].init==0 then 
                n=_cb[c]
            end 
        else n=_cb[c] end
    end
    if n==nil then goto again else return n end 
end

function docombat()
    if cbtstate=="n"then 
        nextc=nextcturn()
        cbtstate=""
    end
end

function endcombat()
    combatants={}
end

epos={{x=8,y=8},{x=46,y=8},{x=8,y=46},{x=46,y=46}}

function drawcombat()
    //-- clear map
	rf(8,8,72,72,0)
	pal(14,8)
	//-- draw enemies
    local ii=1
    for i=1,#_cb do 
        if _cb[ii].type=="e"then
            sspr(_cb[ii].sprx,_cb[ii].spry,32,32,epos[i].x,epos[i].y)
            print(_cb[ii].name,16,71+(ii*8),7) //--name
            pal(8,6)
            local ofs=0
            for h=1,_cb[ii].mhp do spr(28,60+(ofs*2),72+(8*ii));ofs+=1 end
            for m=1,_cb[ii].msp do spr(29,59+(ofs*2),71+(8*ii));ofs+=1 end
            ofs=0
            pal(8,8)
            for h=1,_cb[ii].hp do spr(28,60+(ofs*2),72+(8*ii));ofs+=1 end
            pal(8,12)
            for m=1,_cb[ii].sp do spr(29,59+(ofs*2),71+(8*ii));ofs+=1 end
            i+=1
        end
    end
    pal(8,8)
    rect(79,48,94,63,7)
end