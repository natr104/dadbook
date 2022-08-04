class AddReferenceToActivity < ActiveRecord::Migration[6.1]
  def change
    add_reference :activities, :outing, foreign_key: :true
  end
end
