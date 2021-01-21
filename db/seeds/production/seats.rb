srow = %w(A B)
lrow = %w(C D E F G H)


srow.each do |e| 
    12.downto(3) do |n|
        Seat.create(
            en_number: e,
            number: n
        )
    end
end

lrow.each do |e|
    14.downto(1) do |n|
        Seat.create(
            en_number: e,
            number: n
        )
    end
end

