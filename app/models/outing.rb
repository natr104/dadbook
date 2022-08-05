class Outing < ApplicationRecord
    before_destroy :destroy_outing_activities
    belongs_to :user
    has_one :outing_activities
    has_one :activity, through: :outing_activities
    
    validates :outing_date, presence: :true

    def outing_activities_attributes=(act)
        if act[:name] != ""
            activity = Activity.find_or_create_by!(name: act[:name])
            self.activity = activity
            raise self.inspect
        end
    end

    def activity_id=(id)
        activity = Activity.find(id)
        self.build_outing_activities.save
        self.outing_activities.activity=activity
        self.save
        puts "==============================================="
        p self.outing_activities
    end
        

    def destroy_outing_activities
        self.outing_activities.destroy
    end

end
