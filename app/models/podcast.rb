class Podcast < ApplicationRecord
    belongs_to :publisher
    has_many :reviews
    has_many :users, through: :reviews
end
