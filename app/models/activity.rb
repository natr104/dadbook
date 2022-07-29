class Activity < ApplicationRecord
    
    has_many :outings
    has_many :users, through: :outings
    has_many :children, through: :outings

end
