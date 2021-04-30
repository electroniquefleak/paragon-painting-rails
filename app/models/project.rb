class Project < ApplicationRecord
    has_many :teams
    has_many :project_tools
    has_many :users, through: :teams
    has_many :tools, through: :project_tools
    has_many :project_comments
end
