--#ENDPOINT GET /development/device/data/{identifier}/{window}
-- Description: Get timeseries data for specific device
-- Parameters: ?identifier=<uniqueidentifier>&window=<number>
local identifier = tostring(request.parameters.identifier) -- ?identifier=<uniqueidentifier>
local window = tostring(request.parameters.window) -- in minutes,if ?window=<number>
if true then
  local data = {}
  if window == nil then window = '30' end
  -- Assumes temperature and humidity data device resources
  out = Timeseries.query({
    epoch='ms',
    q = "SELECT value FROM temperature,humidity WHERE identifier = '" ..identifier.."' AND time > now() - "..window.."m LIMIT 5000"})
  data['timeseries'] = out
  return data
else
  response.message = "Conflict - Identifier Incorrect"
  response.code = 404
  return
end

