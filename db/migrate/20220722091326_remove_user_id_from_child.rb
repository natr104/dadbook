class RemoveUserIdFromChild < ActiveRecord::Migration[6.1]
  def change
    remove_column :children, :user_id, :integer
  end
end
