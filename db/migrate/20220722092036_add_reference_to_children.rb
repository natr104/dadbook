class AddReferenceToChildren < ActiveRecord::Migration[6.1]
  def change
    add_reference :children, :user, foreign_key: true
  end
end
