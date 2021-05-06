class Tool < ApplicationRecord
    has_many :project_tools, :dependent => :destroy
    has_many :projects, through: :project_tools, :dependent => :destroy
end
