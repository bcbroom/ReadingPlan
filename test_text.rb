require 'twilio-ruby'

account_sid = "ACcd63323503898be25291931f6446ac7b"
auth_token = "7e718d766ed1bb36a6a884b23cc2f3ab"

client = Twilio::REST::Client.new account_sid, auth_token

from_no = "+14434264999"

send_to = {
    "+19194345801" => "Brian"
}

send_to.each do |key, value|
    client.account.messages.create(
        from: from_no,
        to: key,
        body: "Test of sending from crontab"
    )
end
