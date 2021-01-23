today = Date.today
date = [today+1.day,today+2.day,today+3.day]
stime = ['12:00','15:00','18:00']
etime = %w(13:30 16:30 19:30)

1.upto(7) do |idx|
    0.upto(2) do |n|
        Performance.create(
            movie_id: idx,
            screening_date: date[n],
            start_time: stime[n],
            end_time: etime[n],
            screen: n+1
        )
    end
end