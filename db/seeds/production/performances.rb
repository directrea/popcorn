date = %w(2021-01-01 2021-01-02 2021-01-03)
stime = ['12:00','15:00','18:00']
etime = %w(13:30 16:30 19:30)

1.upto(10) do |idx|
    0.upto(2) do |n|
        Performance.create(
            movie_id: idx,
            screening_date: date[n],
            start_time: stime[n],
            end_time: etime[n]
        )
    end
end