module(..., package.seeall);

function new()



local localGroup = display.newGroup();
local soundtrack = audio.loadStream("media/soundtrackgame.mp3");
local pop = audio.loadSound("media/pop.wav");
local background = display.newImage("backgroundgame.png")
local nut = display.newImage("images/nut.png")
local tree = display.newImage("images/tree.png")
local stick = display.newImage("images/stick.png")
local squirrel = display.newImage("images/sq1.png")
local go_btn = display.newImage("button1.png")
local gbar = {}
local rbar = {}
local bbar = {}
local physics = require("physics")
local totrbar =4
local totbbar =2
local start_text1 = display.newText("S",0,0,"Script MT Bold",48)
local start_text2 = display.newText("  tart",1,0,"Script MT Bold",48)
local i



--Checking Sound Preferences
path = system.pathForFile( "options.txt", system.DocumentsDirectory )
fh, reason = io.open( path, "r" )
 contents = fh:read( "*n" )
 if(contents ==1) then 
 
audio.setVolume(.90, {channel=1})

else 

 audio.setVolume(.0, {channel=1})end
 

local pop = audio.loadSound("media/pop.wav");

 contents = fh:read( "*n" )
 if(contents ==1) then 
 audio.play(soundtrack, {channel=5, loops=-1, fadein=5000});
else 
 audio.stop(soundtrack)
 end
 
 io.close(fh)
--end check


squirrel.xScale =.50
squirrel.yScale =.50


tree:setReferencePoint(display.TopLeftReferencePoint)
tree.xScale= .50
tree.yScale= .50
tree.x =0
tree.y =-10

stick:setReferencePoint(display.TopLeftReferencePoint)
stick.xScale= .50
stick.yScale= .50
stick.x =10
stick.y =-10

for i=0,1 do 
gbar[i] = display.newImage("gbar.png")
end

for i=0,totrbar do 
rbar[i] = display.newImage("rbar.png")
end

for i=0,totbbar do 
bbar[i] = display.newImage("bbar.png")
end

--function that change scenes
function changeScene(e)
	if(e.phase == "ended") then
	director:changeScene(e.target.scene);
	end
end


--introducing the physics
	physics.start()	
	physics.setGravity(0,9.8)

--modifying objects properties
for i=0,1 do
gbar[i].xScale = 0.1;
gbar[i].yScale = 0.5;
end
go_btn.xScale = 0.5;
go_btn.yScale = 0.8;
start_text1:setTextColor(200,255,0,200)
start_text2:setTextColor(255,255,100)



gbar[0].x= 66
gbar[0].y= 100
gbar[1].x= 90
gbar[1].y= 100

  --creating other needed groups

local start_text= display.newGroup();
local s_btn= display.newGroup();

squirrel.x = 50
squirrel.y = 440



nut.xScale = .75
nut.yScale = .75
nut.x= 69
nut.y= 61
nut.rotation = 37


rbar[0].yScale = .5
rbar[0].y = gbar[0].y
rbar[0].x = 27
rbar[0].xScale = .22

rbar[1].yScale = .5
rbar[1].y = gbar[0].y
rbar[1].x = 210
rbar[1].xScale = .9

rbar[2].yScale = .5
rbar[2].xScale = 1.1
rbar[2].y = 170
rbar[2].x = 145

rbar[3].yScale = .5
rbar[3].y = 260
rbar[3].x = 200
rbar[3].rotation = 10

rbar[4].yScale = .5
rbar[4].xScale = 1.1
rbar[4].y = 370
rbar[4].x = 145


start_text: insert(start_text1);
start_text: insert(start_text2);
start_text:setReferencePoint(display.CenterReferencePoint);

start_text.xScale = .75
start_text.yScale = .75
start_text.x = go_btn.x;
start_text.y = start_text.y - 3

s_btn: insert(go_btn)
s_btn: insert(start_text)
s_btn.x = display.contentWidth - 150
s_btn.y = s_btn.y - 5

bbar[0].x = 200
bbar[1].x =150
bbar[2].x = 200

bbar[0].y = 100
bbar[1].y =150
bbar[2].y = 200


bbar[0].xScale = .75
bbar[1].xScale = .5
bbar[2].xScale = .5

bbar[0].yScale = .75
bbar[1].yScale = .75
bbar[2].yScale = .75

bbar[0].rotation = 20
bbar[1].rotation = 160
bbar[2].rotation = 0

--Opening door
function opengates()
transition.to( gbar[0], { time=2000, delay=100, alpha=0.5, x= gbar[0].x - 20,y=gbar[0].y} )
transition.to( gbar[1], { time=2000, delay=100, alpha=0.5, x= gbar[1].x + 20,y=gbar[1].y} )
end

--Moving blue bars
function dragbar1(e,i)
if(e.phase == "began") then
display.getCurrentStage():setFocus(e.target, e.id);
elseif(e.phase == "moved")then
transition.to(bbar[0],{x=e.x, y=e.y, time=0});
elseif(e.phase ==  "ended")then
transition.to(bbar[0],{x=e.x, y=e.y, time=0});
display.getCurrentStage():setFocus(e.target, nil);

end
end

function dragbar2(e,i)
if(e.phase == "began") then
display.getCurrentStage():setFocus(e.target, e.id);
elseif(e.phase == "moved")then
transition.to(bbar[1],{x=e.x, y=e.y, time=0});
elseif(e.phase ==  "ended")then
transition.to(bbar[1],{x=e.x, y=e.y, time=0});
display.getCurrentStage():setFocus(e.target, nil);

