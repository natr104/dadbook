class DropOutingsUsersTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :outings_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
