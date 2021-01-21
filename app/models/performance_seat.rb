class PerformanceSeat < ApplicationRecord
    belongs_to :performance
    belongs_to :seat

    validates :seat_id, uniqueness: { scope: :performance_id }

end
