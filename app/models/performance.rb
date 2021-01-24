class Performance < ApplicationRecord
    belongs_to :movie
    has_many :reservations, dependent: :destroy
    has_many :performance_seats, dependent: :destroy
    has_many :seats, through: :performance_seats

    validate :date_before_release_date

    def date_before_release_date
        errors.add(:screening_date, "は上映日以降のものを選択してください") if
        screening_date < Movie.find(movie_id).release_date
    end

end
