
-- start demo

-- print
print("hello world")


--  func
local function println()
    print("\n")
end

-- 基本数据类型

-- type
print(type("hello world"))
print(type(print))
print(type(true))
print(type(360.0))
print(type(nil))

-- nil
-- OpenResty 的 Lua 接口还提供了一种特殊的空值，即 ngx.null，用来表示不同于 nil 的“空值”
local num
print(num)
num = 100
print(num)

-- boolean
local a = true
local b = 0
local c = nil
if a then
    print("a")
else
    print("not a")
end

if b then 
    print("b")
else
    print("not b")
end


if c then
    print("c")
else
    print("not c")
end

-- number
local order = 3.99
local score = 98.01
print(math.floor(order))
print(math.ceil(score))
-- print(9223372036854775807LL - 1)


-- string
-- Lua 的字符串是不可改变的值，不能像在 c 语言中那样直接修改字符串的某个字符，而是根据修改要求来创建一个新的字符串。Lua 也不能通过下标来访问字符串的某个字符
--[[
字符串还可以用一种长括号（即[[\]\]）
括起来的方式定义。我们把两个正的方括号（即[[）间插入 n 个等号定义为第 n 级正长括号。就是说，
0 级正的长括号写作 [[ ，一级正的长括号写作 [=[，如此等等。反的长括号也作类似定义；
举个例子，4 级反的长括号写作 ]====]。一个长字符串可以由任何一级的正的长括号开始，
而由第一个碰到的同级反的长括号结束。整个词法分析过程将不受分行限制，不处理任何转义符，
并且忽略掉任何不同级别的长括号。这种方式描述的字符串可以包含任何东西，当然本级别的反长括号除外。
例：[[abc\nbc]\]，里面的 "\n" 不会被转义
--]]
local str1 = 'hello world'
local str2 = 'hello lua'
local str3 = [["add\name", 'hello', 'a\b', 'a/b', 'abc\nbc']]
local str4 = [=[string hava a [[]].]=]
local str5 = "a\nb"
print(str1)
print(str2)
print(str3)
print(str4)
print(str5)

-- table
-- https://moonbingbing.gitbooks.io/openresty-best-practices/lua/table_library.html
local  corp = {
    web = "www.google.com",
    telephone = "12345678",
    staff = {"Jack", "Scott", "Gary"},
    100876,
    100191,
    [10] = 360,
    ["city"] = "Beijing"
}
print(type(corp))
print(corp)
print(corp.web)
print(corp.telephone)
print(corp[1])
print(corp[2])
print(corp["city"])
print(corp.staff[1])
print(corp[10])


--  function
local function foo()
    print("in the function")
    -- dosomething
    local x = 10
    local y = 20
    return x + y    
end

local a = foo
print(a())


-- 表达式

-- 算术运算符
print(1+2)
print(5/10)
print(5.0/10)
print(10/0)
local num = 1357
print(num % 2)
print((num % 2) == 1)
print((num % 2 ) == 0)

-- 关系运算符
print("关系运算符")
print(1<2)
print(1 == 2)
print(1 ~= 2)
local a, b = true, false
print(a == b)

local a = { x = 1, y = 0}
local b = { x = 1, y = 0}
print(a, b)
if a == b then
    print("a==b")
else
    print("a~=b")
end

-- 逻辑运算符
local c = nil
local d = 0
local e = 100
print(c and d)
print( c and e)
print(d and e)
print(c or d)
print( c or e)
print( not c)
print(not d)

-- 字符串拼接
print("hello" .. "world")
print(0 .. 1)
str1 = string.format( "%s%s", "hello", "world")
print(str1)

str2 = string.format( "%d-%s-%.2f", 123, "world", 1.21)
print(str2)

local pieces = {}

local my_list = {
    "a",
    "b"
}

for i, elem in pairs(my_list) do
    pieces[i] = elem
end
local res = table.concat(pieces, ",")
print(res)

-- 优先级
local a, b = 1, 2
local x, y = 3, 4
local i = 10
local res = 0
res = a + i < b/2 + 1  -->等价于res =  (a + i) < ((b/2) + 1)
res = 5 + x^2*8        -->等价于res =  5 + ((x^2) * 8)
res = a < y and y <=x  -->等价于res =  (a < y) and (y <= x)


-- 控制结构
local x = 10
if x > 0  then
    print("x is a positive number")
end    

local x = 10
if x > 10 then
    print("x grater then 10")
else
    print("x less then 10")
end

local score = 90
-- score = 50
if score == 100 then
    print("you score is 100")
elseif score >= 60 then
    print("you score is grater then 60 ,you have passed it")
else
    print("sorry")
end

local score = 0
if score == 100 then
    print("Very good!Your score is 100")
elseif score >= 60 then
    print("Congratulations, you have passed it,your score greater or equal to 60")
else
    if score > 0 then
        print("Your score is better than 0")
    else
        print("My God, your score turned out to be 0")
    end --与上一示例代码不同的是，此处要添加一个end
end

-- 1 + 2 + 3 + 4 + 5 
local x = 1
local sum = 0
while x <= 5  do
    print("before", sum, x, "\n")
    sum = sum + x
    x = x + 1
    print("after", sum, x, "\n")
end
print(sum)


local t = {1, 3, 5, 8, 11, 18, 21}

local i
for i,v in ipairs(t) do
    if 11 == v then
        print("index[" .. i .. "] have right value[11]")
        break
    end
end

for i = 1, 5 do
    print(i)
  end

print("\n")

for i = 1, 10, 2 do
    print(i)
end

print("\n")

for i = 10, 1, -1 do
    print(i)
end

print("\n")

local a = {"a", "b", "c", "d"}
for i, v in ipairs(a) do
  print("index:", i, " value:", v)
end

local days = {
    "Sunday", "Monday", "Tuesday", "Wednesday",
    "Thursday", "Friday", "Saturday"
}

local revDays = {
    ["Sunday"] = 1,
    ["Monday"] = 2,
    ["Tuesday"] = 3,
    ["Wednesday"] = 4,
    ["Thursday"] = 5,
    ["Friday"] = 6,
    ["Saturday"] = 7
}

local x = "Tuesday"
print(revDays[x]) 


local days = {
    "Monday", "Tuesday", "Wednesday", "Thursday",
    "Friday", "Saturday","Sunday"
 }
 local revDays = {}
 for k, v in pairs(days) do
   revDays[v] = k
 end 

 for k,v in pairs(revDays) do
    print("k:", k, " v:", v)
  end

  print("\n")

  --  goto
  -- http://lua-users.org/wiki/GotoStatement
  for i=1, 3 do
    if i <= 2 then
        print(i, "yes continue")
        goto continue
    end

    print(i, " no continue")

    ::continue::
    print([[i'm end]])
end

println()

local function process(input)
    print("the input is", input)
    if input < 2 then
        goto failed
    end
    -- 更多处理流程和 goto err

    print("processing...")
    do return end
    ::failed::
    print("handle error with input", input)
end

process(1)
process(3)

println()

-- 函数

local function max(a, b)
    local temp = nil
    if (a > b) then
        temp = a
    else
        temp = b
    end
    return temp        
end

local m = max(10,20)
print(m)
