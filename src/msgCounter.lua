local msgCounter = {}
local utils = require("src.utils.utils")
-- Get specific attribute values from a metadata table
-- @param nested_tbl: table containing nested tables
-- @param child_key: key of a table within another table
-- @return extract_tbl: table mapping nested_tbl's keys to the attribute value
local function getValuesFromNestedTableByChildKey(nested_tbl, child_key)
	local extract_tbl = {}
	for parent_key, tbl in pairs(nested_tbl) do
		extract_tbl[parent_key] = nested_tbl[parent_key][child_key]
	end
	return extract_tbl
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
	local messageInfo = getValuesFromNestedTableByChildKey(subsetActCardMeta, "message")
	local messageFreq = countValueFreq(messageInfo)
	return messageFreq
end
-- Update the message frequency display for a zone
-- @param zone: Zone object to update the display for
-- @param metadata: table containing metadata for game objects
-- @param params: table mapping object attributes to their guids
msgCounter.updateMsgFreqDisplay = function(zone, actCardMeta, playerObjectMeta, params)
	local msgFreq = countMessage(actCardMeta, getCardGUIDsfromZone(zone))
	local player = playerObjectMeta[zone.getGUID()]["player"]
	getObjectFromGUID(params[player]["blackMsgNumDisplay"].data.GUID).setValue(tostring(msgFreq.black or 0))
	getObjectFromGUID(params[player]["blueMsgNumDisplay"].data.GUID).setValue(tostring((msgFreq.blue or 0) + (msgFreq.dual or 0)))
	getObjectFromGUID(params[player]["redMsgNumDisplay"].data.GUID).setValue(tostring((msgFreq.red or 0) + (msgFreq.dual or 0)))
end
return msgCounter