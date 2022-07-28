class Outing < ApplicationRecord

    belongs_to :activity
    belongs_to :user
    belongs_to :child
    
end
