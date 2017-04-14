require 'dotenv/load'
require 'yaml'
require 'date'
require 'twilio-ruby'

account_sid = ENV["account_sid"]
auth_token = ENV["auth_token"]

client = Twilio::REST::Client.new account_sid, auth_token
plan = YAML.load(File.open("./new_plan.yaml"))

start_date = Date.new(2017, 2, 8)
day = Date.today
diff = (day.jd - start_date.jd)

reading = plan[diff].join(",")

from_no = ENV["from_number"]

send_to = YAML.load(File.open("./names.yaml"))

send_to.each do |key, value|
    client.account.messages.create(
        from: from_no,
        to: key,
        body: "Today's reading: #{reading}"
    )
end