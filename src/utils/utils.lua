local utils = {}
function utils.contains(t, e)
  for i = 1,#t do
    if t[i] == e then return true end
  end
  return false
end
function utils.length(T)
  local count = 0
  for _ in pairs(T) do
    count = count + 1
    end
  return count
end
function utils.randomItem(T)
  return T[math.random(1, #T)]
end
function utils.append(T1, T2)
	for k, v in pairs(T2) do
		if not T1[k] then
			T1[k] = v
		end
	end
	return T1
end
function utils.subsetByKeys(T, keys) 
	local subset = {}
	for _, key in ipairs(keys) do
		subset[key] = T[key]
	end
	return subset
end
return utils