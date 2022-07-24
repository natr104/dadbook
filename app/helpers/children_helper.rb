module ChildrenHelper
    def age(child)
        age = ((Time.zone.now - child.dob.to_time) / 1.year.seconds).floor
        if age < 1
            age = ((Time.zone.now - child.dob.to_time) / 1.month.seconds).floor
            return pluralize(age, 'month')
        end
        pluralize(age, 'year')
    end
end
