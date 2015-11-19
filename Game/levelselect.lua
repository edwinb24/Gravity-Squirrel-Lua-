module(..., package.seeall)
	
function new()

 --Checking Sound Preferences
path = system.pathForFile( "options.txt", system.DocumentsDirectory )
fh, reason = io.open( path, "r" )
 contents = fh:read( "*n" )
 if(contents ==1) then 
 
audio.setVolume(.90, {channel=1})

else 

 audio.setVolume(.0, {channel=1})end
 

local pop = audio.loadSound("media/pop.wav");

 io.close(fh)
--end check

local localGroup = display.newGroup();
local background = display.newImage("images/BG3.jpg")


--BG Settings
background.xScale = .5
background.yScale = .5
background:setReferencePoint(display.CenterReferencePoint)
background.x = display.viewableContentWidth*.5
background.y = display.viewableContentHeight*.5
--

local backbutton = display.newImage("button1.png")
local backarrow = display.newImage("backarrow.png")
local backgroup = display.newGroup()
local icon = display.newImage("images/icon3.png")

local text = display.newText("Hungry Squishy!",0,0,"Script MT Bold",30)
text:setTextColor(200,255,0)

text:setReferencePoint(display.CenteReferencePoint);
text.x = display.viewableContentWidth*.5
text.y = display.viewableContentHeight*.25

function resize2()
icon.xScale = .45
icon.yScale = .45
icon:setReferencePoint(display.CenteReferencePoint);
icon.x = display.viewableContentWidth*.5;
icon.y = display.viewableContentHeight*.5;
end

resize2()

backgroup:insert(backbutton)
backgroup:insert(backarrow)

function resize()

backarrow.xScale = .35
backarrow.yScale = .25
backbutton.xScale = .25
backbutton.yScale = .60
backarrow.x = 0;
backarrow.y = 0;
backbutton.x = 0;
backbutton.y = 0;
backarrow:setReferencePoint(display.CenteReferencePoint);
backbutton:setReferencePoint(display.CenterReferencePoint);
backgroup.x = display.contentWidth*.2
backgroup.y = display.contentHeight*.05
end

function toucheff3(e)
backbutton = display.newImage("button2.png")
backgroup:insert(backbutton)
backgroup:insert(backarrow)
resize();
audio.play(pop, {channel=1});
director:changeScene("menu","fade")
end


function toucheff4(e)
icon = display.newImage("images/icon2.png")
resize2();
audio.play(pop, {channel=1});
director:changeScene("lobby1","fade")
end


resize();

backgroup:addEventListener("tap",toucheff3)
icon:addEventListener("tap",toucheff4)
local background2 = display.newImage("background2.png")

localGroup:insert(background);
localGroup: insert(backgroup);
localGroup:insert(icon);
localGroup:insert(text);
localGroup:insert(background2);

return localGroup;
end