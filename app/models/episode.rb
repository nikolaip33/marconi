class Episode < ApplicationRecord
    belongs_to :podcast
    has_one :publisher, through: :podcast
end
