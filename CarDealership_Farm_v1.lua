--[[
  CarDealership_Farm_v1  protected build
  Loader: fetch parts -> xor -> lzss -> run
]]
local _Ry8E8tm={
"https://raw.githubusercontent.com/fhuev12/CarDealership-Scripts/main/parts/CarDealership_Farm_v1.p1.txt",
"https://raw.githubusercontent.com/fhuev12/CarDealership-Scripts/main/parts/CarDealership_Farm_v1.p2.txt"
}
local _oSoaQxk={}
for _4Y9nfyB=1,#_Ry8E8tm do
  local _ehwWWyU=game:HttpGet(_Ry8E8tm[_4Y9nfyB])
  _oSoaQxk[#_oSoaQxk+1]=_ehwWWyU
end
local _I0aXCYT=table.concat(_oSoaQxk):gsub('%s+','')
local _SY0WlCg='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local _MpDH1vD={}
for _4Y9nfyB=1,#_SY0WlCg do _MpDH1vD[_SY0WlCg:sub(_4Y9nfyB,_4Y9nfyB)]=_4Y9nfyB-1 end
local function _9lqe6t6(_MVTmALQ)
  local _6HRoT4a={}
  local _UopPeZ2=#_MVTmALQ
  local _4Y9nfyB=1
  while _4Y9nfyB<=_UopPeZ2 do
    local _uHpeih3=_MpDH1vD[_MVTmALQ:sub(_4Y9nfyB,_4Y9nfyB)]
    local _mB5w4qp=_MpDH1vD[_MVTmALQ:sub(_4Y9nfyB+1,_4Y9nfyB+1)]
    local _OXYS7Tz=_MVTmALQ:sub(_4Y9nfyB+2,_4Y9nfyB+2)
    local _YVBQHPm=_MVTmALQ:sub(_4Y9nfyB+3,_4Y9nfyB+3)
    local _XoV3Hk0=(_OXYS7Tz=='=') and -1 or _MpDH1vD[_OXYS7Tz]
    local _mZKJk2w=(_YVBQHPm=='=') and -1 or _MpDH1vD[_YVBQHPm]
    if not (_uHpeih3 and _mB5w4qp) then break end
    _6HRoT4a[#_6HRoT4a+1]=string.char(_uHpeih3*4+math.floor(_mB5w4qp/16))
    if _XoV3Hk0 and _XoV3Hk0>=0 then
      _6HRoT4a[#_6HRoT4a+1]=string.char((_mB5w4qp%16)*16+math.floor(_XoV3Hk0/4))
      if _mZKJk2w and _mZKJk2w>=0 then
        _6HRoT4a[#_6HRoT4a+1]=string.char((_XoV3Hk0%4)*64+_mZKJk2w)
      end
    end
    _4Y9nfyB=_4Y9nfyB+4
  end
  return table.concat(_6HRoT4a)
end
local _mptJF20='hgTKjnOpKoutvuwvlr2y_XpHAlpz'
local _i9QwAGj=bit32
local function _51bgP97(_MVTmALQ)
  local _6HRoT4a={}
  local _dihW2kJ=#_mptJF20
  for _4Y9nfyB=1,#_MVTmALQ do
    _6HRoT4a[_4Y9nfyB]=string.char(_i9QwAGj.bxor(string.byte(_MVTmALQ,_4Y9nfyB),string.byte(_mptJF20,(_4Y9nfyB-1)%_dihW2kJ+1)))
  end
  return table.concat(_6HRoT4a)
end
local function _af0GV4p(_MVTmALQ)
  local _6HRoT4a={}
  local _4Y9nfyB=1
  local _lZPVj3g=0
  local _EceOi8C=0
  while _4Y9nfyB<=#_MVTmALQ do
    if _EceOi8C==0 then _lZPVj3g=string.byte(_MVTmALQ,_4Y9nfyB);_4Y9nfyB=_4Y9nfyB+1;_EceOi8C=8 end
    if _i9QwAGj.band(_lZPVj3g,1)==1 then
      local _Yz7aCGI=string.byte(_MVTmALQ,_4Y9nfyB)*256+string.byte(_MVTmALQ,_4Y9nfyB+1)
      local _pG69gat=string.byte(_MVTmALQ,_4Y9nfyB+2)
      _4Y9nfyB=_4Y9nfyB+3
      local _h9ZaSy8=#_6HRoT4a-_Yz7aCGI
      for _Q53412B=1,_pG69gat do _6HRoT4a[#_6HRoT4a+1]=_6HRoT4a[_h9ZaSy8+_Q53412B] end
    else
      _6HRoT4a[#_6HRoT4a+1]=string.sub(_MVTmALQ,_4Y9nfyB,_4Y9nfyB)
      _4Y9nfyB=_4Y9nfyB+1
    end
    _lZPVj3g=_i9QwAGj.rshift(_lZPVj3g,1)
    _EceOi8C=_EceOi8C-1
  end
  return table.concat(_6HRoT4a)
end
local _omsyd7Y=_51bgP97(_9lqe6t6(_I0aXCYT))
local _pG69gat=_i9QwAGj.band(string.byte(_omsyd7Y,1),255)+_i9QwAGj.lshift(_i9QwAGj.band(string.byte(_omsyd7Y,2),255),8)+_i9QwAGj.lshift(_i9QwAGj.band(string.byte(_omsyd7Y,3),255),16)+_i9QwAGj.lshift(_i9QwAGj.band(string.byte(_omsyd7Y,4),255),24)
local _NleQeyb=string.sub(_omsyd7Y,5,4+_pG69gat)
local _akhMaN1=_af0GV4p(_NleQeyb)
local _Su8qnqC=(loadstring or load)(_akhMaN1,'@CarDealership_Farm_v1')
if not _Su8qnqC then error('protected payload failed to load') end
_Su8qnqC()
