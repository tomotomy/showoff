class User < ApplicationRecord
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 },
                      format:     { with: VALID_EMAIL_REGEX },
                      uniqueness: true
    validates :name, presence: true, length: { maximum: 255 }
    validates :profile, length: { maximum: 160 }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
