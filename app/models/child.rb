class Child < ApplicationRecord
    belongs_to :user

    validates :dob, presence: true
    validates :name, length: { in: 2..40 }

    def age
        age = ((Time.zone.now - self.dob.to_time) / 1.year.seconds).floor
        if age < 1
            age = ((Time.zone.now - self.dob.to_time) / 1.month.seconds).floor
            return helper.pluralize(age, 'month')
        end
        helper.pluralize(age, 'year')
    end
end
