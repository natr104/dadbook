class CreateUsersOutingsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :outings_users, id: false do |t|
      t.integer :outing_id
      t.integer :user_id
    end

    add_index :outings_users, :user_id
    add_index :outings_users, :outing_id
  end
end
