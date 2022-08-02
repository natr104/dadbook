class Activity < ApplicationRecord
    
    has_many :outings, through: :outing_activities
    has_many :outing_activities, dependent: :destroy
    has_many :users, through: :outings
    has_many :children, through: :outings

    validates :name, length: { in: 2..40 }, presence: true

end
