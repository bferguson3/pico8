//--strings.lua
chars=" !\"#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~"
-- '
s2c={}
c2s={}
function strinit()
	for i=1,95 do
	 c=i+31
	 s=sub(chars,i,i)
	 c2s[c]=s
	 s2c[s]=c
	end
end
function chr(i)
 	return c2s[i]
end
function ord(s,i)
 	return s2c[sub(s,i or 1,i or 1)]
end
function chrs(...)
	local t={...}
	local r=""
	for i=1,#t do
		r=r..c2s[t[i]]
	end
	return r
end
