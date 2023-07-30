require("src/utils")
local idDeck_guid = "937c8b"
local charDeck_guid = "e0c75d"
local setupButton_guid = "2816c9"
function onLoad()
    idDeck = getObjectFromGUID(idDeck_guid)
    charDeck = getObjectFromGUID(charDeck_guid)
    setupButton = getObjectFromGUID(setupButton_guid)
    setupButton.createButton(getSetUpButtonParameters())
end
function getSetUpButtonParameters()
    return {
        click_function = 'setup',
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
function transferObjectsWithSameTag(source, target, tag)
    for _, object in ipairs(source.getObjects()) do
        if not contains(object.tags, tag) then
            local takenObject = source.takeObject({index = object.index, smooth = true})
            target.putObject(takenObject)
        end
    end
end
function distributeCardsToEachZone(deck, zones)
    deck.shuffle()
    for _, zone in ipairs(zones) do
        deck.takeObject().setPosition(zone.getPosition())
    end
end
function removeUnusedPlayerObjects()
    -- this function assumes that target objects have corresponding tags (i.e. color name) to their owner
    local player_colors = {"White", "Red", "Yellow", "Green", "Blue", "Purple", "Pink"}
    for i, color in ipairs(player_colors) do
        if not contains(getSeatedPlayers(), color) then
            for i, object in ipairs(getObjectsWithTag(color)) do
                destroyObject(object)
            end
        end 
    end
end
function dealCards(deck, num)
    deck.shuffle()
    deck.deal(num)
end
function setup()
    local numPlayers = length(getSeatedPlayers())
    if numPlayers < 3 or numPlayers > 7 then
       broadcastToAll("[WARNING]: This game only supports 3 - 7 players", "Yellow") 
       return
    end
    removeUnusedPlayerObjects()
    broadcastToAll("[INFO]: Select a character card and put it into your panel")
    dealCards(charDeck, 3)
    setupButton.clearButtons()
    local playerTag = "player_" .. tostring(numPlayers)
    transferObjectsWithSameTag(idDeck, charDeck, playerTag)
    distributeCardsToEachZone(idDeck, getObjectsWithTag("identity_zone"))
    charDeck.putObject(idDeck)
end