class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :podcasts, through: :reviews

    validates :username, uniqueness: { case_sensitive: false }
end
