class ChangeDataTypeForDob < ActiveRecord::Migration[6.1]
  def change
    change_column(:children, :dob, :date)
  end
end
