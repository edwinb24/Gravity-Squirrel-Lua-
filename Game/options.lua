module(..., package.seeall)
	
function new()

local temp
local temp2
local localGroup = display.newGroup();
local pop = audio.loadSound("media/pop.wav");
local soundtrack = audio.loadStream("media/soundtrack.mp3");
display.setStatusBar( display.HiddenStatusBar )
local background = display.newImage("background.png")

--Using Director Class--

--Displaying Name of the game--
local text = display.newText("O",display.contentWidth*.2 + 20,display.contentHeight*.2,"Oleo Script",48)
text:setTextColor(200,255,0,200)
local text2 = display.newText("   ptions",display.contentWidth*.2 +10,display.contentHeight*.2,"Oleo Script",48)
text2:setTextColor(255,255,100)


--inserting Buttons
local groupb = display.newGroup()

local backbutton = display.newImage("button1.png")
local backarrow = display.newImage("backarrow.png")


local creditsbutton = display.newImage("button1.png")

local resetbutton = display.newImage("button1.png")

local musicbutton = display.newImage("button1.png")
local musicnote = display.newImage("note.png")

local fxbutton = display.newImage("button1.png")
local fxtext= display.newText("FX",0,0,"Script MT Bold",30)

local creditstext= display.newText("Credits",0,0,"Script MT Bold",36)

local resettext= display.newText("Reset",0,0,"Script MT Bold",36)

local backgroup = display.newGroup()

local creditsgroup = display.newGroup()

local resetgroup = display.newGroup()

local musicgroup = display.newGroup()

local fxgroup = display.newGroup()



--Checking sound preferences
path = system.pathForFile("options.txt", system.DocumentsDirectory )
fh, reason = io.open( path, "r" )
contents = fh:read( "*n" )
 if(contents ==1) then 
 fxtext.alpha = 1
audio.setVolume(.90, {channel=1})

else 
fxtext.alpha = .4
 audio.setVolume(.0, {channel=1})
 end
 
 contents = fh:read( "*n" )
 if(contents ==1) then 
 musicnote.alpha = 1
else 
musicnote.alpha = .4
 audio.setVolume(.0, {channel=1})
 end
 
io.close(fh)
--End Checking

--Naming the FX and Music Buttons
fxgroup.name = "fx"
musicgroup.name = "music"

musicgroup:insert(musicbutton)
musicgroup:insert(musicnote)
fxgroup:insert(fxbutton)
fxgroup:insert(fxtext)
backgroup:insert(backbutton)
backgroup:insert(backarrow)
creditsgroup:insert(creditsbutton)
resetgroup:insert(resetbutton)
resetgroup:insert(resettext)
creditsgroup:insert(creditstext)
groupb:insert(creditsgroup)
groupb:insert(resetgroup)

backgroup.x = display.contentWidth*.2
backgroup.y = display.contentHeight*.05
fxgroup.x = display.viewableContentWidth*.38
fxgroup.y = display.viewableContentHeight*.40
fxbutton:setReferencePoint(CenterReferencePoint)
fxbutton:setReferencePoint(CenterReferencePoint)
musicbutton:setReferencePoint(CenterReferencePoint)
musicbutton:setReferencePoint(CenterReferencePoint)
musicgroup.x = display.viewableContentWidth*.58
musicgroup.y = display.viewableContentHeight*.40
fxtext:setReferencePoint(CenterReferencePoint)
fxtext:setReferencePoint(CenterReferencePoint)
fxtext.x = 2
fxtext.y =-2

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

end

function resize2()

musicnote.xScale = .35
musicnote.yScale = .25
musicbutton.xScale = .25
musicbutton.yScale = .60
musicnote.x = 0;
musicnote.y = 0;
musicbutton.x = 0;
musicbutton.y = 0;
musicnote:setReferencePoint(display.CenteReferencePoint);
musicbutton:setReferencePoint(display.CenterReferencePoint);
end

function resize3(name)
if(name == "fx") then
fxbutton.xScale = .25
fxbutton.yScale = .75
fxbutton.x = 0
fxbutton.y = 0
fxgroup.xScale = 1.20
fxgroup.yScale = 1.20

else
musicnote.xScale = .60
musicnote.yScale = .55
musicbutton.xScale = .25
musicbutton.yScale = .75
musicnote.x =0
musicnote.y = -2
musicbutton.x = 0
musicbutton.y = 0
musicgroup.xScale = 1.20
musicgroup.yScale = 1.20
end

end

resize();
resize2();
resize3(fxgroup.name);
resize3(musicgroup.name);


fxtext:setTextColor(255,255,100)


groupb.xScale = .85
groupb.yScale = .75

groupb.x = display.contentWidth*.5 - 191/2
groupb.y = display.contentHeight*.52

