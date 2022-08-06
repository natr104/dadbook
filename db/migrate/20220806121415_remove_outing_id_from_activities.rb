class RemoveOutingIdFromActivities < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :outing_id, :bigint
  end
end
