require 'yaml'

#books = [
#            {"name" => "Genesis", "code" => "Gen", "length" => 50},
#            {"name" => "Obadiah", "code" => "Ob", "length" => 1},
#            {"name" => "Revelation", "code" => "Rev", "length" => 22},
#            {"name" => "Jude", "code" => "Jude", "length" => 1},
#            {"name" => "Joshua", "code" => "Josh", "length" => 40}
#        ]
#File.write("bible.yaml", books.to_yaml)
books = YAML.load(File.open("./bible.yaml"))
order = [0,65]

chapters_per_day = 6
day = 0
start_day_of_week = 1 # 0 -> Sun, 6-> Sat
last_chapter = 4
weekday_only = true

book = books.shift
readings = []
done = false

while (book)

    read_today = 0
    reading_day = true
    today_reading = []

    # daily psalm || proverb
    psalm_prov_number = day % 181 + 1
    today_reading.push "Ps #{psalm_prov_number}" if psalm_prov_number <= 150
    today_reading.push "Pr #{psalm_prov_number - 150}" if psalm_prov_number > 150

    effective_day_of_week = day + start_day_of_week
    if ( effective_day_of_week%7==0 || effective_day_of_week%7==6)
        reading_day = false
    end

    while ( read_today < chapters_per_day && book && reading_day) do
        start_chapter = last_chapter + 1
        end_chapter = start_chapter + chapters_per_day - 1 - read_today

        if (start_chapter > book["length"])
            #today_reading.push "case 1"
            book = books.shift

            if (book.nil?)
                done = true
                today_reading.push "break"
            end

            last_chapter = 0
            next
        end

        if (end_chapter > book["length"])
            end_chapter = book["length"]

            if (start_chapter == end_chapter)
                today_reading.push "#{book["code"]} #{end_chapter}"
            else
                today_reading.push "#{book["code"]} #{start_chapter}-#{end_chapter}"
            end

            read_today += end_chapter - start_chapter + 1
            book = books.shift
            last_chapter = 0
            next
        end

        # middle of book, simple
        today_reading.push "#{book["code"]} #{start_chapter}-#{end_chapter}"
        read_today += chapters_per_day
        last_chapter = end_chapter
    end

    readings[day] = today_reading if !done
    day += 1
end

readings.each_with_index do |line, i|
    puts "Day #{i}: #{line}"
end

File.write("plan.yaml", readings.to_yaml)