
local isFight = false
local canClick = true
--搜索野怪||叛军 isMonster = true 野怪 false 叛军
function findMonster(a,isMonster)
isFight = true
startMonster = isMonster
while isFight do

hospital()
sleep(2000)
go()
sleep(1000)
sysLog("搜索")
sleep(1000)
points = screen.findColors(Rect(619, 1029, 71, 74), 
"0|0|0xe3eefd,-14|-23|0xffffff,-2|-31|0x1e241e,-5|15|0x1e211d",
95, screen.PRIORITY_DEFAULT)
if #points ~= 0 then 
sysLog("找到搜索按钮")
点击事件(657,1071)--点击搜索按钮
--检测是否有叛军
local noPanjun =  tesTingMonster()
sleep(500)
if isMonster then
--选择野怪
点击事件(53,984)
else
if noPanjun  then
--选择叛军
点击事件(293,990)
else
--选择野怪
点击事件(53,984)
end

end
sleep(500)
点击事件(260,1191)--点击进度条
-- 按等级搜索
for var =1,a do
sleep(500)
点击事件(467,1193)--点击+
end
--查找
sleep(500)
点击事件(599,1191)--点击查找按钮
sleep(1000)
点击事件(369,586)--点击屏幕中央
sleep(2000)
points = screen.findColors(Rect(250, 908, 219, 94), 
"0|0|0xbf7f31,-80|0|0xbb7f31,72|0|0xbd7f31,-55|-49|0x2edbf4",
95, screen.PRIORITY_DEFAULT)

