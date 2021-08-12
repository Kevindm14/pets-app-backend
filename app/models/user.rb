class User < ApplicationRecord
    has_secure_password
    validates :first_name, :email, :password_digest, presence: true
    validates :email, uniqueness: true
    has_many :pets, dependent: :destroy

    def total_pets
        user.pets.count
    end
end
