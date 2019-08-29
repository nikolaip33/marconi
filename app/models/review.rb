class Review < ApplicationRecord
    belongs_to :user
    belongs_to :podcast

    # validates_uniqueness_of :user_id

    scope :persisted, -> { where "id IS NOT NULL" }

    def date
        updated_at.strftime("%B %d, %Y")
    end

end
