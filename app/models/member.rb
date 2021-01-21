class Member < ApplicationRecord
    has_secure_password

    has_many :reservations, dependent: :destroy
    
    validates :user_name, :full_name, presence: true
    validates :email, email: { allow_blank: true }
    validates :credit_number, :authentication_number, numericality: {only_integer: true}

    attr_accessor :current_password
    validates :password, presence: { if: :current_password}

end