end
end

function dragbar3(e,i)
if(e.phase == "began") then
display.getCurrentStage():setFocus(e.target, e.id);
elseif(e.phase == "moved")then
transition.to(bbar[2],{x=e.x, y=e.y, time=0});
elseif(e.phase ==  "ended")then
transition.to(bbar[2],{x=e.x, y=e.y, time=0});
display.getCurrentStage():setFocus(e.target, nil);

end
end

function dragbar4(e,i)
if(e.phase == "began") then
display.getCurrentStage():setFocus(e.target, e.id);
elseif(e.phase == "moved")then
transition.to(bbar[3],{x=e.x, y=e.y, time=0});
elseif(e.phase ==  "ended")then
transition.to(bbar[3],{x=e.x, y=e.y, time=0});
display.getCurrentStage():setFocus(e.target, nil);

end
end

function dragbar5(e,i)
if(e.phase == "began") then
display.getCurrentStage():setFocus(e.target, e.id);
elseif(e.phase == "moved")then
transition.to(bbar[4],{x=e.x, y=e.y, time=0});
elseif(e.phase ==  "ended")then
transition.to(bbar[4],{x=e.x, y=e.y, time=0});
display.getCurrentStage():setFocus(e.target, nil);

end
end

--Button Effect
function starttouch(e)

if(e.phase == "began" or e.phase == "move") then
if(e.phase == "began") then
i=i+1
end
if(i<=1) then
go_btn = display.newImage("button2.png")
start_text1:setTextColor(255,255,100)
start_text2:setTextColor(200,255,0,200)
go_btn.xScale = 0.5;
go_btn.yScale = 0.8;
s_btn: insert(go_btn)
s_btn: insert(start_text)

end
display.getCurrentStage():setFocus(e.target, e.id);
elseif(e.phase == "ended")then
if(i<=1) then
go_btn = display.newImage("button1.png")
start_text1:setTextColor(255,255,100)
start_text2:setTextColor(200,255,0,200)
s_btn: insert(go_btn)
s_btn: insert(start_text)
audio.play(pop, {channel=1});
go_btn.xScale = 0.5;
go_btn.yScale = 0.8;
go_btn.alpha = .5
nut.bodyType = "dynamic"
opengates()
display.getCurrentStage():setFocus(e.target, nil);
end
end

end


rect1Shape = {-25,-5, 25,-5, 25,5, -25,5}
rect2Shape = {-104,-5, 104,-5, 104,5, -104,5}
rect3Shape = {-130,-5, 130,-5, 130,5, -130,5}
rect4Shape = {-118,-5, 118,-5, 118,5, -118,5}
rect5Shape = {-123,-5, 123,-5, 123,5, -123,5}
rect6Shape = {-130,-5, 130,-5, 130,5, -130,5}
rect7Shape = {-34,-5, 34,-5, 34,5, -34,5}

rect8Shape = {-90,-7, 90,-7, 90,7, -90,7}
rect9Shape = {-60,-7, 60,-7, 60,7, -60,7}
rect10Shape = {-12,-5, 12,-5, 12,5, -12,5}

physics.addBody(gbar[0], "static", {bounce = 0, shape= rect10Shape, friction = 0.3})
physics.addBody(gbar[1], "static", {bounce = 0, shape= rect10Shape, friction = 0.3})

physics.addBody(rbar[0], "static", {bounce = 0, shape= rect1Shape, friction = 0.3})
physics.addBody(rbar[1], "static", {bounce = 0, shape= rect2Shape, friction = 0.3})
physics.addBody(rbar[2], "static", {bounce = 0, shape= rect4Shape, friction = 0.3})
physics.addBody(rbar[3], "static", {bounce = 0, shape= rect5Shape, friction = 0.3})
physics.addBody(rbar[4], "static", {bounce = 0, shape= rect7Shape, friction = 0.3})

physics.addBody(bbar[0], "static", {bounce = 0, shape= rect8Shape, friction = 0.3})
physics.addBody(bbar[1], "static", {bounce = 0, shape= rect9Shape, friction = 0.3})
physics.addBody(bbar[2], "static", {bounce = 0, shape= rect9Shape, friction = 0.3})

local physics_body = {};
physics_body["squirrel"] = {
		{shape = {-20,-25,-51,-25,-40,30,-15,30}},
		{shape = {-20,30,30,30,30,22,-20,22}},
		{shape = {46,10,48,10,35,25,38,30}}
		}
		
physics.addBody(squirrel, "static",unpack(physics_body["squirrel"]))		

physics.addBody(nut, "static", {radius = 15, friction = 0.3, bounce =.35})
--physics.setDrawMode("hybrid")

i=0
s_btn:addEventListener("touch",starttouch, i)


bbar[0]:addEventListener("touch",dragbar1)
bbar[1]:addEventListener("touch",dragbar2)
bbar[2]:addEventListener("touch",dragbar3)

localGroup: insert(background);

localGroup: insert(s_btn);

for i=0,1 do 
localGroup: insert(gbar[i])
end

for i=0,totrbar do 
localGroup: insert(rbar[i])
end
for i=0,totbbar do 
localGroup: insert(bbar[i])
end
localGroup: insert(squirrel);
localGroup: insert(nut);
localGroup: insert(stick);
localGroup: insert(tree);
return localGroup
end