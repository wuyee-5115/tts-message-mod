checker = spawnObject(
	{
    type = "ScriptingTrigger",
    position = {0, 0, 0},
    scale = {2, 20, 2},
	}
)
function onObjectEnterZone(zone, object)
	local objGUIDs = "{"
	for _, obj in ipairs(object.getObjects()) do
		objGUIDs = objGUIDs .. "\"" .. obj.guid .. "\", "
	end
	objGUIDs = objGUIDs:sub(1, -3) .. "}"
	print(objGUIDs)
end