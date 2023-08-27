local setup = {}
local utils = require("src.utils.utils")
local log = require("src.utils.log")
local start = require("src.start")
local objects = require("src.consts.objects")
local colors = require("src.consts.colors")
local function getSetUpButtonParameters()
    return {
        click_function = 'globalSetUp',
        function_owner = nil,
        label = "Set up",
        position = {0,0.8,0},
        rotation = {0,180,0},
        width = 500,
        height = 500,
        font_size = 150,
        fontStyle = "Bold"
    }
end
function setup.onLoad()
    log.dev('setup.onLoad')
    objects.setupButtonScriptZone().createButton(getSetUpButtonParameters())
end
local function moveObjectsWithoutTag(source, target, tag)
    for _, object in ipairs(source.getObjects()) do
        if not utils.contains(object.tags, tag) then
            local takenObject = source.takeObject({guid = object.guid, smooth = true})
            target.putObject(takenObject)
        end
    end
end
local function whosObject(object)
    local seatedPlayers = getSeatedPlayers()
    for _, color in ipairs(seatedPlayers) do
        if utils.contains(object.getTags(), color) then
            return color
        end
    end
end
local function distributeCardsToEachZone(deck, zones)
    deck.shuffle()
    for _, zone in ipairs(zones) do
        local card = deck.takeObject()
        card.setPosition(zone.getPosition())
        card.setRotation(zone.getRotation())
        card.addTag(whosObject(zone))
    end
end
local function removeUnusedPlayerObjects()
    -- this function assumes that target objects have corresponding tags (i.e. color name) to their owner
    local player_colors = {colors.white, colors.red, colors.yellow, colors.green, colors.blue, colors.purple, colors.pink}
    for _, color in ipairs(player_colors) do
        if not utils.contains(getSeatedPlayers(), color) then
            for _, object in ipairs(getObjectsWithTag(color)) do
                destroyObject(object)
            end
        end 
    end
end
local function dealCards(deck, num)
    deck.shuffle()
    deck.deal(num)
end
setup.setUp = function()
    local numPlayers = utils.length(getSeatedPlayers())
    if numPlayers < 3 or numPlayers > 7 then
       broadcastToAll("[WARNING]: This game only supports 3 - 7 players", "Yellow") 
       return
    end
    removeUnusedPlayerObjects()
    broadcastToAll("[INFO]: Select a character card and put it into your panel")
    dealCards(objects.charDeck(), 3)
    objects.setupButtonScriptZone().clearButtons()
    local playerTag = "player_" .. tostring(numPlayers)
    moveObjectsWithoutTag(objects.idDeck(), objects.charDeck(), playerTag)
    distributeCardsToEachZone(objects.idDeck(), getObjectsWithTag("identity_zone"))
    -- TODO: Currently waiting for other cards to clear to avoid deck misidentification.
    -- Needs a more robust solution to eliminate dependency on wait time.
    Wait.time(
        function ()
            for _, object in ipairs(objects.idDeck_zone().getObjects()) do
                objects.charDeck().putObject(object)
            end
        end,
        0.05
    )
    start.createStartButton()
end
function globalSetUp()
    setup.setUp()
end
return setup