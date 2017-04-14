require 'yaml'
require 'date'

plan = YAML.load(File.open("./new_plan.yaml"))

start_date = Date.new(2016, 2, 1)
day = Date.today
diff = (day.jd - start_date.jd)

reading = plan[diff].join(",")
puts reading
