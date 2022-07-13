class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.string :name
      t.datetime :dob
      t.string :sex

      t.timestamps
    end
  end
end
