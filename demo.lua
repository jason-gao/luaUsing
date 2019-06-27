-- start demo

package.path = "/Users/crystal/codes/lua/luaUsing/?.lua;;"
-- package.path = package.path..";/Users/crystal/codes/lua/luaUsing/?.lua;"
print(package.path)
print("\n")
print(package.cpath)

local account = require("account")
local my_module = require("module")
local s_more = require("object.s_more")

-- do return end

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
local str1 = "hello world"
local str2 = "hello lua"
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
local corp = {
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

-- table 赋值

-- 简单的 table
mytable = {}
print("mytable 的类型是 ",type(mytable))

mytable[1]= "Lua"
mytable["wow"] = "修改前"
print("mytable 索引为 1 的元素是 ", mytable[1])
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

-- alternatetable和mytable的是指同一个 table
alternatetable = mytable

print("alternatetable 索引为 1 的元素是 ", alternatetable[1])
print("mytable 索引为 wow 的元素是 ", alternatetable["wow"])

alternatetable["wow"] = "修改后"

print("mytable 索引为 wow 的元素是 ", mytable["wow"])

-- 释放变量
alternatetable = nil
print("alternatetable 是 ", alternatetable)

-- mytable 仍然可以访问
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

mytable = nil
print("mytable 是 ", mytable)

-- do return end

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
print(1 + 2)
print(5 / 10)
print(5.0 / 10)
print(10 / 0)
local num = 1357
print(num % 2)
print((num % 2) == 1)
print((num % 2) == 0)

-- 关系运算符
print("关系运算符")
print(1 < 2)
print(1 == 2)
print(1 ~= 2)
local a, b = true, false
print(a == b)

local a = {x = 1, y = 0}
local b = {x = 1, y = 0}
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
print(c and e)
print(d and e)
print(c or d)
print(c or e)
print(not c)
print(not d)

-- 字符串拼接
print("hello" .. "world")
print(0 .. 1)
str1 = string.format("%s%s", "hello", "world")
print(str1)

str2 = string.format("%d-%s-%.2f", 123, "world", 1.21)
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
res = a + i < b / 2 + 1 -->等价于res =  (a + i) < ((b/2) + 1)
res = 5 + x ^ 2 * 8 -->等价于res =  5 + ((x^2) * 8)
res = a < y and y <= x -->等价于res =  (a < y) and (y <= x)

-- 控制结构
local x = 10
if x > 0 then
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
while x <= 5 do
    print("before", sum, x, "\n")
    sum = sum + x
    x = x + 1
    print("after", sum, x, "\n")
end
print(sum)

local t = {1, 3, 5, 8, 11, 18, 21}

local i
for i, v in ipairs(t) do
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
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
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
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
}
local revDays = {}
for k, v in pairs(days) do
    revDays[v] = k
end

for k, v in pairs(revDays) do
    print("k:", k, " v:", v)
end

print("\n")

--  goto
-- http://lua-users.org/wiki/GotoStatement
for i = 1, 3 do
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
    do
        return
    end
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

local m = max(10, 20)
print(m)

--[[
    create_a_counter()会返回一个匿名函数
    （在Lua中，函数和其他数据一样，是可以指定给变量来存储的）。
    这个匿名函数会把count加1后再回传。
    在匿名函数中的变量count既不是全局变量也不是区域变量，而是一种称为external local variable（外部局部变量，又称upvalue）的变量。
    这个变量的值会一直被保存在匿名函数中。因此调用create_a_counter()时产生一个记数器函数，每次调用记数器函数，都会得到一个比上次大1的值。
--]]
function create_a_counter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

for i = 1, 5 do
    print(i)
end

local foo = {}
foo.bar = function(a, b, c)
    print(a, b, c)
end

print(foo.bar)

-- 值传递
local function swap(a, b) --定义函数swap,函数内部进行交换两个变量的值
    print("值传递")
    local temp = a
    a = b
    b = temp
    print(a, b)
end

local x = "hello"
local y = 20
print(x, y)
swap(x, y) --调用swap函数
print(x, y) --调用swap函数后，x和y的值并没有交换

println()

local function fun1(a, b) --两个形参，多余的实参被忽略掉
    print(a, b)
end

local function fun2(a, b, c, d) --四个形参，没有被实参初始化的形参，用nil初始化
    print(a, b, c, d)
end

local x = 1
local y = 2
local z = 3

fun1(x, y, z) -- z被函数fun1忽略掉了，参数变成 x, y
fun2(x, y, z) -- 后面自动加上一个nil，参数变成 x, y, z, nil

