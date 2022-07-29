class RemoveUserIdFromOutings < ActiveRecord::Migration[6.1]
  def change
    remove_column :outings, :user_id, :integer
  end
end
