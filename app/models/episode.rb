class Episode < ApplicationRecord
    belongs_to :podcast
    has_one :publisher, through: :podcast

    def self.latest
        order('publish_date DESC').limit(3)
    end


    def published_on
        publish_date.strftime("%B %d, %Y")
    end

    
end
