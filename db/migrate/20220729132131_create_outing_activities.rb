class CreateOutingActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :outing_activities do |t|
      t.belongs_to :outing, index: true, foreign_key: true
      t.belongs_to :activity, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
