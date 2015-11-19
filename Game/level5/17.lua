module(..., package.seeall)

function new()
local localGroup = display.newGroup();
local background = display.newImage("images/BG.jpg")
localGroup:insert(background);

return localGroup;
end