local countMsg = {}
local function getInfoByAttribute(metadata, attribute)
	local infoTable = {}
	for key, value in pairs(metadata) do
		infoTable[key] = metadata[key][attribute]
	end
	return infoTable
end
local function subsetByKeys(mainTable, keysToSelect) 
	local subset = {}
	for _, key in ipairs(keysToSelect) do
		subset[key] = mainTable[key]
	end
	return subset
end
local function countValueFreq(valueTable)
	local valueFreq = {}
	for key, value in pairs(valueTable) do
		valueFreq[value] = (valueFreq[value] or 0) + 1
	end
	return valueFreq
end
countMsg.getCardGUIDsfromZone = function(targetZone)
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
countMsg.countMsg = function(actCardMeta, guids)
	local subsetActCardMeta = subsetByKeys(actCardMeta, guids)
	local messageInfo = getInfoByAttribute(subsetActCardMeta, "message")
	local messageFreq = countValueFreq(messageInfo)
	return messageFreq
end
return countMsg