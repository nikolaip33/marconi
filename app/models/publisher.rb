class Publisher < ApplicationRecord
    has_many :podcasts
    has_many :reviews, through: :podcasts
end
