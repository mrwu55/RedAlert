require("MonsterUtil")
function freeTest(a)
go()
sleep(1000)
points = screen.findColors(Rect(192, 1087, 115, 53), 
"0|0|0x141211,0|37|0x141211,22|14|0x3c6cac,85|12|0x3c67a2",
95, screen.PRIORITY_DEFAULT)
if #points==0 then --检测队列是收缩状态
sysLog("队列为收缩状态")
sleep(2000)
sysLog("点击展开")
click(286,1119)--点击箭头
sleep(1000)
return freeTestLoop(a)--空闲队列

else--不是收缩状态
sysLog("队列不是收缩状态")
sleep(1000)
return freeTestLoop(a)--空闲队列
end--检测队列

end
function freeTestLoop(a)
--local possA = Point(262,1111)
--local possB = Point(261,1053)
--local possC = Point(259,990)
--local possD = Point(260,934)
--local possE = Point(260,871)
----队列一到五任务中坐标点
--local table ={Point(262,1111),Point(261,1053),
--Point(259,990),Point(260,934),Point(260,871)}

pointsA = screen.findColors(Rect(220, 1093, 86, 42), 
"0|0|0x3b69a8,33|2|0x4175b4,64|1|0x3d6dab",
95, screen.PRIORITY_DEFAULT)

pointsB = screen.findColors(Rect(218, 1033, 87, 40), 
"0|0|0x3b6baa,32|-2|0x3d67a1,66|-2|0x3b67a1",
95, screen.PRIORITY_DEFAULT)

pointsC = screen.findColors(Rect(222, 970, 83, 42), 
"0|0|0x38619d,33|3|0x3e6fab,68|0|0x3a639b",
95, screen.PRIORITY_DEFAULT)

pointsD = screen.findColors(Rect(223, 913, 81, 36), 
"0|0|0x39639f,32|2|0x3e6eaa,68|1|0x3c68a4",
95, screen.PRIORITY_DEFAULT)

pointsE = screen.findColors(Rect(219, 851, 85, 38), 
"0|0|0x3966a6,33|0|0x3e6da8,69|0|0x3c6aa8",
95, screen.PRIORITY_DEFAULT)

if #pointsA==0 then--所有队列空闲
return a
else--至少一个队列任务中
if #pointsB==0 then --B队列检测

return a-1
else
if #pointsC==0 then --C队列检测
return a-2
else
if #pointsD==0 then --D队列检测
return a-3
else
if #pointsE==0 then --E队列检测
return 1
else
return 0
end--E队列检测
end--D队列检测


end--C队列检测
end--B队列检测

end--所有队列空闲


return 0

end

