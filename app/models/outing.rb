class Outing < ApplicationRecord

    before_destroy :destroy_all_outing_activities
    belongs_to :user
    has_many :outing_activities
    has_many :activities, through: :outing_activities
    #accepts_nested_attributes_for :activities
    


    def activities_attributes=(activity_attributes)
        activity_attributes.values.each do |activity_attribute|
            activity = Activity.find_or_create_by!(activity_attribute)
            self.activities << activity
        end
    end

    private

    def destroy_all_outing_activities
        self.outing_activities.destroy_all
    end
end
