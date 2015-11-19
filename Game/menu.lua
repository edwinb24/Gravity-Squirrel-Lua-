module(..., package.seeall)
	
function new()




--Check If You Have Play Before--
function levelcreator ()

local path = system.pathForFile( "maindata.txt", system.DocumentsDirectory )
 
-- io.open opens a file at path. returns nil if no file found
local fh, reason = io.open( path, "r" )
 
if fh then
   -- read all contents of file into a string
   local contents = fh:read( "*a" )
else
   -- create file because it doesn't exist yet
   fh = io.open( path, "w" )

   --Each 0 represent a level, the number change to 1 if the level is 
   -- unlock, and change to 2 to 4 depending on the number of archievement 
   --adquire in the level
   if fh then
		fh:write(1,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0)	
        print( "Created file" )
   else
        print( "Create file failed!" )
   end
  
end
 
io.close( fh )

--Option Central Creation

local path = system.pathForFile( "options.txt", system.DocumentsDirectory )
 
-- io.open opens a file at path. returns nil if no file found
local fh, reason = io.open( path, "r" )
 
if fh then
   -- read all contents of file into a string
   local contents = fh:read( "*a" )
else
   -- create file because it doesn't exist yet
   fh = io.open( path, "w" )

   --Each 0 represent a level, the number change to 1 if the level is 
   -- unlock, and change to 2 to 4 depending on the number of archievement 
   --adquire in the level
   if fh then
		fh:write(1,"\n",1)	
        print( "Created file" )
   else
        print( "Create file failed!" )
   end
  
end
 
io.close( fh )




--Create levels info--
for i=1,10 do
path = system.pathForFile( "level" .. i .. ".txt", system.DocumentsDirectory )
 
-- io.open opens a file at path. returns nil if no file found
fh = io.open( path, "r" )
 
if fh then
   -- read all contents of file into a string
   contents = fh:read( "*a" )
else
   -- create file because it doesn't exist yet
   fh = io.open( path, "w" )

   --Each 0 represent a level, the number change to 1 if the level is 
   -- unlock, and change to 2 to 4 depending on the number of archievement 
   --adquire in the level
   if fh then
		fh:write(1,"\n",1,"\n",1,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0, "\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0,"\n",0)	
        print( "Created file" )
   else
        print( "Create file failed!" )
   end
  
end
 
io.close(fh)

end

end
--End Check--


levelcreator()


--Checking Sound Preferences
local soundtrack = audio.loadStream("media/soundtrack.mp3");
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
 audio.setVolume(.90, {channel=5})
else 
 audio.stop(soundtrack)
 end
 
 io.close(fh)
--end check
 

-- io.open opens a file at path. returns nil if no file found
local fh, reason = io.open( path, "r" )


local localGroup = display.newGroup();

local soundtrack = audio.loadStream("media/soundtrack.mp3");
display.setStatusBar( display.HiddenStatusBar )
local background = display.newImage("images/BG.jpg")
background.xScale = .5
background.yScale = .5
background:setReferencePoint(display.CenterReferencePoint)
background.x = display.viewableContentWidth*.5
background.y = display.viewableContentHeight*.5

--Displaying Name of the game--
local text = display.newText("G",display.contentWidth*.2,display.contentHeight*.2,"Script MT Bold",48)

text:setTextColor(200,255,0,200)
local text2 = display.newText("   ravity",display.contentWidth*.2-5,display.contentHeight*.2,"Script MT Bold",48)

text2:setTextColor(255,255,100)
local text3 = display.newText(" S",display.contentWidth*.2,display.contentHeight*.3,"Script MT Bold",48)

text3:setTextColor(255,255,100)
local text4 = display.newText("   quirrel",display.contentWidth*.2,display.contentHeight*.3,"Script MT Bold",48)

text4:setTextColor(200,255,0,200)



--inserting Buttons
local groupb = display.newGroup()

local playbutton = display.newImage("button1.png")

local optionsbutton = display.newImage("button1.png")

local playtext= display.newText("Play",0,0,"Script MT Bold",36)

local optionstext= display.newText("Options",0,0,"Script MT Bold",36)


local playgroup = display.newGroup()

local optionsgroup = display.newGroup()


playgroup:insert(playbutton)
optionsgroup:insert(optionsbutton)
optionsgroup:insert(optionstext)
playgroup:insert(playtext)
groupb:insert(playgroup)
groupb:insert(optionsgroup)

groupb.xScale = .85
groupb.yScale = .75
groupb.x = display.contentWidth*.5 - 191/2
groupb.y = display.contentHeight*.52

groupb:setReferencePoint(display.CenterReferencePoint);
playtext:setTextColor(255,255,100)
optionstext:setTextColor(255,255,100)

optionsgroup.y = 65
optionstext.x = optionsgroup.contentWidth/2 +10
optionstext.y =  optionsgroup.contentHeight/2 +5
playtext.x = playgroup.contentWidth/2 +10
playtext.y = playgroup.contentHeight/2 +5

--Button Effects
function toucheff(e)
playbutton = display.newImage("button2.png")
playtext:setTextColor(200,255,0,200)
playgroup:insert(playbutton)
playgroup:insert(playtext)
audio.play(pop, {channel=1})
director:changeScene("levelselect","fade")
end


function toucheff2(e)
optionsbutton = display.newImage("button2.png")
optionstext:setTextColor(200,255,0,200)
optionsgroup:insert(optionsbutton)
optionsgroup:insert(optionstext)
audio.play(pop, {channel=1});
director:changeScene("options","fade")
end


--Inserting Background white border
local background2 = display.newImage("background2.png")

localGroup:insert(background);
localGroup:insert(text);
localGroup:insert(text2);
localGroup:insert(text3);
localGroup:insert(text4);

localGroup:insert(groupb);
localGroup:insert(background2);


playgroup:addEventListener("tap",toucheff)
optionsgroup:addEventListener("tap",toucheff2)

return localGroup;
end