backgroup:setReferencePoint(display.TopLeftPoint);
groupb:setReferencePoint(display.CenterReferencePoint);
creditstext:setTextColor(255,255,100)
resettext:setTextColor(255,255,100)

resetgroup.y = 65
resettext.x = resetgroup.contentWidth/2 +10
resettext.y =  resetgroup.contentHeight/2 +5
creditstext.x = creditsgroup.contentWidth/2 +10
creditstext.y = creditsgroup.contentHeight/2 +5

function fxsettings()
local temp, temp2
path = system.pathForFile( "options.txt", system.DocumentsDirectory )
 

fh, reason = io.open( path, "r" )
contents = fh:read( "*n" )
temp = contents
contents = fh:read( "*n" )
temp2 = contents
io.close(fh)
 fh = io.open( path, "w" )
 if(temp ==1) then 
 fxtext.alpha = .4
 audio.setVolume(.0, {channel=1})
 fh:write(0,"\n")
else 
 fxtext.alpha = 1
 audio.setVolume(.9, {channel=1})
 fh:write(1,"\n")
 end
 
fh:write(temp2)
io.close(fh)
end

function musicsettings()

path = system.pathForFile( "options.txt", system.DocumentsDirectory )
 
fh, reason = io.open( path, "r" )
contents = fh:read("*n")
temp = contents
contents = fh:read("*n")
temp2 = contents
io.close(fh)
 fh = io.open( path, "w" )
 fh:write(temp,"\n")
 if(temp2 ==1) then 
 musicnote.alpha = 0
 audio.setVolume(.0, {channel=5})
 fh:write(0,"\n")
else 
 musicnote.alpha = 1
 audio.setVolume(.9, {channel=5})
 fh:write(1,"\n")
 end

io.close(fh)
end

function decralpha()
musicnote.alpha = .4
end



function repaintbutton()
resetbutton = display.newImage("button1.png")
resettext:setTextColor(255,255,100)
resetgroup:insert(resetbutton)
resetgroup:insert(resettext)
end

function repaintbutton2()
fxtext:setTextColor(255,255,100)
fxbutton = display.newImage("button1.png")
resize3("fx")
fxgroup:insert(fxbutton)
fxgroup:insert(fxtext)
end

function repaintbutton3()
musicnote = display.newImage("note.png")
musicbutton = display.newImage("button1.png")
resize3("music")
musicgroup:insert(musicbutton)
musicgroup:insert(musicnote)
end

--Button Effects
function toucheff(e)
creditsbutton = display.newImage("button2.png")
creditstext:setTextColor(200,255,0,200)
creditsgroup:insert(creditsbutton)
creditsgroup:insert(creditstext)
audio.play(pop,{channel=1})
director:changeScene("credit","fade")

end

function toucheff2(e)
resetbutton = display.newImage("button2.png")
resettext:setTextColor(200,255,0,200)
resetgroup:insert(resetbutton)
resetgroup:insert(resettext)
--audio.stop(soundtrack);
audio.play(pop,{channel=1});
director:openPopUp( "reset")
 timer.performWithDelay(
    200, repaintbutton )
end

function toucheff3(e)
backbutton = display.newImage("button2.png")
backgroup:insert(backbutton)
backgroup:insert(backarrow)
resize();
audio.play(pop,{channel=1});
director:changeScene("menu","fade")
end

function toucheff4(e)

fxbutton = display.newImage("button2.png")
fxtext:setTextColor(200,255,0,200)
resize3(e.target.name)
fxgroup:insert(fxbutton)
fxgroup:insert(fxtext)
audio.play(pop,{channel=1});
fxsettings();
timer.performWithDelay(
    200, repaintbutton2)

	end
	
function toucheff5(e)
musicbutton = display.newImage("button2.png")
musicnote = display.newImage("note2.png")
resize3(e.target.name)
musicgroup:insert(musicbutton)
musicgroup:insert(musicnote)
audio.play(pop,{channel=1});
timer.performWithDelay(200, repaintbutton3)	
musicsettings();
print(temp2)
if(temp2== 1)then
timer.performWithDelay(200, decralpha)	
end

end


--Inserting Background white border
local background2 = display.newImage("background2.png")

--Button Events
creditsgroup:addEventListener("tap",toucheff)
resetgroup:addEventListener("tap",toucheff2)
backgroup:addEventListener("tap",toucheff3)
fxgroup:addEventListener("tap",toucheff4)
musicgroup:addEventListener("tap",toucheff5)

localGroup:insert(background);
localGroup:insert(text);
localGroup:insert(text2);
localGroup:insert(backgroup)
localGroup:insert(groupb);
localGroup:insert(musicgroup);
localGroup:insert(fxgroup);
localGroup:insert(background2);

return localGroup;
end




