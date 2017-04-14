(1..10).each do |i|
    j = 0
    while (j < i)
        j += 1
        next if (j % 2 == 0)
        print "j is #{j} "

    end
    print "\n"
end