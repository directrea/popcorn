names = %w(admin member Hana John Mike Sophy Bill Alex Mary Tom)
fnames = ["admin", "鈴木", "高橋", "田中"]
gnames = ["admin", "次郎", "花子"]
0.upto(9) do |idx|
  Member.create(
    user_name: names[idx],
    full_name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    email: "#{names[idx]}@example.com",
    birthday: "1981-12-01",
    sex: [1, 1, 2][idx % 3],
    credit_number: idx,
    expiration_date: "2025-10-10",
    authentication_number: idx,
    administrator: (idx == 0),
    password: "pop",
    password_confirmation: "pop"
  )
end
