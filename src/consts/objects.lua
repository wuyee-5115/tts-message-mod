local objects = {}
local guids = require("src.consts.guids")
local function getObjFun(guid)
    return function() return getObjectFromGUID(guid) end
end
-- Get the object by calling a function, like: objects.idDeck()
-- Add objects by GUID using getObjFun as follows
objects.idDeck = getObjFun(guids.idDeck)
objects.charDeck = getObjFun(guids.charDeck)
objects.setupButtonScriptZone = getObjFun(guids.setupButtonScriptZone)
objects.idDeck_zone = getObjFun(guids.idDeck_zone)
objects.actDeck = getObjFun(guids.actDeck)
return objects