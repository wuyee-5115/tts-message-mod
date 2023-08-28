local countMsg = {}
local actCardMeta = {
["c5bd16"] = { message = "black" },
["9aa160"] = { message = "black" },
["acf26c"] = { message = "black" },
["cb92ea"] = { message = "black" },
["ca44ae"] = { message = "black" },
["f3a288"] = { message = "black" },
["964486"] = { message = "black" },
["004270"] = { message = "black" },
["d327cf"] = { message = "black" },
["b0a54c"] = { message = "black" },
["705167"] = { message = "black" },
["afa320"] = { message = "black" },
["29e183"] = { message = "black" },
["eee983"] = { message = "black" },
["ee8727"] = { message = "black" },
["1e0537"] = { message = "black" },
["88fb48"] = { message = "black" },
["8738a1"] = { message = "black" },
["1324c7"] = { message = "black" },
["42fdb3"] = { message = "black" },
["2f9243"] = { message = "black" },
["7fff50"] = { message = "black" },
["1df492"] = { message = "black" },
["8200ce"] = { message = "black" },
["11f7cc"] = { message = "black" },
["0a5713"] = { message = "black" },
["52d575"] = { message = "black" },
["2d5396"] = { message = "black" },
["54b223"] = { message = "black" },
["6161eb"] = { message = "black" },
["51e2c5"] = { message = "black" },
["35a9c6"] = { message = "black" },
["b2717c"] = { message = "black" },
["8918bd"] = { message = "black" },
["1f6d6b"] = { message = "black" },
["1faa74"] = { message = "black" },
["64803c"] = { message = "black" },
["d4ebfc"] = { message = "black" },
["7f4d5f"] = { message = "black" },
["d883c6"] = { message = "black" },
["18ca1c"] = { message = "black" },
["5650fc"] = { message = "black" },
["d96c0d"] = { message = "red" },
["b2fe77"] = { message = "red" },
["d82ddc"] = { message = "red" },
["93096a"] = { message = "red" },
["672e50"] = { message = "red" },
["1fdd73"] = { message = "red" },
["2fa342"] = { message = "red" },
["bcede5"] = { message = "red" },
["bb0cdb"] = { message = "red" },
["6f2467"] = { message = "red" },
["b690e4"] = { message = "red" },
["3b33df"] = { message = "red" },
["d1f8bd"] = { message = "red" },
["24c7c1"] = { message = "red" },
["bdcaf5"] = { message = "red" },
["d690f3"] = { message = "red" },
["02909f"] = { message = "red" },
["873733"] = { message = "red" },
["91612f"] = { message = "red" },
["5cf9bc"] = { message = "red" },
["cc5d8c"] = { message = "red" },
["74bd8c"] = { message = "blue" },
["b18cd7"] = { message = "blue" },
["71fc0b"] = { message = "blue" },
["b76da5"] = { message = "blue" },
["a6982b"] = { message = "blue" },
["73506c"] = { message = "blue" },
["5de7c2"] = { message = "blue" },
["30014c"] = { message = "blue" },
["f247c1"] = { message = "blue" },
["959f5a"] = { message = "blue" },
["5ab142"] = { message = "blue" },
["1d62df"] = { message = "blue" },
["55ac2b"] = { message = "blue" },
["70abb1"] = { message = "blue" },
["341b07"] = { message = "blue" },
["4114b8"] = { message = "blue" },
["4beb3f"] = { message = "blue" },
["3d7eed"] = { message = "blue" },
["c92a44"] = { message = "blue" },
["0a1931"] = { message = "blue" },
["203fdc"] = { message = "blue" },
["fb9608"] = { message = "dual" },
["7345ee"] = { message = "dual" },
["516bf5"] = { message = "dual" }
}
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
countMsg.countMsg = function(guids)
	local subsetActCardMeta = subsetByKeys(actCardMeta, guids)
	local messageInfo = getInfoByAttribute(subsetActCardMeta, "message")
	local messageFreq = countValueFreq(messageInfo)
	return messageFreq
end
return countMsg