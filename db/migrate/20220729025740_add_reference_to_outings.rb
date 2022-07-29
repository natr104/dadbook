class AddReferenceToOutings < ActiveRecord::Migration[6.1]
  def change
    add_reference :outings, :activity, foreign_key: true
  end
end
