class RemoveActivityIdFromOutings < ActiveRecord::Migration[6.1]
  def change
    remove_column :outings, :activity_id, :integer
  end
end
