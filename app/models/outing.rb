class Outing < ApplicationRecord
  belongs_to :user
  has_many :outing_activities, dependent: :destroy
  has_many :activities, through: :outing_activities
#   accepts_nested_attributes_for :activities, reject_if: :all_blank?

  def activities_attributes=(attributes)
    attributes.values.each do |activity_attribute|
      activity = Activity.find_or_create_by(activity_attribute)
      self.activities << activity
    end
  end

end