if #points~=0 then--找到野怪
sysLog("找到野怪")
sleep(1000)
点击事件(257,970)
sleep(2000)
points = screen.findColors(Rect(240, 1173, 254, 65), 
"0|0|0x158068,85|-7|0x1d5ea0,206|-6|0x225b9d",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then --找到出征界面
sysLog("显示出征界面")
sleep(500)--默认选择第一队列
点击事件(389,156)
sleep(1000)--调出选择框
点击事件(362,1213)
sleep(1000)--选择最高等级兵种
点击事件(369,881)
sleep(1000)--出征
点击事件(543,1208)
sleep(4000)--出征检测
points = screen.findColors(Rect(240, 1173, 254, 65), 
"0|0|0x158068,85|-7|0x1d5ea0,206|-6|0x225b9d",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then --出征失败
sysLog("出征失败")
return false
end

else
sysLog("未显示出征界面")
isFight = false
return false
end
else --未找到野怪
if startMonster==isMonster then 
isMonster  = not isMonster
sysLog("未找到野怪,切换野怪类型")
else
sysLog("未找到野怪，结束")
isFight = false
return false
end

end

end --搜索按钮
hospital()
testingFucked()
end --while
 return true
end

function testingFucked()
go()
sleep(500)--进入我的页面
click(55,92)
sysLog("休息三分钟")
local i=0
while true do
i =i+1
comBackOrTt()
if i>=36 then
break
end
sleep(5000)
end

end

function hospital()
back()
sleep(1000)--调出快速任务栏
点击事件(694,573)
sleep(1000)--调出快速医疗
点击事件(645,304)

sysLog("点击医院")
sleep(500)--点击医院
点击事件(611,449)
sleep(1000)
points = screen.findColors(Rect(235, 1171, 261, 72), 
"0|0|0xb3692f,67|0|0x1f61a3,142|-3|0x1d5fa1,205|-3|0x1e60a2,171|2|0x1c1619,40|1|0x1c191d",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then--找到治疗界面
sysLog("找到治疗界面")
sleep(1000)--点击治疗
点击事件(548,1204)
sleep(1000)--请求帮助
点击事件(354,452)
else--关闭快速任务栏
sysLog("医院无任务")
点击事件(68,85)
end--治疗界面
end

function 点击事件(x,y)
if canClick == false then

return
end
local poss = Point(x,y)
touch.down(1, poss)
sleep(15)
touch.up(1, poss)
end
function setCanclick(flg)
canClick = flg
end

function getfight()
return isFight
end

--回城
function  back()
isNotHome = true

while isNotHome do
 point = screen.findColors(Rect(245, 133, 55, 63), 
"0|0|0xfaeac6,21|8|0x6c4521,5|40|0xe7b742,-10|31|0x9b6326",
95, screen.PRIORITY_DEFAULT)
if #point ~= 0 then --在城外 回城
sysLog("在城外")


points = screen.findColors(Rect(614, 1030, 75, 66), 
"0|0|0xecf3fe,27|0|0xecf3fe,19|21|0x1e221e,38|0|0x16191c",
95, screen.PRIORITY_DEFAULT)
sleep(1000)
if #points==0 then  --找不到搜索按钮
sysLog("关闭搜索框")
点击事件(338,745)
end
sleep(1000)
sysLog("回城")
点击事件(67,1233)
isNotHome = false
return true
end
sysLog("检测循环")
points = screen.findColors(Rect(273, 50, 331, 55), 
"0|0|0x1b1918,74|5|0x437fbd,249|8|0xbf7634",
95, screen.PRIORITY_LEFT_FIRST+screen.PRIORITY_DOWN_FIRST+screen.PRIORITY_HORIZONTAL_FIRST)
if #points~=0 then --是否在主界面
sysLog("在城内，结束")

isNotHome = false
return  false
end
sleep(2000)
sysLog("不在主界面，返回上一级")
点击事件(55,92)
sleep(2000)
end

end

--出城
function go()
isNotHome = true

while isNotHome do
 point = screen.findColors(Rect(245, 133, 55, 63), 
"0|0|0xfaeac6,21|8|0x6c4521,5|40|0xe7b742,-10|31|0x9b6326",
95, screen.PRIORITY_DEFAULT)
if #point ~= 0 then --在城外 
sysLog("在城外")
points = screen.findColors(Rect(614, 1030, 75, 66), 
"0|0|0xecf3fe,27|0|0xecf3fe,19|21|0x1e221e,38|0|0x16191c",
95, screen.PRIORITY_DEFAULT)
sleep(1000)
if #points==0 then  --找不到搜索按钮
sysLog("关闭搜索框")
点击事件(338,745)
end
sysLog("结束")
--点击事件(67,1233)
isNotHome = false
return true
end
sysLog("检测循环")
points = screen.findColors(Rect(273, 50, 331, 55), 
"0|0|0x1b1918,74|5|0x437fbd,249|8|0xbf7634",
95, screen.PRIORITY_LEFT_FIRST+screen.PRIORITY_DOWN_FIRST+screen.PRIORITY_HORIZONTAL_FIRST)
if #points~=0 then --是否在主界面
sysLog("在主界面,出城，结束")
sleep(1000)--出城
点击事件(64,1231)

isNotHome = false
return  false
end
sleep(2000)
sysLog("不在主界面，返回上一级")
点击事件(55,92)
sleep(2000)
end
end
--查找野怪
function monster(a)
sleep(2000)--搜索按钮
点击事件(61,982)
sleep(500)--选择叛军
点击事件(260,1191)
-- 按等级搜索
for var =1,a do
sleep(500)
点击事件(467,1193)
end
--查找
sleep(2000)
点击事件(599,1191)
sleep(3000)
点击事件(369,586)
sleep(2000)
points = screen.findColors(Rect(250, 908, 219, 94), 
"0|0|0xbf7f31,-80|0|0xbb7f31,72|0|0xbd7f31,-55|-49|0x2edbf4",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then--找到野怪
sysLog("找到野怪")
sleep(1000)--点击攻击
点击事件(257,970)
sleep(3000)
else


end --找到野怪
end

function find(flag)
sleep(500)
if flag  then
--选择叛军
点击事件(260,1191)
else
--选择野怪
点击事件(53,984)
end

end


function tesTingMonster()
sleep(1000)
points = screen.findColors(Rect(600, 932, 95, 98), 
"0|0|0xd1e2d1,-15|20|0x2eeb5f,40|46|0x16b256,29|16|0x58a37d",
95, screen.PRIORITY_DEFAULT)

if #points==0 then--有叛军
sysLog("有叛军")
return true
end
sysLog("没有叛军")
return false
end


function comBackOrTt()
sleep(500)

points = screen.findColors(Rect(181, 628, 391, 118), 
"0|0|0x282828,77|7|0x282828,207|1|0x282828,293|2|0x282828,40|-60|0x282828,250|-58|0x282828,143|2|0xf3f3f3",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then--叉叉助手停止运行报错
click(358,700)--点击确定
end

sysLog("循环被攻击检测")
points = screen.findColors(Rect(12, 634, 64, 65), 
"0|0|0xffe2cb,-25|0|0xaa1413,16|0|0xa01c19",
95, screen.PRIORITY_DEFAULT)
if #points ~= 0 then --被攻击
sysLog("被攻击或者被侦查")
setCanclick(false)
click(43,667)--点击红灯
sleep(2000)
points = screen.findColors(Rect(545, 316, 164, 66), 
"0|0|0x3b66a1,45|0|0x3c69a5,92|0|0x3c67a2",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then --查看界面
sleep(500)
click(625,347)--点击查看
sleep(1000)
points = screen.findColors(Rect(256, 811, 210, 53), 
"0|0|0x3c659c,57|0|0x3c659e,110|1|0x3c67a0",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then--侦查
sysLog("被侦查")
click(355,835)
sleep(1000)
click(55,92)
else
sleep(1000)
click(186,458)--点击被攻击坐标
sleep(1000)
click(369,586)--点击屏幕中央
sleep(2000)
points = screen.findColors(Rect(313, 395, 90, 77), 
"0|0|0x0f0808,-27|27|0x170f0f,29|29|0x22110c,-5|36|0xdab66a",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then--基地攻击检测
sysLog("基地被攻击")
sleep(500)
click(530,592)--点击基地增益
sleep(1000)
sysLog("点击罩子")
click(455,229)--点击罩子
sleep(1000)
points = screen.findColors(Rect(507, 371, 148, 52), 
"0|0|0x34568b,48|3|0x3a629c,97|3|0x3a619b",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then--有罩子
sleep(500)
sysLog("开罩了")
click(576,398)--点击开罩
sleep(2000)

points = screen.findColors(Rect(90, 810, 213, 58), 
"0|0|0x167069,72|-1|0x166e6a,135|-1|0x166d67",
95, screen.PRIORITY_DEFAULT)
if #points~=0 then--已经使用了罩子
sleep(500)
click(196,833)--点击取消

end--已经使用了罩子

end--有罩子
sleep(500)
click(55,92)--返回
setCanclick(true)

else--资源被攻击
sysLog("资源点被攻击")
sleep(1000)
click(526,590)--召回
setCanclick(true)
end--基地攻击检测


end--查看界面检测

else--不是被攻击
sleep(1000)
sysLog("不是被攻击")
click(55,92)

end--点击红灯后界面检测


end--红灯检测


end


function click(x,y)
local poss = Point(x,y)
touch.down(1, poss)
sleep(15)
touch.up(1, poss)
end
