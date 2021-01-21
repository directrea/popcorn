kind_names = %w(一般 大学生・高校生 幼児・小中高生 シニア)
fees = %w(2000 1800 1300 1300)

0.upto(3) do |idx|
    Kind.create(
        kind_name: kind_names[idx],
        fee: fees[idx]
    )
end