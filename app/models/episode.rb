class Episode < ApplicationRecord
    belongs_to :podcast
    has_one :publisher, through: :podcast

    def published
        publish_date.strftime("%B %d, %Y")
    end
end
