titles = %w(月曜のmoon 火曜のfire 水曜のwater 木曜のtree 金曜のmoney 土曜のsoil 日曜のsun)
stories = %w(月曜のお話。 火曜のお話。 水曜のお話。 木曜のお話 金曜のお話 土曜のお話 日曜のお話。)
times = [90,120]
actors = "佐藤修 鈴木賢人 高橋花子 田中美紀 滑大郎"
0.upto(6) do |idx|
  Movie.create(
    title: titles[idx],
    story: stories[idx],
    release_date: "2021-01-07",
    running_time: times[idx%2],
    distribution: "西宝",
    director: "美弥咲　隼男",
    actor: actors,
    finished: 0
  )
end