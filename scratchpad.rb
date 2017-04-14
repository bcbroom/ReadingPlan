books = {"Genesis" => 50, "Exodus" => 40, "Mark" => 16}

chapt_left = 1008.0
days_left = 130
day = 1

chapt_in_book = books["Genesis"]

while chapt_in_book > 0 do
    chapt_for_day = chapt_left / days_left
    print "Day #{day} read #{chapt_for_day} chapters\n"
    chapt_for_day = chapt_for_day.floor
    chapt_left -= chapt_for_day
    chapt_in_book -= chapt_for_day
    day += 1
    days_left -= 1
end

