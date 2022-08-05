class Activity < ApplicationRecord
    
    has_many :outing_activities
    has_many :outings, through: :outing_activities
    has_many :users, through: :outings
    has_many :children, through: :users

end
