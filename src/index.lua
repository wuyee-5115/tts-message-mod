-- [Console++](https://tts-vscode.rolandostar.com/extension/console++)
require("vscode.console")
-- project modules
require("src.config")
local log = require("src.utils.log")
local setup = require("src.setup")
-- project onLoad
function onLoad()
    log.dev('onLoad')
    setup.onLoad()
end
-- [External Command](https://tts-vscode.rolandostar.com/extension/onExternalCommand)
function onExternalCommand(input)
    broadcastToAll(input, 'Red')
    if input == 'setup' then
        setup.setUp()
    end
end