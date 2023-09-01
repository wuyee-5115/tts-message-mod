local msgCounter = {}
local utils = require("src.utils.utils")
-- Get specific attribute values from a metadata table
-- @param metadata: table containing metadata for game objects
-- @param attribute: string representing the attribute to retrieve
-- @return infoTable: table mapping keys to the attribute value
local function getInfoByAttribute(metadata, attribute)
	local infoTable = {}
	for key, value in pairs(metadata) do
		infoTable[key] = metadata[key][attribute]
	end
	return infoTable
end
-- Count the frequency of each value in a table
-- @param valueTable: table containing values to be counted
-- @return valueFreq: table mapping each unique value to its frequency
local function countValueFreq(valueTable)
	local valueFreq = {}
	for key, value in pairs(valueTable) do
		valueFreq[value] = (valueFreq[value] or 0) + 1
	end
	return valueFreq
end
-- Retrieve GUIDs of cards within a target zone
-- @param targetZone: Zone object to retrieve cards from
-- @return guids: table containing GUIDs of cards within the zone
local function getCardGUIDsfromZone(targetZone)
	local guids = {}
    for _, object in ipairs(targetZone.getObjects()) do
        if object.getData().Name == "Card" then
            table.insert(guids, object.getGUID())
        elseif object.getData().Name == "Deck" then
            for _, cardInDeck in ipairs(object.getObjects()) do
                table.insert(guids, cardInDeck.guid)
            end
        end
    end
	return guids
end
-- Count the frequency of messages in a set of cards
-- @param actCardMeta: table containing metadata for active cards
-- @param guids: table containing GUIDs of cards to count messages for
-- @return messageFreq: table mapping each message type to its frequency
local function countMessage(actCardMeta, guids)
	local subsetActCardMeta = utils.subsetByKeys(actCardMeta, guids)
	local messageInfo = getInfoByAttribute(subsetActCardMeta, "message")
	local messageFreq = countValueFreq(messageInfo)
	return messageFreq
end
-- Update the message frequency display for a zone
-- @param zone: Zone object to update the display for
-- @param metadata: table containing metadata for game objects
-- @param attributesToGuid: table mapping attributes to object GUIDs
-- @param guidToAttributes: table mapping object GUIDs to their attributes
msgCounter.updateMsgFreqDisplay = function(zone, metadata, attributesToGuid, guidToAttributes)
	local msgFreq = countMessage(metadata, getCardGUIDsfromZone(zone))
	local player = guidToAttributes[zone.getGUID()]["player"]
	getObjectFromGUID(attributesToGuid[player]["blackMsgNumDisplay"]).setValue(tostring(msgFreq.black or 0))
	getObjectFromGUID(attributesToGuid[player]["blueMsgNumDisplay"]).setValue(tostring((msgFreq.blue or 0) + (msgFreq.dual or 0)))
	getObjectFromGUID(attributesToGuid[player]["redMsgNumDisplay"]).setValue(tostring((msgFreq.red or 0) + (msgFreq.dual or 0)))
end
return msgCounter