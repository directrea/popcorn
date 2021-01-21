class Reservation < ApplicationRecord
    has_many :reservation_seats, dependent: :destroy
    has_many :seats, through: :reservation_seats
    
    belongs_to :performance
    belongs_to :member
    belongs_to :kind

end
