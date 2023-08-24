-- [Console++](https://tts-vscode.rolandostar.com/extension/console++)
require("vscode.console")
-- project modules
require("src.config")
local log = require("src.utils.log")
local objects = require("src.consts.objects")
local setup = require("src.setup")
local colors = require("src.consts.colors")
-- project onLoad
function onLoad()
    log.dev('onLoad')
    objects.onLoad()
    setup.onLoad()
end
-- [External Command](https://tts-vscode.rolandostar.com/extension/onExternalCommand)
function onExternalCommand(input)
    broadcastToAll('command: '..input, colors.red)
    if input == 'run' then
        -- do something here
    end
end