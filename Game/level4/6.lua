module(..., package.seeall)

function new()
local localGroup = display.newGroup();
local background = display.newImage("images/BG3.jpg")
localGroup:insert(background);

return localGroup;
end