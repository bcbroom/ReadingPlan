chapters_per_day = 6

books = [
            {"name" => "Genesis", "code" => "Gen", "length" => 50},
            {"name" => "Obadiah", "code" => "Ob", "length" => 1},
            {"name" => "Revelation", "code" => "Rev", "length" => 22},
            {"name" => "Jude", "code" => "Jude", "length" => 1},
            {"name" => "Joshua", "code" => "Josh", "length" => 40}
        ]

readings = []

day = 0
book = books.shift
last_chapter = 1
extra = 0

(1..15).each do |i|
    today_reading = []
    end_chapter = last_chapter + chapters_per_day - 1
    if (end_chapter > book["length"] )
        extra = end_chapter - book["length"]
        end_chapter = book["length"]
    end

    #puts "Day #{day}"

    if (extra > 0)
        today_reading.push "#{book["code"]} #{last_chapter} - #{end_chapter}" unless end_chapter < last_chapter
        book = books.shift
        last_chapter = 1
        end_chapter = last_chapter + extra - 1


        today_reading.push "#{book["code"]} #{last_chapter} - #{end_chapter}"

        last_chapter = end_chapter + 1
        extra = 0
    else
        today_reading.push "#{book["code"]} #{last_chapter} - #{end_chapter}"
        last_chapter = end_chapter + 1
    end

    readings[day] = today_reading
    day += 1
end

readings.each_with_index do |line, i|
    puts "Day #{i}: #{line}"
end