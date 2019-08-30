class ReviewsController < ApplicationController

    def create
        if logged_in?

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
            redirect_to podcasts_path
        end
    end


    private

    def review_params
        params.require(:review).permit(:user_id, :podcast_id, :rating, :title, :comment)
    end
end
