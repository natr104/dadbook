class CreateOutings < ActiveRecord::Migration[6.1]
  def change
    create_table :outings do |t|
      t.datetime :outing_date
      t.belongs_to :user
      t.belongs_to :child
      t.timestamps
    end
  end
end
