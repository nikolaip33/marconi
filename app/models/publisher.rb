class Publisher < ApplicationRecord
    has_many :podcasts
    has_many :reviews, through: :podcasts
    has_many :episodes, through: :podcasts

    validates :name, uniqueness: { case_sensitive: false }
end
