
require "MonsterUtil"
function comBackOrTt()

sysLog("循环被攻击检测")
points = screen.findColors(Rect(12, 634, 64, 65), 
"0|0|0xffe2cb,-25|0|0xaa1413,16|0|0xa01c19",
95, screen.PRIORITY_DEFAULT)
if #points ~= 0 then --被攻击
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

end--侦查
end--红灯检测


end


function click(x,y)
local poss = Point(x,y)
touch.down(1, poss)
sleep(15)
touch.up(1, poss)
end