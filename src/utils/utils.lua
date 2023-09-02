local utils = {}
utils.contains = function(tbl, e)
	for _, v in pairs(tbl) do
		if v == e then return true end
	end
	return false
end
utils.length = function(tbl)
	local count = 0
	for _ in pairs(tbl) do
		count = count + 1
	end
  return count
end
utils.randomItem = function(tbl)
  return tbl[math.random(1, #tbl)]
end
utils.append = function(from_tbl, to_tbl)
	for k, v in pairs(from_tbl) do
		if not to_tbl[k] then
			to_tbl[k] = v
		end
	end
	return to_tbl
end
utils.subsetByKeys = function(tbl, keys) 
	local subset = {}
	for _, key in ipairs(keys) do
		subset[key] = tbl[key]
	end
	return subset
end
return utils