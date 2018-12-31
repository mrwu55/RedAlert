
require "utilcaiji"
require "MonsterUtil"
--require "Fucked"
require "CheckFree"
local bb = require("badboy")
local isFirstComming = true
screen.init(screen.PORTRAIT)
local iscaijiLoop = true
function 出城采集()
回到主界面()
sysLog("出城采集")
出城()
sleep(2000)
for var =1,5 do
if 搜索() then
sysLog("调出搜索框成功")
if 合金(6)==false then
sysLog("采集结束")
break
end
end
sleep(5000)
end

end
function 循环采集()
while iscaijiLoop do
	出城采集()
    mSleep(50000)
end
end

function 循环打野()
sysLog("又进来了")
if getfight()==true then
sysLog("任务正在进行，取消")
return
end
sysLog("开始")
findMonster(15,false)
sysLog(getfight())

end
function restTestingFucked()
go()
sleep(500)--进入我的页面
click(55,92)
local i =0
while true  do
i= i+1
comBackOrTt()
if i>=360 then
break
end
sleep(5000)
end

end
while true do
comBackOrTt()
循环打野()
back()
sysLog("睡觉30分钟")
sleep(5000)
searchWithGrade(8,1,false,5)

restTestingFucked()

end




function initUi()
bb.loaduilib()
local rootview = RootView:create({style = ViewStyle.CUSTOME})
local page = Page:create("page")
page.text ="采集打野设置"
end



