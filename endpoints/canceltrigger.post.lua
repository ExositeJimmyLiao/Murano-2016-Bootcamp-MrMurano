--#ENDPOINT POST /canceltrigger
-- Description: cancel sms_trigger trigger
local parameters = {
 ["timer_id"] = "sms_trigger"
}

return Timer.cancel(parameters)

