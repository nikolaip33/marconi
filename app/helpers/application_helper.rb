module ApplicationHelper
    def to_dates
        byebug
        self.strftime("%B %d, %Y")
    end
end
