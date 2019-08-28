class Podcast < ApplicationRecord
    belongs_to :publisher
    has_many :reviews
    has_many :users, through: :reviews

    validates :title, uniqueness: { case_sensitive: false }

    # accepts_nested_attributes_for :publisher

    def publisher_attributes=(attributes)
        byebug
        self.publisher = Publisher.find_or_create_by(attributes) if !attributes[:name].empty?
    end
end
