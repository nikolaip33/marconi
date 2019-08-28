class Episode < ApplicationRecord
    belongs_to :podcast

    delegate :producer, :to => :podcast, :allow_nil => true
end
