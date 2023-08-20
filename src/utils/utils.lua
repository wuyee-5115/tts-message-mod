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
return utils