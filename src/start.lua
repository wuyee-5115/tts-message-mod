local start = {}
local utils = require("src.utils.utils")
local actDeck_guid = "4a8259"
local startButton_guid = "2816c9"
local function getStartButtonParameters()
    return {
        click_function = 'globalStart',
        function_owner = nil,
        label = "Start",
        position = {0,0.8,0},
        rotation = {0,180,0},
        width = 500,
        height = 500,
        font_size = 150,
        fontStyle = "Bold"
    }
end
local function subsetObjectsWithTag(objects, tag)
    local objectsWithSameTag = {}
    for _, object in ipairs(objects) do
       if utils.contains(object.getTags(), tag) then
            table.insert(objectsWithSameTag, object)
       end
    end
    return objectsWithSameTag
end
local function anyObjects(objects)
    if #objects > 0 then
        return true
    else
        return false
    end
end
local function getHandObjectNumber(player)
    local handObjects = Player[player].getHandObjects(1)
    return #handObjects
end
local function allHandObjectNumberEqualTo(players, number)
    for _, player in ipairs(players) do
        if getHandObjectNumber(player) ~= number then
            return false
        end
    end
    return true
end
start.createStartButton = function()
    local startButton = getObjectFromGUID(startButton_guid)
    startButton.createButton(getStartButtonParameters())
end
start.start = function ()
    local seatedPlayers = getSeatedPlayers()
    if not allHandObjectNumberEqualTo(seatedPlayers, 0) then
        broadcastToAll("[WARNING]: Place un-used character cards into the 'REMOVE' deck", "Yellow")
        return
    end
    for _, zone in ipairs(getObjectsWithTag("character_zone")) do
        local cardsInZone = subsetObjectsWithTag(zone.getObjects(), "scripted")
        if not anyObjects(cardsInZone) then
            broadcastToAll("[WARNING]: Place a character card you want to use in the character zone on your panel", "Yellow")
            return
        end
    end
    local actDeck = getObjectFromGUID(actDeck_guid)
    actDeck.deal(2)
    local initialPlayer = utils.randomItem(seatedPlayers)
    Turns.turn_color = initialPlayer
    local startButton = getObjectFromGUID(startButton_guid)
    startButton.clearButtons()
end
function globalStart()
    start.start()
end
return start