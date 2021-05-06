class User < ApplicationRecord
    has_secure_password
    enum role: [:employee, :admin]
    has_many :teams, :dependent => :destroy
    has_many :projects, through: :teams, :dependent => :destroy

    validates :email, presence: true, uniqueness: true

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.name = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
end