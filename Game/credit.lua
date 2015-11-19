module(..., package.seeall)

function new()


path = system.pathForFile( "options.txt", system.DocumentsDirectory )
fh, reason = io.open( path, "r" )
 contents = fh:read( "*n" )
 if(contents ==1) then 
 
audio.setVolume(.90, {channel=1})

else 

 audio.setVolume(.0, {channel=1})
 end
 
io.close(fh)




local localGroup = display.newGroup();

local pop = audio.loadSound("media/pop.wav");

display.setStatusBar( display.HiddenStatusBar )
local background = display.newImage("background.png")

--Displaying Name of the game--
local text = display.newText("C",display.viewableContentWidth*.2 + 20,display.viewableContentHeight*.2,"Script MT Bold",48)
text:setTextColor(200,255,0,200)
local text2 = display.newText("   redits",display.viewableContentWidth*.2 +10,display.viewableContentHeight*.2,"Script MT Bold",48)
text2:setTextColor(255,255,100)
local icon = display.newImage("images/icon3.png")
local backgroup = display.newGroup()
local backbutton = display.newImage("button1.png")
local backarrow = display.newImage("backarrow.png")
backgroup:insert(backbutton)
backgroup:insert(backarrow)

icon.xScale = .45
icon.yScale = .45
icon:setReferencePoint(display.CenteReferencePoint);
icon.x = display.viewableContentWidth*.5;
icon.y = display.viewableContentHeight*.5;


local text3 = display.newText("Design by Kaho Mukae",display.viewableContentWidth*.2,display.viewableContentHeight*.7,"Script MT Bold",22)
text3:setTextColor(255,255,100)
local text4 = display.newText("Programmed by Edwin Broce",display.viewableContentWidth*.2 - 25,display.viewableContentHeight*.8,"Script MT Bold",22)
text4:setTextColor(255,255,100)

--Functions
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
director:changeScene("options","fade")
end


resize();
backgroup:addEventListener("tap",toucheff3)
local background2 = display.newImage("background2.png")

localGroup: insert(background);
localGroup: insert(backgroup)
localGroup:insert(text)
localGroup:insert(text2)
localGroup:insert(text3)
localGroup:insert(text4)
localGroup:insert(icon)
localGroup:insert(background2)


return localGroup;
end