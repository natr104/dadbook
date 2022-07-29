class Child < ApplicationRecord
    belongs_to :user
    has_many :outings, through: :users
    has_many :activities, through: :outings

    validates :dob, presence: true
    validates :name, length: { in: 2..40 }
    validates :sex, presence: true

end
