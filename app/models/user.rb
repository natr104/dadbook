class User < ApplicationRecord
    has_secure_password
    has_many :children

    validates :email, presence: true, uniqueness: true
    validates :name, length: { in: 2..40 }
    

    def welcome
        "Hello #{self.name}!"
    end


end
