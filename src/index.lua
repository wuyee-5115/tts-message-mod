-- [Console++](https://tts-vscode.rolandostar.com/extension/console++)
require("vscode.console")
-- Project Modules: Put all modules here for easy development
local colors = require("src.consts.colors")
local guids = require("src.consts.guids")
local objects = require("src.consts.objects")
local log = require("src.utils.log")
local utils = require("src.utils.utils")
require("src.config")
local setup = require("src.setup")
local start = require("src.start")
local params = require("src.consts.params")
local metadata = require("src.consts.metadata")
local msgCounter = require("src.msgCounter")
local create = require("src.create")
-- Spawn objects
local seatedPlayerObjectParams = utils.subsetByKeys(params, getSeatedPlayers())
local guidToAttributes = create.objectsFromParams(seatedPlayerObjectParams)
local attributesToGuid = create.attributesToGuid(guidToAttributes)
-- Event handlers
local zoneHandlers = {
	["msgDeck"] = function(zone)
		msgCounter.updateMsgFreqDisplay(zone, metadata.actCard, attributesToGuid, guidToAttributes)
	end,
	-- Add more zone types here
}
local function handleZoneAction(zone, object)
	local zoneType = guidToAttributes[zone.getGUID()] and guidToAttributes[zone.getGUID()]["objectType"]
	if zoneType and zoneHandlers[zoneType] then
		zoneHandlers[zoneType](zone)
	end
end
-- Events
function onObjectEnterZone(zone, object)
	handleZoneAction(zone, object)
end
function onObjectLeaveZone(zone, object)
	handleZoneAction(zone, object)
end
-- project onLoad
function onLoad()
    log.dev('onLoad')
    setup.onLoad()
end
-- [External Command](https://tts-vscode.rolandostar.com/extension/onExternalCommand)
function onExternalCommand(input)
    broadcastToAll('command: '..input, colors.red)
    if input == 'run' then
        -- do something here for development
    end
end