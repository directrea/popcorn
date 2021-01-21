class Seat < ApplicationRecord
    has_many :reservation_seats, dependent: :destroy
    has_many :reservations, through: :reservation_seats
    has_many :performance_seats, dependent: :destroy
    has_many :performances, through: :performance_seats
end
