//--scripts.lua 
_loc=0
txx,txy,_cursc,_pcol=6,79,0,7 	//-- cursor position and current script and print color
scrlocs={0}				//-- locations in hex in data cart of script scene start 
_fs={}					//-- table of script functions callable remotely 
_fs['A']=function() printh("hi wrold") end 
_fs['E']=function() mode="m";NEXTCHR=nil; end 

//-- script codes:
//-- # wait for keypress to continue script 
//-- $ end of script - return to game 
//-- @ color change - next byte is new color 
//-- \\ newline 
//-- %a..%z - call "function f_a...f_z"
//-- if script[nex] is ord('%') then _fs[nex+1]() end 
//--str data stored $1400-$17ff
//--data in carts is from 0h-30ffh (12.2kB)
//-- stdop is print 1 chr at a time by getting chr(pE(x)) and incrementing txx/txy 
//--_loc is current ofs in script 

NEXTCHR=''

_rstbox=_f
function rsttxt()
    txx=6;txy=79;_rstbox=_t
end

function doscr()
    nc=chr(pE(0x1400+_loc))
    //--printh(nc)
    color(_pcol) 
    if nc=="\\" then 
        _loc+=1
        nc=chr(pE(0x1400+_loc))
        if nc=="\\" then 
            nc=nil
            txy+=8; txx=6;
        end
    end
    if nc=='#'then //--must be EOL char
        nc=nil
        _loc+=1
        mode="sp"
    elseif nc=='%'then 
        _loc+=1
        nc=chr(pE(0x1400+_loc))
        _fs[nc]()
        nc=nil
    end
    NEXTCHR=nc
    if NEXTCHR then txx+=4 end 
    _loc+=1
end