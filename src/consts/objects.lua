local objects = {}
local log = require("src.utils.log")
function objects.onLoad()
    log.dev('objects.onLoad')
    objects.idDeck = getObjectFromGUID("937c8b")
    objects.charDeck = getObjectFromGUID("30c66e")
    objects.setupButton = getObjectFromGUID("2816c9")
    objects.idDeck_zone = getObjectFromGUID("9a0b41")
end
return objects