class Project < ApplicationRecord
    has_many :teams
    has_many :project_tools
    has_many :users, through: :teams
    has_many :tools, through: :project_tools
    has_many :project_comments

    accepts_nested_attributes_for :users, :tools, :project_comments

    #validations:
    validates :name, presence: true, uniqueness: true
    validates :location, presence: true, uniqueness: true

end
