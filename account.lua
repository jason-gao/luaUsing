local _M = {}

local mt = {__index = _M}

function _M.deposit( self ,v)
    -- body
    self.balance = self.balance + v
end

function _M.withdraw( self, v )
    -- body
    if self.balance > v then
        self.balance = self.balance - v 
    else
        error("insufficient funds")
    end            
end

function _M.new(self, balance)
    balance = balance or 0
    return setmetatable({balance = balance}, mt)
end

return _M

-- 调用代码前先定义函数
-- 好的方式 封装成模块调用


-- my_module.lua
-- local _M = {_VERSION = "0.1"}

-- function _M.foo()
--     -- your code
--     print("i'm foo")
-- end

-- return _M
-- 然后，再在 content_by_lua_file 指向的 .lua 文件中调用它：
-- local my_module = require "my_module"
-- my_module.foo()

