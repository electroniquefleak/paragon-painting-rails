class User < ApplicationRecord
    has_secure_password
    enum role: [:employee, :admin]
    has_many :teams
    has_many :projects, through: :teams

    validates :email, presence: true, uniqueness: true

end