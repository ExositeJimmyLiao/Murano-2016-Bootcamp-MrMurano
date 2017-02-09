--#ENDPOINT GET /development/storage/timeseries/{identifier}
-- Description: Show current time-series data for a specific unique device
-- Parameters: ?identifier=<uniqueidentifier>
local identifier = tostring(request.parameters.identifier)

if tostring ~= nil and tostring ~= "" then
  local data = {}
  -- Assumes temperature and humidity data device resources
  out = Timeseries.query({
    epoch='ms',
    q = "SELECT value FROM temperature,humidity WHERE identifier = '" ..identifier.."' LIMIT 20"})
  data['timeseries'] = out

  return 'Getting Last 20 Time Series Raw Data Points for: '..identifier..'\r\n'..to_json(out)
else
  response.message = "Conflict - Identifier Incorrect"
  response.code = 404
  return
end


