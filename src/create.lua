local create = {}
local utils = require("src.utils.utils")
-- Spawn objects and create a mapping from GUID to attributes for game objects
-- @param params: table containing the player and object type information
-- @return guidToAttributes: table mapping each object's GUID to its attributes
create.objectsFromParams = function(params)
	local guidToAttributes = {}
	for player, objectTypes in pairs(params) do
		for objectType, objectParams in pairs(objectTypes) do
			local object = spawnObject(objectParams)
			guidToAttributes[object.getGUID()] = utils.append(objectParams, {["player"] = player, ["objectType"] = objectType})
		end
	end
	return guidToAttributes
end
-- Create a mapping from attributes to GUID for game objects
-- @param guidToAttributes: table mapping each object's GUID to its attributes
-- @return attributesToGuid: table mapping attributes to GUID
create.attributesToGuid = function(guidToAttributes)
	local attributesToGuid = {}
	for guid, attributes in pairs(guidToAttributes) do
		local player = attributes.player
		local objectType = attributes.objectType
		if not attributesToGuid[player] then
			attributesToGuid[player] = {}
		end
		attributesToGuid[player][objectType] = guid
	end
	return attributesToGuid
end
return create