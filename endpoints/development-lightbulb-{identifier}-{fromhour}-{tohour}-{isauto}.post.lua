--#ENDPOINT POST /development/lightbulb/{identifier}/{fromhour}/{tohour}/{isauto}
-- Description: POST lightbulb automatically turned on form fromhour to tohour
function getHour(utc)
  return tonumber(os.date("%H", os.time() + utc * 60 * 60))
end

local identifier = tostring(request.parameters.identifier)
local fromhour = tonumber(request.parameters.fromhour)
local tohour = tonumber(request.parameters.tohour)
local isauto = tostring(request.parameters.isauto)

local nowtime = getHour(8)
local ret
if fromhour <= nowtime and nowtime <= tohour then
  ret = write(identifier, "state", isauto)
else
  isauto = "0"
  ret = write(identifier, "state", isauto)
end

ret.lightbulb = isauto
return ret

