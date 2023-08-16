local start = {}
local utils = require("src.utils.utils")
start.start = function (deck)
    seatedPlayers = getSeatedPlayers()
    deck.deal(2)
    initialPlayer = utils.randomItem(seatedPlayers)
    Turns.turn_color = initialPlayer
end
return start