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
function onLoad()
    id_deck = getObjectFromGUID("937c8b")
    char_deck = getObjectFromGUID("e0c75d")
    setup_btn = getObjectFromGUID('2816c9')
    setup_btn.createButton(setup_button_parameters)
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
-- Function to set an object visible to only one player
function setVisibleTo(object, playerColor)
    local seatedPlayers = getSeatedPlayers()
    -- Create a table with all players except the target player
    local playersToHide = {}
    for _, player in ipairs(seatedPlayers) do
        if player ~= playerColor then
            table.insert(playersToHide, player)
        end
    end
    -- Set the object invisible to all players except the target player
    object.setInvisibleTo(playersToHide)
end
function setup()
   -- check player numbers
    if length(getSeatedPlayers()) < 3 then
       broadcastToAll("[WARNING]: This game requires at least 3 players", "Yellow") 
       return
    elseif length(getSeatedPlayers()) > 7 then
       broadcastToAll("[WARNING]: This game supports at most 7 players", "Yellow") 
       return
    end
    -- remove unused player panels
    -- player panels are tagged with corresponding color names
    local player_col = {"White", "Red", "Yellow", "Green", "Blue", "Purple", "Pink"}
    for i, col in ipairs(player_col) do
        if not contains(getSeatedPlayers(), col) then
            for i, obj in ipairs(getObjectsWithTag(col)) do
                destroyObject(obj)
            end
        end 
    end
    -- deal character cards for each seated player
    broadcastToAll("Select a character card and put it into your panel")
    char_deck.shuffle()
    char_deck.deal(3)
    -- remove the set up button after dealing character cards
    setup_btn.clearButtons()
    local numPlayers = length(getSeatedPlayers())
    if numPlayers >= 3 and numPlayers <= 7 then
        id_deck.setPosition({-0.59, 0, 0})
        local playerTag = "player_" .. tostring(numPlayers)
        transferObjectsWithSameTag(id_deck, char_deck, playerTag)
        distributeCardsToEachZone(id_deck, getObjectsWithTag("identity_zone"))
        char_deck.putObject(id_deck)
    end
end