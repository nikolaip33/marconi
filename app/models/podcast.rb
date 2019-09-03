class Podcast < ApplicationRecord
    belongs_to :publisher
    has_many :episodes
    has_many :reviews
    has_one :user, through: :publisher
    has_many :review_users, through: :reviews, source: :users

    validates :title, uniqueness: { case_sensitive: false }

    # accepts_nested_attributes_for :publisher

    def publisher_attributes=(attributes)
        self.publisher = Publisher.find_or_create_by(attributes) if !attributes[:name].empty?
    end
end
