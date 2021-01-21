class Kind < ApplicationRecord
    has_many :kinds, dependent: :destroy
    has_many :reservations, through: :reservation_kinds
end
