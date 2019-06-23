
local _M = {}

local function get_name( ... )
    -- body
    return "lucky"
end

function _M.greeting( ... )
    -- body
    print("hello"..get_name())
end


return _M
