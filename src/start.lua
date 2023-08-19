local start = {}
local utils = require("src.utils.utils")
local actDeck_guid = "4a8259"
local startButton_guid = "2816c9"
local function getStartButtonParameters()
    return {
        click_function = 'globalStart',
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
start.setButton = function()
    local startButton = getObjectFromGUID(startButton_guid)
    startButton.createButton(getStartButtonParameters())
end
start.start = function ()
    local seatedPlayers = getSeatedPlayers()
    local actDeck = getObjectFromGUID(actDeck_guid)
    actDeck.deal(2)
    local initialPlayer = utils.randomItem(seatedPlayers)
    Turns.turn_color = initialPlayer
end
function globalStart()
    start.start()
end
return start