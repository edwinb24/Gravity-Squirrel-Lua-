module(..., package.seeall)
	
function new()

--sound check

path = system.pathForFile( "options.txt", system.DocumentsDirectory )
fh, reason = io.open( path, "r" )
 contents = fh:read( "*n" )
 if(contents ==1) then 
 
audio.setVolume(.90, {channel=1})

else 

 audio.setVolume(.0, {channel=1})
 end
 
io.close(fh)


--Function eraser

function leveleraser()
local path = system.pathForFile( "maindata.txt", system.DocumentsDirectory )
 
local fh = io.open( path, "w" )

--Each 0 represent a level, the number change to 1 if the level is 
-- unlock, and change to 2 to 4 depending on the number of archievement 
--adquire in the level
	fh:write(1,"\n",0,"\n",0,"\n",0,"\n",0)	
    print( "Game Erased" )
	io.close(fh)
	
--Erasing Level 1 --
for i=1,10 do
path = system.pathForFile( "level" .. i .. ".txt", system.DocumentsDirectory )
 
fh = io.open( path, "w" )

--Each 0 represent a level, the number change to 1 if the level is 
-- unlock, and change to 2 to 4 depending on the number of archievement 
--adquire in the level
	fh:write(1,"\n",1,"\n",1,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0)	
    print( "Game Erased" )
	io.close(fh)

end

end
--End Erased


local localGroup = display.newGroup();
local background = display.newImage("whiteback.png")

local yesbutton = display.newImage("button2.png")
local yestext= display.newText("Yes",0,0,"Script MT Bold",28)


local nobutton = display.newImage("button2.png")
local notext= display.newText("No",0,0,"Script MT Bold",28)

local text= display.newText("Are You Sure?",0,0,"Script MT Bold",30)
text:setTextColor(100,100,0)
--BG Characteristics
background.alpha = 1
background.xScale = .8
background.yScale =.4
background:setReferencePoint(display.CenterReferencePoint)
background.x = display.viewableContentWidth*.5
background.y = display.viewableContentHeight*.5

local opgroup = display.newGroup()
local yesgroup = display.newGroup()
local nogroup = display.newGroup()
local pop = audio.loadSound("media/pop.wav");

function resizeyes()
yesbutton.xScale = .45
yesbutton.yScale = .75
yestext.x = 0;
yestext.y = 0;
yesbutton.x = 0;
yesbutton.y = 0;
yesgroup: insert(yesbutton)
yesgroup: insert(yestext)
yesgroup:setReferencePoint(display.CenterReferencePoint)
end

function resizeno()
nobutton.xScale = .45
nobutton.yScale = .75
notext.x = 0;
notext.y = 0;
nobutton.x = 0;
nobutton.y = 0;
nogroup: insert(nobutton)
nogroup: insert(notext)
nogroup:setReferencePoint(display.CenterReferencePoint)
end

yestext:setTextColor(255,255,100)
notext:setTextColor(255,255,100)
yesbutton.name = true;
nobutton.name = false;

resizeno()
resizeyes()
opgroup: insert(yesgroup)
opgroup: insert(nogroup)
opgroup:setReferencePoint(display.CenterReferencePoint)



yesgroup.x = -display.viewableContentHeight*.1
nogroup.x = display.viewableContentHeight*.1

opgroup.x = display.viewableContentWidth*.5
opgroup.y = display.viewableContentHeight*.55

text.x = opgroup.x 
text.y = opgroup.y - display.viewableContentHeight*.15
function toucheff(e)

if(e.target.name) then
yesbutton = display.newImage("button1.png")
yestext:setTextColor(255,255,255)
resizeyes()
yesgroup:insert(yesbutton)
yesgroup:insert(yestext)

leveleraser()


else
nobutton = display.newImage("button1.png")
notext:setTextColor(255,255,255)
resizeno()
nogroup:insert(nobutton)
nogroup:insert(notext)

end


audio.play(pop, {channel=1})
director:closePopUp()
end

yesbutton:addEventListener("tap",toucheff)
nobutton:addEventListener("tap",toucheff)

localGroup:insert(background)
localGroup:insert(text)
localGroup:insert(opgroup)
return localGroup;
end




