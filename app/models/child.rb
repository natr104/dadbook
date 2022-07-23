class Child < ApplicationRecord
    belongs_to :user

    validates :dob, presence: true
    validates :name, length: { in: 2..40 }
end
