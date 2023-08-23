local setup = {}
local utils = require("src.utils.utils")
local log = require("src.utils.log")
local start = require("src.start")
local idDeck_guid = "937c8b"
local charDeck_guid = "30c66e"
local setupButton_guid = "2816c9"
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
    idDeck = getObjectFromGUID(idDeck_guid)
    charDeck = getObjectFromGUID(charDeck_guid)
    setupButton = getObjectFromGUID(setupButton_guid)
    setupButton.createButton(getSetUpButtonParameters())
end
local function moveObjectsWithTag(source, target, tag)
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
    local player_colors = {"White", "Red", "Yellow", "Green", "Blue", "Purple", "Pink"}
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
    dealCards(charDeck, 3)
    setupButton.clearButtons()
    local playerTag = "player_" .. tostring(numPlayers)
    moveObjectsWithTag(idDeck, charDeck, playerTag)
    distributeCardsToEachZone(idDeck, getObjectsWithTag("identity_zone"))
    charDeck.putObject(idDeck)
    start.createStartButton()
end
function globalSetUp()
    setup.setUp()
end
return setup