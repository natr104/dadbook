class Activity < ApplicationRecord
    has_many :users, through: :outings
    has_many :children, through: :outings
    has_many :outings

end
