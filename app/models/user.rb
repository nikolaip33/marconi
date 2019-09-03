class User < ApplicationRecord
    has_secure_password

    has_many :publishers
    has_many :reviews
    has_many :podcasts, through: :publishers
    has_many :episodes, through: :podcasts
    has_many :reviewed_podcasts, through: :reviews, source: :podcasts

    validates :username, uniqueness: { case_sensitive: false }
end