-- 变长参数
local function func(...)
    local temp = {...} -- 访问的时候也要使用 ...
    local ans = table.concat(temp, " ")

    print(ans)
end

func(1, 2)
func(1, 2, 3)

-- 具名参数

local function change(arg)
    print(arg) -- table时候传递是引用
    arg.width = arg.width * 2
    arg.height = arg.height * 2
    return arg
end

local rectangle = {width = 20, height = 15}
print("before change:", "width  = ", rectangle.width, "height = ", rectangle.height)
local r = change(rectangle)
print(r)
print("after change:", "width  = ", r.width, "height = ", r.height)

println()

-- 引用传递

function change(arg) --change函数，改变长方形的长和宽，使其各增长一倍
    arg.width = arg.width * 2 --表arg不是表rectangle的拷贝，他们是同一个表
    arg.height = arg.height * 2
end -- 没有return语句了

local rectangle = {width = 20, height = 15}
print("before change:", "width = ", rectangle.width, " height = ", rectangle.height)
change(rectangle)
print("after change:", "width = ", rectangle.width, " height =", rectangle.height)

--  函数返回值

local s, e = string.find("hello world", "llo")
print(s, e) -->output 3  5

local function swap(a, b) -- 定义函数 swap，实现两个变量交换值
    return b, a -- 按相反顺序返回变量的值 返回多个值时，值之间用“,”隔开
end

local x = 1
local y = 20
x, y = swap(x, y) -- 调用 swap 函数
print(x, y) --> output   20     1

-- 参数调整
local function init() --init 函数 返回两个值 1 和 "lua"
    return 1, "lua"
end

x = init()
print(x)

x, y, z = init()
print(x, y, z)

-- 当一个函数有一个以上返回值，且函数调用不是一个列表表达式的最后一个元素，那么函数调用只会产生一个返回值, 也就是第一个返回值

local function init() -- init 函数 返回两个值 1 和 "lua"
    return 1, "lua"
end

local x, y, z = init(), 2 -- init 函数的位置不在最后，此时只返回 1
print(x, y, z) -->output  1  2  nil

local a, b, c = 2, init() -- init 函数的位置在最后，此时返回 1 和 "lua"
print(a, b, c) -->output  2  1  lua

local function init()
    return 1, "lua"
end

print(init(), 2)   -->output  1  2
print(2, init())   -->output  2  1  lua

-- 如果你确保只取函数返回值的第一个值，可以使用括号运算符
-- 值得一提的是，如果实参列表中某个函数会返回多个值，同时调用者又没有显式地使用括号运算符来筛选和过滤，则这样的表达式是不能被 LuaJIT 2 所 JIT 编译的，而只能被解释执行。

local function init()
    return 1, "lua"
end

print((init()), 2)   -->output  1  2
print(2, (init()))   -->output  2  1


-- 全动态函数
-- https://www.cnblogs.com/faithfu/p/8876441.html

-- lua 版本 <= 5.1 unpack lua 版本 > 5.1 table.unpack

-- unpack兼容写法
unpack = unpack or table.unpack

local info = {1,2,nil, 3,4,5,6}
print(info[2])
print(info[3])
print(info[4])
local a,b,c,d,e,f = unpack(info)
print(a,b,c,d,e,f)

local info={1,2,3,nil,5,p=6}
local a,b,c,d,e,f = unpack(info)
print(a,b,c,d,e,f)


-- lua <= 5.1
local function fun1(...)
    print("fun1", unpack(arg))  
end

fun1(1,nil,3) -- 1,nil,3

-- lua >= 5.2

local function fun2(...)
    local arg = { ... }
    print("fun2", unpack(arg))
end
fun2(1,nil,3) -- 1,nil,3

local args = {...} or {}
-- method_name(table.unpack(args, 1, table.maxn(args)))
print(_VERSION)

local function run(x, y)
    print("run", x, y)
end


local function attack(targetId)
    print('targetId', targetId)
end

local function do_action(method, ...)
    local args = {...} or {}
    method(unpack(args))
end    

do_action(run, 1, 2)         -- output: run 1 2
do_action(attack, 1111)      -- output: targetId    1111

-- 模块


my_module.greeting(1,2,3,4)

do return end

print(string.byte("abc", 1, 3))
print(string.byte("abc", 3)) -- 缺少第三个参数，第三个参数默认与第二个相同，此时为 3
print(string.byte("abc"))    -- 缺少第二个和第三个参数，此时这两个参数都默认为 1


print(string.char(96, 97, 98))
print(string.char())        -- 参数为空，默认是一个0，
                            -- 你可以用string.byte(string.char())测试一下
