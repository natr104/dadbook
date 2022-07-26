class User < ApplicationRecord
    has_secure_password
    before_destroy :destroy_children
    has_many :children
    has_many :activities, through: :outings

    validates :name, length: { in: 2..40 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, length: { minimum: 6 }
    

    def welcome
        "Hello #{self.name}!"
    end

    private

    def destroy_children
        self.children.destroy_all
    end

end
