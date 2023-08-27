local start = {}
local utils = require("src.utils.utils")
local colors = require("src.consts.colors")
local objects = require("src.consts.objects")
local warning_color = colors.yellow
local function extractObjectsWithTag(objects, tag)
    local objectsWithSameTag = {}
    for _, object in ipairs(objects) do
       if utils.contains(object.getTags(), tag) then
            table.insert(objectsWithSameTag, object)
       end
    end
    return objectsWithSameTag
end
local function hasObjects(objects)
    return #objects > 0
end
local function numberOfHandObjects(player)
    return #Player[player].getHandObjects(1)
end
local function areAllHandObjectsEqualToNumber(players, number)
    for _, player in ipairs(players) do
        if numberOfHandObjects(player) ~= number then
            return false
        end
    end
    return true
end
start.createStartButton = function()
    objects.setupButtonScriptZone().createButton({
        click_function = 'globalStart',
        label = "Start",
        position = {0,0.8,0},
        rotation = {0,180,0},
        width = 500, height = 500, font_size = 150,
        fontStyle = "Bold"
    })
end
start.start = function ()
    local seatedPlayers = getSeatedPlayers()
    if not areAllHandObjectsEqualToNumber(seatedPlayers, 0) then
        broadcastToAll("[WARNING]: place any unused character cards into the 'REMOVE' deck", warning_color)
        return
    end
    for _, zone in ipairs(getObjectsWithTag("character_zone")) do
        local cardsInZone = extractObjectsWithTag(zone.getObjects(), "scripted")
        if not hasObjects(cardsInZone) then
            broadcastToAll("[WARNING]: place the character card you want to use in the designated character zone on your panel", warning_color)
            return
        end
    end
    objects.actDeck().deal(2)
    Turns.turn_color = utils.randomItem(seatedPlayers)
    objects.setupButtonScriptZone().clearButtons()
end
function globalStart()
    start.start()
end
return start