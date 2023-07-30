require("src/utils")
setup_button_parameters = {}
setup_button_parameters.click_function = 'setup'
setup_button_parameters.function_owner = nil
setup_button_parameters.label = "Set up"
setup_button_parameters.position = {0,0.8,0}
setup_button_parameters.rotation = {0,180,0}
setup_button_parameters.width = 500
setup_button_parameters.height = 500
setup_button_parameters.font_size = 150
setup_button_parameters.fontStyle = "Bold"
local idDeck_guid = "937c8b"
local charDeck_guid = "e0c75d"
local setupButton_guid = "2816c9"
function onLoad()
    idDeck = getObjectFromGUID(idDeck_guid)
    charDeck = getObjectFromGUID(charDeck_guid)
    setupButton = getObjectFromGUID(setupButton_guid)
    setupButton.createButton(setup_button_parameters)
end
-- take objects with specific tag from the source to the target
function transferObjectsWithSameTag(source, target, tag)
    for _, object in ipairs(source.getObjects()) do
        if not contains(object.tags, tag) then
            local takenObject = source.takeObject({index = object.index, smooth = true})
            target.putObject(takenObject)
        end
    end
end
-- dispatch cards in a deck to each zone
function distributeCardsToEachZone(deck, zones)
    deck.shuffle()
    for _, zone in ipairs(zones) do
        deck.takeObject().setPosition(zone.getPosition())
    end
end
-- deal cards to seated players
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
    -- player panels are tagged with corresponding color names
    local player_col = {"White", "Red", "Yellow", "Green", "Blue", "Purple", "Pink"}
    for i, col in ipairs(player_col) do
        if not contains(getSeatedPlayers(), col) then
            for i, obj in ipairs(getObjectsWithTag(col)) do
                destroyObject(obj)
            end
        end 
    end
    broadcastToAll("Select a character card and put it into your panel")
    dealCards(charDeck, 3)
    setupButton.clearButtons()
    local playerTag = "player_" .. tostring(numPlayers)
    transferObjectsWithSameTag(idDeck, charDeck, playerTag)
    distributeCardsToEachZone(idDeck, getObjectsWithTag("identity_zone"))
    charDeck.putObject(idDeck)
end