class Child < ApplicationRecord
    belongs_to :parent, :class_name => "User"
end
