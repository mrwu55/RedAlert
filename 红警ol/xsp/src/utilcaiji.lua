require "MonsterUtil"
require "CheckFree"

local numSearch = 1
function 出城()
numSearch = 1
sleep(2000)
point = screen.findColors(Rect(245, 133, 55, 63), 
"0|0|0xfaeac6,21|8|0x6c4521,5|40|0xe7b742,-10|31|0x9b6326",
95, screen.PRIORITY_DEFAULT)
if #point == 0 then  --如果找到符合条件的点
-- 出城坐标（67,1233）
点击事件(67,1233)
	return true
end

return false
end

function 采集判断()
points = screen.findColors(Rect(167, 121, 519, 52), 
"0|0|0xfebaab,-20|3|0x480c0c,-127|1|0xbeb289,-469|2|0xaa9169",
95, screen.PRIORITY_DEFAULT)

end

function 搜索()
sleep(2000)
sysLog("搜索")
points = screen.findColors(Rect(619, 1029, 71, 74), 
"0|0|0xe3eefd,-14|-23|0xffffff,-2|-31|0x1e241e,-5|15|0x1e211d",
95, screen.PRIORITY_DEFAULT)
if #points ~= 0 then 
sysLog("找到搜索按钮")
点击事件(657,1071)
sleep(2000)
--拖动到末尾
local pos = Point(364,968)
touch.down(1, pos)
for i = 1, 10 do
    sleep(15)
    -- 模拟手指每次移动递增(3, 2)像素
    pos = pos + Point(-30 * i, 0)
    touch.move(1, pos)
end
sleep(15)
-- 模拟抬起手指
touch.up(1, pos)
return true
end
return false
end

function 合金(a)
sleep(1000)
points = screen.findColors(Rect(277, 932, 306, 89), 
"0|0|0x612d1c,114|13|0x167234,-118|13|0xc39b27,-2|-21|0xd6d5c6",
95, screen.PRIORITY_DEFAULT)
if #points ~= 0 then 
sysLog("选中合金成功")
点击事件(425,974)
按等级搜索(a)
return 点击查找() 
else
sysLog("选中合金失败")
return false
end

end
function 叛军(a)
点击事件(70,985)
按等级搜索(a)
end

function 按等级搜索(a)
sleep(1000)
--先将等级降为1级
点击事件(146,1190)
sleep(1000)
for var = 1,3 do
sysLog("点击次数")
点击事件(68,1190)
sleep(500)
end
sleep(1000)
for var =1,a-1 do
点击事件(469,1194)
sleep(500)
end
end

function 点击查找()
getPointFail = true
while getPointFail do
sysLog("查找循环"..numSearch)
--点击查找
for var = 1,numSearch do
点击事件(599,1192)
sleep(3000)

end

--采集按钮坐标查找
points = screen.findColors(Rect(491, 540, 80, 85), 
"0|0|0xdec37d,2|13|0x322017,18|21|0x361d15,-31|-11|0x120a0a",
95, screen.PRIORITY_DEFAULT)
if #points ~= 0 then 
getPointFail = false
--采集
sleep(1000)

点击事件(535,583)

return 采集出征()
else
--降一级查找
点击事件(68,1190)
end
sleep(2000)

end
return true
end

function 采集出征()
sleep(1000)
points = screen.findColors(Rect(437, 1166, 220, 79), 
"0|0|0x215b9d,-69|-1|0x205a9c,75|4|0x1d5fa1",
95, screen.PRIORITY_DEFAULT)
sysLog("找出征")

if #points ~= 0 then
sleep(2000)
sysLog("点击出征")
点击事件(543,1203)
sleep(2000)
--检测出兵
return 出兵()
else --找不到出征按钮
sysLog("找不到出征按钮")
sleep(2000)
points = screen.findColors(Rect(102, 675, 519, 71), 
"0|0|0x166962,465|0|0x3d689f,156|2|0x166f68,315|2|0x3e6da6",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then
sysLog("找到取消按钮")
--点击取消
sleep(2000)
点击事件(207,707)

else--队列已满
sysLog("队列已满")
numSearch = 1
sleep(2000)
点击事件(74,106)
return false
end
end

return true

end

function 出兵()
--检测是否没兵
points = screen.findColors(Rect(234, 1170, 410, 73), 
"0|0|0xffffff,29|-3|0x1f589a,-106|-1|0x11745b",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then
点击事件(57,85)
return false
end
points = screen.findColors(Rect(102, 675, 519, 71), 
"0|0|0x166962,465|0|0x3d689f,156|2|0x166f68,315|2|0x3e6da6",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then--检测是否有其他人采集此资源
--点击取消
sleep(2000)
点击事件(207,707)
--点击返回
sleep(2000)
点击事件(55,92)
numSearch = numSearch+1
end

return true
end

function 点击事件(x,y)
local poss = Point(x,y)
touch.down(1, poss)
sleep(15)
touch.up(1, poss)
end

function 回到主界面()
 isNotHome = true

while isNotHome do
 point = screen.findColors(Rect(245, 133, 55, 63), 
"0|0|0xfaeac6,21|8|0x6c4521,5|40|0xe7b742,-10|31|0x9b6326",
95, screen.PRIORITY_DEFAULT)
if #point ~= 0 then --在城外 回城
sysLog("在城外，回城，结束")
点击事件(67,1233)
isNotHome = false
break
end
sysLog("检测循环")
points = screen.findColors(Rect(273, 50, 331, 55), 
"0|0|0x1b1918,74|5|0x437fbd,249|8|0xbf7634",
95, screen.PRIORITY_LEFT_FIRST+screen.PRIORITY_DOWN_FIRST+screen.PRIORITY_HORIZONTAL_FIRST)
if #points~=0 then --是否在主界面
sysLog("在主界面")
isNotHome = false
return
end
sleep(2000)
sysLog("不在主界面，返回上一级")
点击事件(55,92)
sleep(2000)
end
 
end


--重写采集
-- a 采集等级
-- b 采集类型 1矿石 2石油 3 合金
-- isUnion 是否采集联盟矿
-- c 采集总队列
function searchWithGrade(a,b,isUnion,c)

while true do 

--空闲队列检测
local freeNum = freeTest(c)
sysLog("空闲队列:"..freeNum)
if freeNum==0 then--没有空闲队列
sysLog("没有空闲队列,结束")
break
end
points = screen.findColors(Rect(619, 1029, 71, 74), 
"0|0|0xe3eefd,-14|-23|0xffffff,-2|-31|0x1e241e,-5|15|0x1e211d",
95, screen.PRIORITY_DEFAULT)
if #points == 0 then --找搜索按钮
go()
end --找搜索按钮
点击事件(657,1071)--点击搜索按钮

local noXitu = tesTingMonster()
sleep(1000)
if b==1 then--矿石
if noXitu then
点击事件(408,984)
else
点击事件(293,987)
end
elseif b==2 then --石油
if noXitu then
点击事件(530,980)
else
点击事件(407,984)
end

else--合金
if noXitu then
点击事件(650,982)
else
点击事件(529,978)
end

end
chooseGrade(a)
sleep(1000)
点击查找()
end
end

function chooseGrade(a)
sleep(1000)
--先将等级降为1级
点击事件(146,1190)
sleep(1000)
for var = 1,3 do
sysLog("点击次数")
点击事件(68,1190)
sleep(500)
end
sleep(1000)
for var =1,a-1 do
点击事件(469,1194)
sleep(500)
end
end

