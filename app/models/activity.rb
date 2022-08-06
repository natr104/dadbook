class Activity < ApplicationRecord
    
    before_destroy :destroy_outing_activities
    has_many :outing_activities, dependent: :destroy
    has_many :outings, through: :outing_activities, dependent: :destroy
    has_many :users, through: :outings
    has_many :children, through: :users

    def destroy_outing_activities
        self.outing_activities.each do |out_act|
            out_act.outing.destroy
            out_act.destroy
        end
    end

end
