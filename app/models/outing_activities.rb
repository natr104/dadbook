class OutingActivities < ApplicationRecord
    belongs_to :outing, inverse_of: :outing_activities
    belongs_to :activity, inverse_of: :outing_activities
end