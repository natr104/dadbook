class RemoveChildIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :child_id, :integer
  end
end
