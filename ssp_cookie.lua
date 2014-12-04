ngx.header.content_type = 'text/html'

local _uuid = require 'uuid'

--cookie key
local _k = 'mykey'
--key值
local _v = _uuid.generate()
--cookie域
local _d = 'xx.com'
--cookie过期时间
local _e = ngx.cookie_time(ngx.time()+31622400);

--增加识别
local _key = _k.."=xx_"   

local _cookies = ngx.var.http_cookie
if string.find(_cookies,_key) then
return
end

local ck_value = _key .._v..';path =/;\
                domain ='.. _d ..';httponly =true;\
                expires ='.. _e
                
--ngx.say(ck_value)                
ngx.header['Set-Cookie'] = {ck_value}


