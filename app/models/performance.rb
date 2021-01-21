class Performance < ApplicationRecord
    belongs_to :movie
    has_many :reservations, dependent: :destroy
    has_many :performance_seats, dependent: :destroy
    has_many :seats, through: :performance_seats
end
