//--dtobj.lua

dtobj={}
    dtobj.hp,dtobj.sp,dtobj.mhp,dtobj.msp,dtobj.init=1,1,2,2,0
    dtobj.xp=1
    dtobj.name,dtobj.type="test","p"
    dtobj.sprx,dtobj.spry=0,96

st_mt={__index=obj}

function dtobj:new(name,mhp,msp,xp,type)
    local o={}
        o.hp=mhp or 1
        o.sp=msp or 1
        o.mhp=mhp or 1
        o.msp=msp or 1
        o.init=0
        o.xp=xp or 0
        o.name=name or "none"
        o.type=type or "e"
        o.sprx=0;o.spry=96
    
    o.getname=function()return o.name end 
    setmetatable(o,st_mt)
    return o
end