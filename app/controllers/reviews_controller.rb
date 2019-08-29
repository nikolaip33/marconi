class ReviewsController < ApplicationController

    def create
        @review = current_user.reviews.build(review_params)
        byebug
    end

    def edit
        
    end

    def index
        if @podcast = Podcast.find_by(id: params[:podcast_id])
            @reviews = @podcast.reviews
        else
            @reviews = Review.all
        end
    end


    private

    def review_params
        params.require(:review).permit(:user_id, :podcast_id, :rating, :title, :comment)
    end
end
