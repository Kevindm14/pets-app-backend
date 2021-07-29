class User < ApplicationRecord
    has_secure_password
    validates :first_name, :email, :password_digest, presence: true

    validates :email, uniqueness: true
end
