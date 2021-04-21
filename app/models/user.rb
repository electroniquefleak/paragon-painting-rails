class User < ApplicationRecord
    has_secure_password
    enum role: [:employee, :admin]

    has_many :projects
    has_many :tools

    validates :email, presence: true, uniqueness: true

    def admin?
        self.role.admin?
    end
end