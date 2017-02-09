--#ENDPOINT POST /timertrigger
-- Description: create a weekly trigger to send SMS to user (timerid = sms_trigger)
local alert = {
  message = "trigger",
  timer = 3 * 60,
  timerid = "sms_trigger",
  timer_running = true
}

Timer.sendInterval({
    message = alert.message,
    duration = alert.timer * 1000,
    timer_id = alert.timerid
})

