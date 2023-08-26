local countMsg = {}
local msg = {
["c5bd16"] = "black", ["9aa160"] = "black", ["acf26c"] = "black", ["cb92ea"] = "black", ["ca44ae"] = "black",
["f3a288"] = "black", ["964486"] = "black", ["004270"] = "black", ["d327cf"] = "black", ["b0a54c"] = "black",
["705167"] = "black", ["afa320"] = "black", ["29e183"] = "black", ["eee983"] = "black", ["ee8727"] = "black",
["1e0537"] = "black", ["88fb48"] = "black", ["8738a1"] = "black", ["1324c7"] = "black", ["42fdb3"] = "black",
["2f9243"] = "black", ["7fff50"] = "black", ["1df492"] = "black", ["8200ce"] = "black", ["11f7cc"] = "black",
["0a5713"] = "black", ["52d575"] = "black", ["2d5396"] = "black", ["54b223"] = "black", ["6161eb"] = "black",
["51e2c5"] = "black", ["35a9c6"] = "black", ["b2717c"] = "black", ["8918bd"] = "black", ["1f6d6b"] = "black",
["1faa74"] = "black", ["64803c"] = "black", ["d4ebfc"] = "black", ["7f4d5f"] = "black", ["d883c6"] = "black",
["18ca1c"] = "black", ["5650fc"] = "black",
["d96c0d"] = "red", ["b2fe77"] = "red", ["d82ddc"] = "red", ["93096a"] = "red", ["672e50"] = "red", 
["1fdd73"] = "red", ["2fa342"] = "red", ["bcede5"] = "red", ["bb0cdb"] = "red", ["6f2467"] = "red", 
["b690e4"] = "red", ["3b33df"] = "red", ["d1f8bd"] = "red", ["24c7c1"] = "red", ["bdcaf5"] = "red", 
["d690f3"] = "red", ["02909f"] = "red", ["873733"] = "red", ["91612f"] = "red", ["5cf9bc"] = "red", 
["cc5d8c"] = "red",
["74bd8c"] = "blue", ["b18cd7"] = "blue", ["71fc0b"] = "blue", ["b76da5"] = "blue", ["a6982b"] = "blue", 
["73506c"] = "blue", ["5de7c2"] = "blue", ["30014c"] = "blue", ["f247c1"] = "blue", ["959f5a"] = "blue", 
["5ab142"] = "blue", ["1d62df"] = "blue", ["55ac2b"] = "blue", ["70abb1"] = "blue", ["341b07"] = "blue", 
["4114b8"] = "blue", ["4beb3f"] = "blue", ["3d7eed"] = "blue", ["c92a44"] = "blue", ["0a1931"] = "blue", 
["203fdc"] = "blue",
["fb9608"] = "dual", ["7345ee"] = "dual",  ["516bf5"] = "dual"
}
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
countMsg.countMsg = function(msgGUIDs)
	local selectedMsg = subsetByKeys(msg, msgGUIDs)
	local selectedMsgFreq = countValueFreq(selectedMsg)
	return selectedMsgFreq
end
return countMsg