print(string.char(65, 66))

print(string.upper("Hello Lua"))  -->output  HELLO LUA

print(string.lower("Hello Lua"))  -->output   hello lua

print(string.len("hello lua")) -->output  9

-- 由于 Lua 字符串的长度是专门存放的，并不需要像 C 字符串那样即时计算，因此获取字符串长度的操作总是 O(1) 的时间复杂度。
print(#"hello lua")

local find = string.find
print(find("abc cba", "ab"))
print(find("abc cba", "ab", 2))     -- 从索引为2的位置开始匹配字符串：ab
print(find("abc cba", "ba", -1))    -- 从索引为7的位置开始匹配字符串：ba
print(find("abc cba", "ba", -3))    -- 从索引为5的位置开始匹配字符串：ba
print(find("abc cba", "(%a+)", 1))  -- 从索引为1处匹配最长连续且只含字母的字符串
print(find("abc cba", "(%a+)", 1, true)) --从索引为1的位置开始匹配字符串：(%a+)

print(string.format("%.4f", 3.1415926))     -- 保留4位小数
print(string.format("%d %x %o", 31, 31, 31))-- 十进制数31转换成不同进制
d = 29; m = 7; y = 2015                     -- 一行包含几个语句，用；分开
print(string.format("%s %02d/%02d/%d", "today is:", d, m, y))

print(string.match("hello lua", "lua"))
print(string.match("lua lua", "lua", 2))  --匹配后面那个lua
print(string.match("lua lua", "hello"))
print(string.match("today is 27/7/2015", "%d+/%d+/%d+"))


s = "hello world from Lua"
for w in string.gmatch(s, "%a+") do  --匹配最长连续且只含字母的字符串
    print(w)
end

t = {}
s = "from=world, to=Lua"
for k, v in string.gmatch(s, "(%a+)=(%a+)") do  --匹配两个最长连续且只含字母的
    t[k] = v                                    --字符串，它们之间用等号连接
end
for k, v in pairs(t) do
print (k,v)
end


print(string.rep("abc", 3)) --拷贝3次"abc"


print(string.sub("Hello Lua", 4, 7))
print(string.sub("Hello Lua", 2))
print(string.sub("Hello Lua", 2, 1))    --看到返回什么了吗
print(string.sub("Hello Lua", -3, -1))


-- http://www.lua.org/manual/5.3/manual.html#pdf-string.byte

print(string.gsub("Lua Lua Lua", "Lua", "hello"))
print(string.gsub("Lua Lua Lua", "Lua", "hello", 2)) --指明第四个参数

print(string.reverse("Hello Lua"))  --> output: auL olleH


-- table module
-- http://www.lua.org/manual/5.3/manual.html#pdf-table.insert

local color={first="red", "blue", third="green", "yellow"}
print(color["first"])                 --> output: red
print(color[1])                       --> output: blue
print(color["third"])                 --> output: green
print(color[2])                       --> output: yellow
print(color[3])                       --> output: nil


local a = {1, 3, 5, "hello" }
print(table.concat(a))              -- output: 135hello
print(table.concat(a, "|"))         -- output: 1|3|5|hello
print(table.concat(a, " ", 4, 2))   -- output:
print(table.concat(a, " ", 2, 4))   -- output: 3 5 hello



local a = {1, 8}             --a[1] = 1,a[2] = 8
table.insert(a, 1, 3)   --在表索引为1处插入3
print(a[1], a[2], a[3])
table.insert(a, 10)    --在表的最后插入10
print(a[1], a[2], a[3], a[4])

local a = { 1, 2, 3, 4}
print(table.remove(a, 1)) --删除速索引为1的元素
print(a[1], a[2], a[3], a[4])

print(table.remove(a))   --删除最后一个元素
print(a[1], a[2], a[3], a[4])


local function compare(x, y) --从大到小排序
    return x > y         --如果第一个参数大于第二个就返回true，否则返回false
 end

 local a = { 1, 7, 3, 4, 25}
table.sort(a)           --默认从小到大排序
print(a[1], a[2], a[3], a[4], a[5])
table.sort(a, compare) --使用比较函数进行排序
print(a[1], a[2], a[3], a[4], a[5])


local colors = {}
  colors[1] = "red"
  colors[2] = "blue"
  colors[3] = "green" 

local otherColors = {}
  otherColors[1] = "cyan"
  otherColors[2] = "magenta"
  otherColors[3] = "yellow"
  otherColors[4] = "key"

function joinMyTables(t1, t2)

   for k,v in ipairs(t2) do
      print("k", k, "v", v)
      println()
      table.insert(t1, v)
   end 

   return t1
end
local tRes = joinMyTables(colors, otherColors)

for k,v in ipairs(tRes) do 
    print("k", k, "v", v)
end

-- 程序不向后执行
-- do return end

-- date
print(os.time())    -->output  1438243393
a = { year = 1970, month = 1, day = 1, hour = 8, min = 1 }
print(os.time(a))   -->output  60

local day1 = { year = 2015, month = 7, day = 30 }
local t1 = os.time(day1)

local day2 = { year = 2015, month = 7, day = 31 }
local t2 = os.time(day2)
print(os.difftime(t2, t1))   -->output  86400

local tab1 = os.date("*t")  --返回一个描述当前日期和时间的表
local ans1 = "{"
for k, v in pairs(tab1) do  --把tab1转换成一个字符串
    ans1 = string.format("%s %s = %s,", ans1, k, tostring(v))
end

ans1 = ans1 .. "}"
print("tab1 = ", ans1)


local tab2 = os.date("*t", 360)  --返回一个描述日期和时间数为360秒的表
local ans2 = "{"
for k, v in pairs(tab2) do      --把tab2转换成一个字符串
    ans2 = string.format("%s %s = %s,", ans2, k, tostring(v))
end

ans2 = ans2 .. "}"
print("tab2 = ", ans2)

-->output
tab1 = { hour = 17, min = 28, wday = 5, day = 30, month = 7, year = 2015, sec = 10, yday = 211, isdst = false,}
tab2 = { hour = 8, min = 6, wday = 5, day = 1, month = 1, year = 1970, sec = 0, yday = 1, isdst = false,}

print(os.date("today is %A, in %B"))
print(os.date("now is %x %X"))

print(os.time())
print(os.date("%Y-%m-%d %H:%M:%S", os.time()))

print(math.floor(3.1415))  -->output  3
print(math.ceil(7.998))    -->output  8

print(math.pi)           -->output  3.1415926535898


math.randomseed (100) --把种子设置为100
print(math.random())         -->output  0.0012512588885159
print(math.random(100))      -->output  57
print(math.random(100, 360)) -->output  150



math.randomseed (os.time())   --把100换成os.time()
print(math.random())          -->output 0.88369396038697
print(math.random(100))       -->output 66
print(math.random(100, 360))  -->output 228


-- file
file = io.input("README.md")    -- 使用 io.input() 函数打开文件

repeat
    line = io.read()            -- 逐行读取内容，文件结束时返回nil
    if nil == line then
        break
    end
    print(line)
until (false)

io.close(file)                  -- 关闭文件



-- 元表
local set1 = {10, 20, 30}   -- 集合
local set2 = {20, 40, 50}   -- 集合

-- 将用于重载__add的函数，注意第一个参数是self
local union = function (self, another)
    local set = {}
    local result = {}

    -- 利用数组来确保集合的互异性
    for i, j in pairs(self) do set[j] = true end
    for i, j in pairs(another) do set[j] = true end

    -- 加入结果集合
    for i, j in pairs(set) do table.insert(result, i) end
    return result
end
setmetatable(set1, {__add = union}) -- 重载 set1 表的 __add 元方法

local set3 = set1 + set2
for _, j in pairs(set3) do
    io.write(j.." ")               -->output：30 50 20 40 10
end


println()

local mytable = setmetatable({key1 = "value1"},   --原始表
  {__index = function(self, key)            --重载函数
    if key == "key2" then
      return "metatablevalue"
    end
  end
})

print(mytable.key1,mytable.key2)  --> output：value1 metatablevalue


println()


t = setmetatable({[1] = "hello"}, {__index = {[2] = "world"}})
print(t[1], t[2])   -->hello world

println()

arr = {1, 2, 3, 4}
arr = setmetatable(arr, {__tostring = function (self)
    local result = '{'
    local sep = ''
    for _, i in pairs(self) do
        result = result ..sep .. i
        sep = ', '
    end
    result = result .. '}'
    return result
end})
print(arr)  --> {1, 2, 3, 4}


println()

functor = {}
function func1(self, arg)
  print ("called from", arg)
end

setmetatable(functor, {__call = func1})

functor("functor")  --> called from functor
print(functor)      --> output：0x00076fc8 （后面这串数字可能不一样）



-- 面向对象

local a = account:new()
a:deposit(100)

local b = account:new()
b:deposit(50)

print(a.balance)  --> output: 100
print(b.balance)  --> output: 50

-- 继承
-- 继承可以用元表实现，它提供了在父类中查找存在的方法和变量的机制。在 Lua 中是不推荐使用继承方式完成构造的，这样做引入的问题可能比解决的问题要多

print(s_more.upper("hello"))
print(s_more.lower("HELLO"))

-- 成员私有
function newAccount (initialBalance)
    local self = {balance = initialBalance}
    local withdraw = function (v)
        self.balance = self.balance - v
    end
    local deposit = function (v)
        self.balance = self.balance + v
    end
    local getBalance = function() return self.balance end 
    return {
        withdraw = withdraw,
        deposit = deposit,
        getBalance = getBalance
    }                
end

a = newAccount(100)
a.deposit(100)
print(a.getBalance())
print(a.balance)

-- 作用域

x = 10
local i = 1         -- 程序块中的局部变量 i

while i <=x do
  local x = i * 2   -- while 循环体中的局部变量 x
  print(x)          -- output： 2, 4, 6, 8, ...
  i = i + 1
end

if i > 20 then
  local x           -- then 中的局部变量 x
  x = 20
  print(x + 2)      -- 如果i > 20 将会打印 22，此处的 x 是局部变量
else
  print(x)          -- 打印 10，这里 x 是全局变量
end

print(x)            -- 打印 10

-- 全局变量检测
-- luacheck

-- 数组大小
-- test.lua
local tblTest1 = { 1, a = 2, 3 }
print("Test1 " .. #(tblTest1))

local tblTest2 = { 1, nil }
print("Test2 " .. #(tblTest2))

local tblTest3 = { 1, nil, 2 }
print("Test3 " .. #(tblTest3))

local tblTest4 = { 1, nil, 2, nil }
print("Test4 " .. #(tblTest4))

local tblTest5 = { 1, nil, 2, nil, 3, nil }
print("Test5 " .. #(tblTest5))

local tblTest6 = { 1, nil, 2, nil, 3, nil, 4, nil }
print("Test6 " .. #(tblTest6))  

-- 非空判断
local person = {name = "Bob", sex = "M"}

person = nil

-- print(person.name) ==error

if person ~= nil and person.name ~= nil then
    print(person.name)
else
    print("person nil or person.name nil") 
end


local next = next
local a = {}
local b = {name = "Bob", sex = "Male"}
local c = {"Male", "Female"}
local d = nil

print(#a)
print(#b)
print(#c)
-- print(#d)    -- error

if a == nil then
    print("a == nil")
end

if b == nil then
    print("b == nil")
end

if c == nil then
    print("c == nil")
end

if d== nil then
    print("d == nil")
end


if next(a) == nil then
    print("next(a) == nil")
end

if next(b) == nil then
    print("next(b) == nil")
end

if next(c) == nil then
    print("next(c) == nil")
end

-- if next(d) == nil then
--     print("next(d) == nil")
-- end


local function isTableEmpty(t)
    return t == nil or next(t) == nil
end

-- 正则
local s = "hello world"
local i, j = string.find(s, "hello")
print(i, j) --> 1 5


local s = "hello world from Lua"
for w in string.gmatch(s, "%a+") do
    print(w)
end

-- output :
--    hello
--    world
--    from
--    Lua

local a = "Lua is cute"
local b = string.gsub(a, "cute", "great")
print(a) --> Lua is cute
print(b) --> Lua is great

print(string.gsub("a (enclosed (in) parentheses) line", "%b()", ""))

local name = "^aH^ai"
name = name:gsub("%^a", "")
print(name)

-- do return end

-- 虚变量
-- test.lua 文件
local t = {1, 3, 5}

print("all  data:")
for i,v in ipairs(t) do
    print(i,v)
end

print("")
print("part data:")
for _,v in ipairs(t) do
    print(v)
end


local start, finish = string.find("hello", "he") --start 值为起始下标，finish
                                                 --值为结束下标
print ( start, finish )                          --输出 1   2

local start = string.find("hello", "he")      -- start值为起始下标
print ( start )                               -- 输出 1


local _,finish = string.find("hello", "he")   --采用虚变量（即下划线），接收起
                                              --始下标值，然后丢弃，finish接收
                                              --结束下标值
print ( finish )                              --输出 2
print ( _ )                                   --输出 1, `_` 只是一个普通变量,我们习惯上不会读取它的值

-- ffi
-- https://moonbingbing.gitbooks.io/openresty-best-practices/lua/FFI.html

-- luajit
-- https://moonbingbing.gitbooks.io/openresty-best-practices/lua/what_jit.html
-- http://wiki.luajit.org/NYI

-- lua time
local ct = os.time()
print(ct)

local date = os.date("%Y-%m-%d %H:%M:%S");
print(date) 

