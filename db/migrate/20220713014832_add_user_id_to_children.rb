class AddUserIdToChildren < ActiveRecord::Migration[6.1]
  def change
    add_column :children, :user_id, :integer
  end
end
