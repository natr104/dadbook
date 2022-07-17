class User < ApplicationRecord
    has_secure_password
    has_many :children

    validates :email, presence: true, uniqueness: true

    def welcome
        "Hello #{self.name}!"
    end


end
