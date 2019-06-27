local s_base = require("object.s_base")

local _M = {_VERSION = '0.0.1'}

_M = setmetatable(_M, {__index = s_base})


function _M.lower( s )
    -- body
    return string.lower(s)
end

return _M

-- FFI

