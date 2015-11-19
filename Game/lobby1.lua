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
local i
local leveltable = {}
local backbutton = display.newImage("button1.png")
local backarrow = display.newImage("backarrow.png")
local backgroup = display.newGroup()

local text = display.newText("Hungry Squishy!",0,0,"Script MT Bold",30)
text:setTextColor(114,43,0)


text:setReferencePoint(display.CenteReferencePoint);
text.x = display.viewableContentWidth*.5
text.y = display.viewableContentHeight*.15


backgroup:insert(backbutton)
backgroup:insert(backarrow)

local j =0
local giantgroup = display.newGroup()

function toucheff(e, name)
audio.play(pop, {channel=1});
print(name+1)
director:changeScene("level1/" .. name+1,"fade")
end

path = system.pathForFile("level1.txt", system.DocumentsDirectory )
fh, reason = io.open( path, "r" )

function settable()
for i=0,24 do
leveltable[i] = {}
leveltable[i][0] = display.newImage("images/nut.png")
leveltable[i][1] = display.newText("1",0,0,"Tahoma",20)
leveltable[i][1].text = i+1
leveltable[i].name = i

leveltable[i][1]:setTextColor(114,43,0)
leveltable[i][0]:setReferencePoint(display.CenteReferencePoint);
leveltable[i][1]:setReferencePoint(display.CenteReferencePoint);
if(math.fmod(i,5) == 0) then
j=j+1
end

leveltable[i][0].x = math.fmod(i,5)*50;
leveltable[i][0].y = j*80;
leveltable[i][1].x = 3 + math.fmod(i,5)*50;
leveltable[i][1].y = 2 +j*80;

contents = fh:read( "*n" )

 if(contents ==1) then 
leveltable[i][0]:addEventListener("tap", function() toucheff(event, leveltable[i].name)end)
leveltable[i][1]:addEventListener("tap", function() toucheff(event, leveltable[i].name) end)
else 
leveltable[i][0].alpha = .4
leveltable[i][1].alpha = .4
 end
 

 


giantgroup:insert(leveltable[i][0])
giantgroup:insert(leveltable[i][1])

end
io.close(fh)
end


settable();

giantgroup.xScale = 0.90
giantgroup.yScale = 0.90
giantgroup:setReferencePoint(display.CenteReferencePoint);
giantgroup.x = display.viewableContentWidth*.22
giantgroup.y = display.viewableContentHeight*.13

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
director:changeScene("levelselect","fade")
end




resize();

backgroup:addEventListener("tap",toucheff3)

local background2 = display.newImage("background2.png")

localGroup:insert(background);
localGroup:insert(backgroup);
localGroup:insert(text);

localGroup:insert(giantgroup);
localGroup:insert(background2);

return localGroup;
end