
local _M = {}

local function get_name( ... )
    -- body
    return "lucky"
end

local function get_name2(self, v)
    print("v", v)
end    

function _M.greeting( ... )
    -- body
    print("hello"..get_name())
    get_name2(self, 3)
end


return _M
