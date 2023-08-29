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
-- test
local params = require("src.consts.params")
local messageZoneParameters = params.messageZoneParameters
local messageZoneMeta = {}
local metadata = require("src.consts.metadata")
local actCardMeta = metadata.actCard
local count_msg = require("src.count_msg")
for player, zones in pairs(messageZoneParameters) do
	if utils.contains(getSeatedPlayers(), player) then
		for type, params in pairs(zones) do
			local obj = spawnObject(params)
			messageZoneMeta[obj.getGUID()] = {["owner"] = player, ["type"] = type}
			messageZoneParameters[player][type]["zone"] = obj
		end
	end
end
function onObjectEnterZone(zone, object)
	if messageZoneMeta[zone.getGUID()] and messageZoneMeta[zone.getGUID()]["type"] == "messageDeck" then
		local messageFreq = count_msg.countMsg(actCardMeta, count_msg.getCardGUIDsfromZone(zone))
		local player = messageZoneMeta[zone.getGUID()]["owner"]
		messageZoneParameters[player]["blackMessageCountDisplay"].zone.setValue(tostring(messageFreq.black or 0))
		messageZoneParameters[player]["redMessageCountDisplay"].zone.setValue(tostring((messageFreq.red or 0) + (messageFreq.dual or 0)))
		messageZoneParameters[player]["blueMessageCountDisplay"].zone.setValue(tostring((messageFreq.blue or 0) + (messageFreq.dual or 0)))
	end
end
function onObjectLeaveZone(zone, object)
	if messageZoneMeta[zone.getGUID()] and messageZoneMeta[zone.getGUID()]["type"] == "messageDeck" then
		local messageFreq = count_msg.countMsg(actCardMeta, count_msg.getCardGUIDsfromZone(zone))
		local player = messageZoneMeta[zone.getGUID()]["owner"]
		messageZoneParameters[player]["blackMessageCountDisplay"].zone.setValue(tostring(messageFreq.black or 0))
		messageZoneParameters[player]["redMessageCountDisplay"].zone.setValue(tostring((messageFreq.red or 0) + (messageFreq.dual or 0)))
		messageZoneParameters[player]["blueMessageCountDisplay"].zone.setValue(tostring((messageFreq.blue or 0) + (messageFreq.dual or 0)))
	end

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