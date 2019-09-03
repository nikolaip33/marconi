class Review < ApplicationRecord
    belongs_to :user
    belongs_to :podcast

    #validates_uniqueness_of :user_id, :scope => :podcast_id

    scope :persisted, -> { where.not(id: nil).order(updated_at: :desc) }
    scope :latest, -> { order(date_updated: :desc) }

    def date
        updated_at.strftime("%B %d, %Y")
    end

end
