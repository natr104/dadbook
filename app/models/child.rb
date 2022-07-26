class Child < ApplicationRecord
    belongs_to :user
    has_many :activities, through: :outings

    validates :dob, presence: true
    validates :name, length: { in: 2..40 }

end
