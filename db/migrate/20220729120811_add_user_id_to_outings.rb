class AddUserIdToOutings < ActiveRecord::Migration[6.1]
  def change
    # add_column :outings, :user_id, :integer
    add_reference :outings, :user, foreign_key: true
  end
end
