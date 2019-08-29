class ReviewsController < ApplicationController

    def create
        if logged_in?
            byebug
            @review = current_user.reviews.build(review_params)
            
            if @review.save
                redirect_to @review.podcast
            else
                redirect_to @review.podcast
            end
        else
            redirect_to login_path
        end
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
