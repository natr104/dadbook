class Activity < ApplicationRecord
    has_many :users, through: :outings
    has_many :children, through: :outings
    has_many :outing_activities
    has_many :outings, through: :outing_activities

    validates :name, length: { minimum: 2 }
end
