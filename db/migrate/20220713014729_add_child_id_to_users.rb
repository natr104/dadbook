class AddChildIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :child_id, :integer
  end
end
