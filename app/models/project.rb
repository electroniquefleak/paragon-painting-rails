class Project < ApplicationRecord
    has_many :teams
    has_many :project_tools
    has_many :users, through: :teams
    has_many :tools, through: :project_tools, :dependent => :destroy
    has_many :project_comments

    accepts_nested_attributes_for :users, :tools, :project_comments, reject_if: :all_blank

    #validations:
    validates :name, presence: true, uniqueness: true
    validates :location, presence: true, uniqueness: true

    #scope
    scope :active, -> { where("? BETWEEN start_date AND end_date", Date.today)} 
    scope :past, -> { where('end_date < ?', Date.today)} 

    scope :future, -> { where('start_date > ?', Date.today)} 
end
