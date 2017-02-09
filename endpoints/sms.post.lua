--#ENDPOINT POST /sms
-- Description: sms test
return Twilio.postMessage({
  From = "+16122551754",
  To = "+886935658234",
  Body = "Exosite Swimming Pool Notification\n"
})
