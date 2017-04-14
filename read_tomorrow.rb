require 'yaml'
require 'date'
require 'twilio-ruby'

account_sid = "ACcd63323503898be25291931f6446ac7b"
auth_token = "7e718d766ed1bb36a6a884b23cc2f3ab"

client = Twilio::REST::Client.new account_sid, auth_token
plan = YAML.load(File.open("./new_plan.yaml"))

start_date = Date.new(2016, 2, 8)
day = Date.today + 1
diff = (day.jd - start_date.jd)
puts "Tommorrow is day #{diff}"

reading = plan[diff].join(",")

puts reading

from_no = "+14434264999"

send_to = {
    "+19194345801" => "Brian",
    "+14108617920" => "Charles",
    "+14432579410" => "Wayne",
    "+14104875336" => "Mark",
    "+12406447447" => "Max"
}

send_to.each do |key, value|
    client.account.messages.create(
        from: from_no,
        to: key,
        body: "Tomorrow's reading: #{reading}"
    )
end