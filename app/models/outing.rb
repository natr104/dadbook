class Outing < ApplicationRecord
    before_destroy :destroy_outing_activity
    belongs_to :user
    has_one :outing_activity, dependent: :destroy
    has_one :activity, through: :outing_activity, dependent: :destroy
    scope :by_activity, -> (activity_id) {joins(:activity).where(activities: activity_id)}
    
    validates :outing_date, presence: :true

    def outing_activities_attributes=(act)
        if act[:name] != ""
            activity = Activity.find_or_create_by!(name: act[:name])
            self.activity = activity
        end
    end

    def activity_id=(id)
        activity = Activity.find(id)
        self.build_outing_activity.save
        self.outing_activity.activity=activity
        self.save
    end
        

    def destroy_outing_activity
        self.outing_activity.destroy
    end

    # def self.by_activity(activity_id)
    #     self.joins(:activity).where(activities: activity_id)
    # end

end
