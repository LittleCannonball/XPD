--单行注释
--print("11223")
--[[多行
注释]]--

print("-------变量--------")
--nil number  string  boolean
--Lua中所有的变量都不需要声明变量类型

--通过type函数我们可以等到变量类型
a = nil
print(a)
print(type(a))
--number 所有的数值都是number
a = 1
a = 1.2
print(type(a))

--字符串双引号单引号都行
a = "string"
a = 'string'
print(type(a))

a = true
a = false
print(type(a))


print("--------字符串的操作-------")
str = "双引号字符串"
str2 = '单引号字符串'
--获取字符串的长度
s = "1234545778"
print(#s)--汉字占3个长度
--字符串多行打印
print("123\n123")
s = [[哈
哈
哈
]]
print(s)
--字符串拼接
print("123".."123")
s1 = "123123"
s2 = "111"
print(s1..s2)
print(string.format("哈%d" ,12))
--其他类型转字符串
a = true
print(tostring(a))

--字符串当中的提供的公共方法
str = "adAdDDFad"
print(string.upper(str))--小写转大写的方法，调用该方法并不会改变原字符串
print(string.lower(str))--大写转小写的方法
print(string.reverse(str))--反转字符串
print(string.find(ADD))--查找字符所在字符串的索引
print(string.sub(str ,3 ,4))--截取字符串,获取索引3到4的字符串，如果只输入3的化会将后面的参数都显示出来
print(string.rep(str ,2))--重复字符串，将一个字符串连续拼接N次
print(string.gsub(str , "ADD" ,"***"))--字符串修改，将指定的字符修改成指定的
print(string.byte("Lua" ,1))--将字符串转换成ASCII码，根据索引修改
print(string.char(78))--将ASCII码转换成字符

print("-----算数运算符------")
-- + - * /
--没有自增自减运算符
--没有复合运算符
print("123.4" + 1)--字符串里面如果是字符，只要能够转成功就能够当作字符串来计算
print("幂运算" .. 2 ^ 2)--次方

print("-----条件运算符------")
-- > < >= <= ~=    ~=不等于的意思

print("-----逻辑运算符------")
-- and 对应C#的&&
-- or  对应C#的||
-- not 对应C#的！
-- 在Lua中也支持逻辑运算的“短路”规则

print("-----位运算符------")
-- 不支持位运算符

print("-----三目运算符------")
-- 在Lua中也支持


print("-----------条件分支语句------------")
a = 9
-- 单条分支语句
if a > 5 then
    print("满足了这个条件")
end

-- 双分支语句
if a > 5 then
    print("满足了这个条件")
else
    print("没有满足这个条件")
end

-- 多分支
if a > 5 then       -- 如果后面要跟条件后面一定要加then
    print("小于了5")
elseif a == 5 then  --在Lua中如果elseif加上了空格会报错
    print("等于了5")
else
    print("都不满足")
end
-- 在Lua中没有switch语法
if a >=3 and a <= 9 then
    print("随便写一下")
end



print("-----------while循环-------------")
num = 0
while num < 5 do
    num = num + 1
end

print("-----------do while循环-------------")
num = 0
repeat
    num = num + 1
until num > 5 --这刚好与C#相反，C#满足条件进入， Lua满足条件退出

print("-----------for循环-------------")
for i = 1 , 5 do --i 会默认的自增
    print(i)
end

for i = 1, 5 , 2 do --第三个变量就是自定义增量，直接逗号后面写
    print(i)
end

for i = 5, 1 , -1 do --第三个变量就是自定义增量，递减
    print(i)
end

print("------------函数---------------")
--function 函数名()  
--end

--a = function ()
--end

print("------------无参无返回值函数---------------")

function F1()
    print("F1函数")
end
F1() -- 调用函数，在函数声名之前是不能去调用它的，所以只能在后面进行调用

F2 = function ()
    print("F2函数")
end
F2()

print("------------有参无返回值函数---------------")

function F3(a)--并不需要声名参数类型
    print(a)
end
F3(1)
F3(true)
F3(1,2,3,4)--如果你传入的参数个数不匹配，不会报错，只会补空或丢弃

print("------------无参有返回值函数---------------")

function F4(a)
    return a , "可以返回很多参数" ,"多余的返回值没有变量接收会被丢弃掉"
end
temp1 , temp2 , temp3 = F4(3)--多返回值时可以在前面声名多个变量来接收即可，自动匹配对应位置
print(temp1)
print(temp2)
print(temp3)

print("------------函数的类型---------------")
F5 = function ()
    print("123")
end
print(type(F5))--函数的类型就是function

print("------------函数的重载---------------")

--Lua中函数不支持重载，函数重名默认调用最后一个函数

print("------------变长参数---------------")

function F7(...)
    --变长参数的使用，用一个表存起来 再用
    arg = {...}
    for i = 1, #arg do  --#arg变长参数的长度
        print(arg[i])
    end
end
F7(1,1,"123",3,4,5,true,7,8)

print("------------函数嵌套---------------")
function F8()
    return function ()
        print("123")
    end
end
f9 = F8()
f9()


--闭包
function F9(x)
    --改变传入参数的生命周期
    return function(y)
        return x + y --将外界传入的变量放置到了返回的函数当中
    end
end
f10 = F9(10)
print(f10(5))--输出结果为15


--表   table
--数据结构 userdata
--协同程序 table(线程)
