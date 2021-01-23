class Movie < ApplicationRecord
    has_many :performances, dependent: :destroy

    validates :title, :story, :release_date, :running_time, 
                :distribution, :director, :actor, presence: true

    validates :title,:distribution,:director, length: { maximum: 50 }
    validates :running_time, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validate :date_before_start


    def date_before_start
      errors.add(:start_date, "は今日以降のものを選択してください") if
      release_date < Date.today
    end


    class << self
        def search(query)
            movies = Movie.where(finished: 0)
            if query.present?
                movies.where(["title LIKE ?","%#{query}%"])
            else
                movies
            end
        end
    end
end
