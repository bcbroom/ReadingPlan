chapters_per_day = 6
#books = { "Gen" => 50, "Rev" => 22, "Josh" => 40 }

books = [
            {"name" => "Genesis", "code" => "Gen", "length" => 50},
            {"name" => "Revelation", "code" => "Rev", "length" => 22},
            {"name" => "Joshua", "code" => "Josh", "length" => 40}
        ]

readings = []

day = 0
book = books.shift
last_chapter = 1
extra = 0

(1..15).each do |i|
    end_chapter = last_chapter + chapters_per_day - 1
    if (end_chapter > book["length"] )
        extra = end_chapter - book["length"]
        end_chapter = book["length"]
    end

    #puts "Day #{day}"

    if (extra > 0)
        readings[day] = "#{book["code"]} #{last_chapter} - #{end_chapter}" unless end_chapter < last_chapter
        book = books.shift
        last_chapter = 1
        end_chapter = last_chapter + extra - 1

        if (readings[day])
            readings[day] = readings[day] + ", " + "#{book["code"]} #{last_chapter} - #{end_chapter}"
        else
            readings[day] = "#{book["code"]} #{last_chapter} - #{end_chapter}"
        end


        last_chapter = end_chapter + 1
        extra = 0
    else
        readings[day] = "#{book["code"]} #{last_chapter} - #{end_chapter}"
        last_chapter = end_chapter + 1
    end

    day += 1
end

readings.each_with_index do |line, i|
    puts "Day #{i}: #{line}"
end